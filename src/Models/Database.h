#pragma once

#include <QObject>

#include "Utils/DataStorage.hpp"
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
    QJsonValue saveToJson() const;
    void loadFromJson(const QJsonValue& json);

private:
    FoldersList m_foldersList;

    DataStorage<Database>* r_dataStorage;
};
} // namespace wp
