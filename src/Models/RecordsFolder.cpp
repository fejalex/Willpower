#include "RecordsFolder.h"

#include <QQmlEngine>

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

Q_INVOKABLE ActiveTimer* RecordsFolder::getActiveTimer()
{
    QQmlEngine::setObjectOwnership(&m_activeTimer, QQmlEngine::CppOwnership);

    return &m_activeTimer;
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

    return m_timeRecords.at(index.row()).getTimeText();
}

QHash<int, QByteArray> RecordsFolder::roleNames() const
{
    return QHash<int, QByteArray> {
        {Qt::UserRole, "textValue"},
    };
}

RecordsFolder::RecordsFolder(QObject* const parent)
    : RecordsFolder(QStringView {}, parent)
{ }

RecordsFolder::RecordsFolder(const QStringView name, QObject* const parent)
    : QAbstractListModel(parent)
    , m_name(name.toString())
{
    // TODO: Remove this initialization which was created for testing purposes.
    m_timeRecords.emplace_back(Seconds {5});
    m_timeRecords.emplace_back(Seconds {2});
    m_timeRecords.emplace_back(Seconds {3});
    m_timeRecords.emplace_back(Seconds {7});
}

RecordsFolder::RecordsFolder(const RecordsFolder& other) noexcept
    : QAbstractListModel(other.parent())
    , m_name(other.m_name)
    , m_timeRecords(other.m_timeRecords)
{ }

RecordsFolder::RecordsFolder(RecordsFolder&& other) noexcept
    : QAbstractListModel(other.parent())
    , m_name(std::exchange(other.m_name, ""))
    , m_timeRecords(std::exchange(other.m_timeRecords, {}))
{ }

RecordsFolder& RecordsFolder::operator=(const RecordsFolder& other) noexcept
{
    if (this == &other)
    {
        return *this;
    }

    setParent(other.parent());
    m_name = other.m_name;
    m_timeRecords = other.m_timeRecords;

    return *this;
}

RecordsFolder& RecordsFolder::operator=(RecordsFolder&& other) noexcept
{
    setParent(other.parent());
    m_name = std::exchange(other.m_name, "");
    m_timeRecords = std::exchange(other.m_timeRecords, {});

    return *this;
}

} // namespace wp
