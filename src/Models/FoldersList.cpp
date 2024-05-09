#include "FoldersList.h"

#include <QQmlEngine>
#include <QJsonArray>

#include "AppData/Database.h"

namespace wp
{
RecordsFolder* FoldersList::getFolderAt(const qint64 index)
{
    if (index < 0 || index >= m_recordsFolders.size())
    {
        return nullptr;
    }

    const auto item = &m_recordsFolders[index];

    // Prevents the item from being deleted by QML JavaScript engine.
    QQmlEngine::setObjectOwnership(item, QQmlEngine::CppOwnership);

    return item;
}

void FoldersList::createFolder(const QString& title)
{
    const auto insertionPosition = static_cast<int>(m_recordsFolders.size());
    beginInsertRows(QModelIndex(), insertionPosition, insertionPosition);

    m_recordsFolders.emplace_back(r_dataStorage, title.data());

    endInsertRows();

    r_dataStorage->saveData();
}

int FoldersList::rowCount(const QModelIndex&) const
{
    return static_cast<int>(m_recordsFolders.size());
}

QVariant FoldersList::data(const QModelIndex& index, const int role) const
{
    if (role != Qt::UserRole || index.row() < 0 || index.row() >= m_recordsFolders.size())
    {
        return QVariant {};
    }

    return m_recordsFolders.at(index.row()).getName();
}

QHash<int, QByteArray> FoldersList::roleNames() const
{
    return QHash<int, QByteArray> {
        {Qt::UserRole, "textValue"},
    };
}

FoldersList::FoldersList(DataStorage<Database>* dataStorage, QObject* const parent)
    : QAbstractListModel(parent)
    , r_dataStorage(dataStorage)
{
    m_recordsFolders.emplace_back(dataStorage, u"Default");
}

QJsonValue FoldersList::saveToJson() const
{
    QJsonObject result;

    QJsonArray recordsFolders;
    for (const auto& timeRecord : m_recordsFolders)
    {
        recordsFolders.push_back(timeRecord.saveToJson());
    }

    result.insert("recordsFolders", recordsFolders);

    return result;
}

void FoldersList::loadFromJson(const QJsonValue& json)
{
    const QJsonObject object = json.toObject();

    const auto recordsFolders = object.value("recordsFolders").toArray();

    m_recordsFolders.clear();
    m_recordsFolders.reserve(recordsFolders.size());

    for (const auto& timeRecord : recordsFolders)
    {
        RecordsFolder value(r_dataStorage);
        value.loadFromJson(timeRecord);
        m_recordsFolders.emplace_back(std::move(value));
    }

    if (m_recordsFolders.empty())
    {
        m_recordsFolders.emplace_back(r_dataStorage, u"Default");
    }
};

} // namespace wp
