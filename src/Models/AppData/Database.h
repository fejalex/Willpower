#pragma once

#include <QObject>

#include "DataStorage.hpp"
#include "FoldersList.h"

namespace wp
{
class Database : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE FoldersList* getFoldersList();

public:
    explicit Database(DataStorage<Database>* dataStorage, QObject* parent = nullptr);
    ~Database() override = default;

    Database(const Database&) = delete;
    Database(Database&&) = delete;

    Database& operator=(Database&&) = delete;
    Database& operator=(const Database&) = delete;

public:
    QJsonObject saveToJson() const;
    void loadFromJson(const QJsonObject& json);

private:
    DataStorage<Database>* r_dataStorage;
    FoldersList m_foldersList;
};
} // namespace wp
