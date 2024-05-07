import QtQuick

import ".." // For using Variables.qml.

Rectangle {
    id: element

    anchors.fill: parent

    color: Variables.fadeColor

    opacity: Variables.fadePower

    signal clicked()

    MouseArea {
        anchors.fill: parent
        cursorShape: "ArrowCursor"

        onClicked: {
            element.clicked()
        }
    }
}
