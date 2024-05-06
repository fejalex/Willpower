QT += quick

CONFIG += c++17

SOURCES += \
        src/Main.cpp \
        src/Database/Database.cpp \
        src/Database/FoldersList.cpp \
        src/Database/RecordsFolder.cpp \
        src/Database/TimeRecord.cpp \

HEADERS += \
        src/Database/Database.h \
        src/Database/FoldersList.h \
        src/Database/RecordsFolder.h \
        src/Database/TimeRecord.h \

RESOURCES += qml.qrc

# Default generated rules for deployment.
qnx: target.path = /tmp/$${TARGET}/build
else: unix:!android: target.path = /opt/$${TARGET}/build
!isEmpty(target.path): INSTALLS += target
