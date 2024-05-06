#pragma once

#include <QObject>

#include "FoldersList.h"

namespace wp
{
class Database : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE FoldersList* getFoldersList();

public:
    explicit Database(QObject* parent = nullptr);
    ~Database() override = default;

    Database(const Database&) = delete;
    Database(Database&&) = delete;

    Database& operator=(Database&&) = delete;
    Database& operator=(const Database&) = delete;

private:
    FoldersList m_foldersList;
};
} // namespace wp
