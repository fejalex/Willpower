QT += quick

CONFIG += c++17

SOURCES += \
        src/Main.cpp \
        src/Models/Database.cpp \
        src/Models/FoldersList.cpp \
        src/Models/RecordsFolder.cpp \
        src/Models/TimeRecord.cpp \
        src/Models/ActiveTimer.cpp \

HEADERS += \
        src/Models/Database.h \
        src/Models/FoldersList.h \
        src/Models/RecordsFolder.h \
        src/Models/TimeRecord.h \
        src/Models/ActiveTimer.h \

RESOURCES += qml.qrc

# Default generated rules for deployment.
qnx: target.path = /tmp/$${TARGET}/build
else: unix:!android: target.path = /opt/$${TARGET}/build
!isEmpty(target.path): INSTALLS += target
