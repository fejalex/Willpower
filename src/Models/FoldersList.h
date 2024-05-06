#pragma once

#include <QAbstractListModel>

#include "RecordsFolder.h"

namespace wp
{
class FoldersList : public QAbstractListModel
{
    Q_OBJECT

public:
    Q_INVOKABLE RecordsFolder* getFolderAt(qint64 index);

public:
    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int = Qt::DisplayRole) const override;
    QHash<int, QByteArray> roleNames() const override;

public:
    explicit FoldersList(QObject* parent = nullptr);
    ~FoldersList() override = default;

    FoldersList(const FoldersList&) = delete;
    FoldersList(FoldersList&&) = delete;

    FoldersList& operator=(const FoldersList&) = delete;
    FoldersList& operator=(FoldersList&&) = delete;

private:
    QList<RecordsFolder> m_recordsFolders;
};
} // namespace wp
