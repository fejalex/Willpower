#include "Database.h"

#include <QQmlEngine>

namespace wp
{

FoldersList* Database::getFoldersList()
{
    return &m_foldersList;
}

Database::Database(DataStorage<Database>* const dataStorage, QObject* const parent)
    : QObject(parent)
    , r_dataStorage(dataStorage)
{
    r_dataStorage->setDataPointer(this);
    // Prevents the field from being deleted by QML JavaScript engine.
    QQmlEngine::setObjectOwnership(&m_foldersList, QQmlEngine::CppOwnership);

    if (!r_dataStorage->tryLoadData())
    {
        r_dataStorage->saveData();
    }
}

QJsonObject Database::saveToJson() const
{
    // TODO: replace this testing code with an actual implementation.
    QJsonObject json;
    json.insert("text", QJsonValue(QString("test")));
    return json;
}

void Database::loadFromJson(const QJsonObject& json)
{
    // TODO: replace this testing code with an actual implementation.
    const auto it = json.find("text");

    if (it != json.end() && *it == "test")
    {
        qDebug() << "Success";
    }
};

} // namespace wp
