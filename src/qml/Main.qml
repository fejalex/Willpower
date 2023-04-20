import QtQuick
import QtQuick.Window

import "Reusable"
import "RecordsList"

Window {
    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: qsTr(Variables.windowTitle)

    Rectangle{
        anchors.fill: parent
        color: Variables.backgroundColor

        TopBar {
            id: topBar

            anchors { left: parent.left; right: parent.right; top: parent.top }

            height: 56

            backgroundColor: Variables.topBarBgColor
            foregroundColor: Variables.topBarFgColor

            iconSvg: Variables.menuIconSvg

            title: "Folder name"

            onButtonClicked: {
                console.log("Top bar button clicked.")
            }
        }

        BottomBar {
            id: bottomBar

            anchors { left: parent.left; right: parent.right; bottom: parent.bottom }
        }
    }
}
