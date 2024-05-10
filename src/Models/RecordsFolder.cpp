#include "RecordsFolder.h"

#include <QQmlEngine>
#include <QJsonArray>

#include "Database.h"

namespace wp
{

QString RecordsFolder::getName() const
{
    return m_name;
}

TimeRecord* RecordsFolder::getTimeRecordAt(const qint64 index)
{
    if (index < 0 || index >= m_timeRecords.size())
    {
        return nullptr;
    }

    const auto item = &m_timeRecords[index];

    // Prevents the item from being deleted by QML JavaScript engine.
    QQmlEngine::setObjectOwnership(item, QQmlEngine::CppOwnership);

    return item;
}

ActiveTimer* RecordsFolder::getActiveTimer()
{
    QQmlEngine::setObjectOwnership(&m_activeTimer, QQmlEngine::CppOwnership);

    return &m_activeTimer;
}

void RecordsFolder::appendTimeRecord(const DurationInt seconds)
{
    beginInsertRows(QModelIndex(), 0, 0);
    m_timeRecords.emplace_back(Seconds {seconds});
    endInsertRows();

    r_dataStorage->saveData();
}

int RecordsFolder::rowCount(const QModelIndex&) const
{
    return static_cast<int>(m_timeRecords.size());
}

QVariant RecordsFolder::data(const QModelIndex& index, const int role) const
{
    if (role != Qt::UserRole || index.row() < 0 || index.row() >= m_timeRecords.size())
    {
        return QVariant {};
    }

    // Reversing index to show the most recently added entries first;
    auto it = m_timeRecords.crbegin();
    std::advance(it, index.row());
    return it->getTimeText();
}

QHash<int, QByteArray> RecordsFolder::roleNames() const
{
    return QHash<int, QByteArray> {
        {Qt::UserRole, "textValue"},
    };
}

RecordsFolder::RecordsFolder(DataStorage<Database>* const dataStorage,
                             const QStringView name,
                             QObject* const parent)
    : QAbstractListModel(parent)
    , m_name(name.toString())
    , m_activeTimer(dataStorage)
    , r_dataStorage(dataStorage)
{ }

RecordsFolder::RecordsFolder(const RecordsFolder& other) noexcept
    : QAbstractListModel(other.parent())
    , m_name(other.m_name)
    , m_activeTimer(other.m_activeTimer)
    , m_timeRecords(other.m_timeRecords)
    , r_dataStorage(other.r_dataStorage)
{ }

RecordsFolder::RecordsFolder(RecordsFolder&& other) noexcept
    : QAbstractListModel(other.parent())
    , m_name(std::exchange(other.m_name, ""))
    , m_activeTimer(other.m_activeTimer)
    , m_timeRecords(std::exchange(other.m_timeRecords, {}))
    , r_dataStorage(other.r_dataStorage)
{ }

RecordsFolder& RecordsFolder::operator=(const RecordsFolder& other) noexcept
{
    if (this == &other)
    {
        return *this;
    }

    setParent(other.parent());
    m_name = other.m_name;
    m_activeTimer = other.m_activeTimer;
    m_timeRecords = other.m_timeRecords;
    r_dataStorage = other.r_dataStorage;

    return *this;
}

RecordsFolder& RecordsFolder::operator=(RecordsFolder&& other) noexcept
{
    setParent(other.parent());
    m_name = std::exchange(other.m_name, "");
    m_activeTimer = std::exchange(other.m_activeTimer, ActiveTimer {other.r_dataStorage});
    m_timeRecords = std::exchange(other.m_timeRecords, {});
    r_dataStorage = other.r_dataStorage;

    return *this;
}

QJsonValue RecordsFolder::saveToJson() const
{
    QJsonObject result;

    QJsonArray timeRecords;
    for (const auto& timeRecord : m_timeRecords)
    {
        timeRecords.push_back(timeRecord.saveToJson());
    }

    result.insert("name", m_name);
    result.insert("activeTimer", m_activeTimer.saveToJson());
    result.insert("timeRecords", timeRecords);

    return result;
}

void RecordsFolder::loadFromJson(const QJsonValue& json)
{
    const QJsonObject object = json.toObject();

    m_name = object.value("name").toString("");
    m_activeTimer.loadFromJson(object.value("activeTimer"));

    const auto timeRecords = object.value("timeRecords").toArray();

    m_timeRecords.clear();
    m_timeRecords.reserve(timeRecords.size());

    for (const auto& timeRecord : timeRecords)
    {
        TimeRecord value;
        value.loadFromJson(timeRecord);
        m_timeRecords.emplace_back(std::move(value));
    }
}

} // namespace wp
