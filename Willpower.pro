QT += quick

CONFIG += c++17

SOURCES += \
        src/Main.cpp

RESOURCES += qml.qrc

# Default generated rules for deployment.
qnx: target.path = /tmp/$${TARGET}/build
else: unix:!android: target.path = /opt/$${TARGET}/build
!isEmpty(target.path): INSTALLS += target
