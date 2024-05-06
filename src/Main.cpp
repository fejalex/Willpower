#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "Database/Database.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/src/qml/Main.qml"));

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreated, &app,
        [url](const QObject* const obj, const QUrl& objUrl) {
            if (obj == nullptr && url == objUrl)
            {
                QCoreApplication::exit(-1);
            }
        },
        Qt::QueuedConnection);

    qmlRegisterUncreatableType<wp::ActiveTimer>("ActiveTimer", 1, 0, "ActiveTimer",
                                                "Access to active timer states enum.");

    wp::Database database;

    engine.rootContext()->setContextProperty("cpp_database", &database);

    engine.load(url);

    return QGuiApplication::exec();
}
