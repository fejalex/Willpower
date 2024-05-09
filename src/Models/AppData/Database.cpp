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
    , m_foldersList(dataStorage)
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

QJsonValue Database::saveToJson() const
{
    QJsonObject object;

    object.insert("foldersList", m_foldersList.saveToJson());

    return object;
}

void Database::loadFromJson(const QJsonValue& json)
{
    const auto object = json.toObject();

    m_foldersList.loadFromJson(object.value("foldersList"));
};

} // namespace wp
