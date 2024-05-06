#include "Database.h"

#include <QQmlEngine>

namespace wp
{

FoldersList* Database::getFoldersList()
{
    return &m_foldersList;
}

Database::Database(QObject* const parent)
    : QObject(parent)
{
    // Prevents the field from being deleted by QML JavaScript engine.
    QQmlEngine::setObjectOwnership(&m_foldersList, QQmlEngine::CppOwnership);
};

} // namespace wp
