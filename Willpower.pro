QT += quick \
      quickcontrols2 \ # For QQuickStyle.

CONFIG += c++17

INCLUDEPATH += $${PWD}/src/Models

SOURCES += \
        src/Models/AppData/Database.cpp \
        src/Models/FoldersList.cpp \
        src/Models/RecordsFolder.cpp \
        src/Models/TimeRecord.cpp \
        src/Models/ActiveTimer.cpp \
        src/Main.cpp \

HEADERS += \
        src/Models/AppData/DataStorage.hpp \
        src/Models/AppData/Database.h \
        src/Models/Utils/Duration.h \
        src/Models/Utils/CopyableQObject.h \
        src/Models/FoldersList.h \
        src/Models/RecordsFolder.h \
        src/Models/TimeRecord.h \
        src/Models/ActiveTimer.h \

RESOURCES += qml.qrc

OTHER_FILES += android/AndroidManifest.xml

# Default generated rules for deployment.
qnx: target.path = /tmp/$${TARGET}/build
else: unix:!android: target.path = /opt/$${TARGET}/build
!isEmpty(target.path): INSTALLS += target

contains(ANDROID_TARGET_ARCH,arm64-v8a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
