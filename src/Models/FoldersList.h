#pragma once

#include <QAbstractListModel>

#include "RecordsFolder.h"
#include "AppData/DataStorage.hpp"

namespace wp
{

class Database;

class FoldersList : public QAbstractListModel
{
    Q_OBJECT

public:
    Q_INVOKABLE RecordsFolder* getFolderAt(qint64 index);
    Q_INVOKABLE void createFolder(const QString& title);

public:
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public:
    FoldersList(DataStorage<Database>* dataStorage, QObject* parent = nullptr);
    ~FoldersList() override = default;

    FoldersList(const FoldersList&) = delete;
    FoldersList(FoldersList&&) = delete;

    FoldersList& operator=(const FoldersList&) = delete;
    FoldersList& operator=(FoldersList&&) = delete;

private:
    QList<RecordsFolder> m_recordsFolders;
    DataStorage<Database>* r_dataStorage;
};

} // namespace wp
