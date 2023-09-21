import QtQuick
import QtQuick.Window
import QtQuick.Layouts

import "Reusable"
import "RecordsList"

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
            z: 2

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

        Flickable {
            anchors { top: topBar.bottom; bottom: parent.bottom; left: parent.left; right: parent.right }

            flickableDirection: Flickable.VerticalFlick

            contentHeight: timeRecords.height

            boundsBehavior: Flickable.StopAtBounds

            ColumnLayout {
                anchors { left: parent.left; right: parent.right; leftMargin: 8; rightMargin: 8 }
                id: timeRecords

                TimeRecord {
                    Layout.fillWidth: true
                    height: 36
                }
                TimeRecord {
                    Layout.fillWidth: true
                    height: 36
                    isEditable: false
                }
                TimeRecord {
                    Layout.fillWidth: true
                    height: 36
                    isDeletable: false
                }
                TimeRecord {
                    Layout.fillWidth: true
                    height: 36
                    isEditable: false
                    isDeletable: false
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 80

                    color: Variables.backgroundColor
                }
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

            iconWidth: 22
            iconHeight: 24

            onClicked: {
                console.log("Start timer button clicked.")
            }
        }
    }
}
