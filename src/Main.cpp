#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>
#include <QStandardPaths>
#include <QFile>
#include <QDir>

#ifdef Q_OS_ANDROID
    #include <QJniObject>
    #include <QColor>
#endif // Q_OS_ANDROID

#include "AppData/Database.h"

int main(int argc, char* argv[])
{
    QCoreApplication::setApplicationName("Willpower");

    QGuiApplication app(argc, argv);

    QQuickStyle::setStyle("Basic");

#ifdef Q_OS_ANDROID
    QJniObject activity = QNativeInterface::QAndroidApplication::context();
    QJniObject window = activity.callObjectMethod("getWindow", "()Landroid/view/Window;");
    window.callMethod<void>("setStatusBarColor", "(I)V", QColor(0x22212c).rgba());
#endif // Q_OS_ANDROID

    QQmlApplicationEngine engine;

    const QUrl url(QStringLiteral("qrc:/src/View/Main.qml"));

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

    auto appDataLocation
        = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation)
          + "/data.json";
    wp::DataStorage<wp::Database> dataStorage(appDataLocation);

    wp::Database database(&dataStorage);

    engine.rootContext()->setContextProperty("cpp_database", &database);

    engine.load(url);

    return QGuiApplication::exec();
}
