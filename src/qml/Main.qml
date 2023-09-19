import QtQuick
import QtQuick.Window

import "Reusable"

Window {
    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: qsTr(Variables.applicationName)

    Rectangle{
        anchors.fill: parent
        color: Variables.backgroundColor

        TopBar {
            id: topBar

            anchors { left: parent.left; right: parent.right; top: parent.top }

            height: 56

            backgroundColor: Variables.backgroundColor
            foregroundColor: Variables.foregroundColor

            iconSvg: Variables.menuIconSvg

            title: "Folder name"

            onButtonClicked: {
                console.log("Top bar button clicked.")
            }
        }
    }
}
