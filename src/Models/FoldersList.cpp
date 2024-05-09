#include "FoldersList.h"

#include <QQmlEngine>

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
    // TODO: Remove this initialization which was created for testing purposes.
    m_recordsFolders.emplace_back(dataStorage, u"Hello");
    m_recordsFolders.emplace_back(dataStorage, u"World");
    m_recordsFolders.back().getTimeRecordAt(0)->setValue(Seconds {0});
};

} // namespace wp
