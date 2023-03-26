import QtQuick
import QtQuick.Window

import "Reusable"

Window {
    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: qsTr(Variables.windowTitle)

    Rectangle{
        anchors.fill: parent
        color: Variables.backgroundColor

        TopBar {
            anchors { left: parent.left; right: parent.right; top: parent.top }
            height: 56
        }

        Text {
            anchors.centerIn: parent
            color: Variables.foregroundColor
            text: "Hello world!"
            font.pixelSize: 30
        }
    }
}
