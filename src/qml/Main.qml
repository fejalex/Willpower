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

            iconSvg: "qrc:/src/resources/icons/menu.svg"

            iconWidthToHeightRatio: 0.875

            title: "Folder name"

            onButtonClicked: {
                console.log("Top bar button clicked.")
            }
        }

        Button {
            id: playPauseButton

            height: 56
            width: height

            anchors { right: parent.right; bottom: parent.bottom; rightMargin: 16; bottomMargin: 16 }

            backgroundColor: Variables.greenAccentColor

            cornerRadius: height / 2

            iconSvg: "qrc:/src/resources/icons/play.svg"

            iconWidthToHeightRatio: 0.917
        }
    }
}
