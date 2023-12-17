import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"
import "../Sidebar"
import "../ModalWindows"

Item {
    id: element

    property bool isTimerRunning: false
    property bool isTimerPaused: false

    anchors.fill: parent

    Rectangle {
        anchors.fill: parent
        color: Variables.backgroundColor

        TopBar {
            id: topBar

            anchors { left: parent.left; right: parent.right; top: parent.top }
            z: 2

            height: 56

            backgroundColor: Variables.backgroundColor
            foregroundColor: Variables.foregroundColor

            iconProperties: Variables.iconMenu24

            title: "Default"

            onButtonClicked: {
                sidebar.show()
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

                ActiveTimeRecord {
                    Layout.fillWidth: true
                }
                ActiveTimeRecord {
                    Layout.fillWidth: true
                    isPaused: true
                }

                TimeRecord {
                    Layout.fillWidth: true

                    onDeleteClicked: {
                        recordDeletionModal.display()
                    }
                }
                TimeRecord {
                    Layout.fillWidth: true
                    isEditable: false

                    onDeleteClicked: {
                        recordDeletionModal.display()
                    }
                }
                TimeRecord {
                    Layout.fillWidth: true
                    isDeletable: false

                    onDeleteClicked: {
                        recordDeletionModal.display()
                    }
                }
                TimeRecord {
                    Layout.fillWidth: true
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

            iconProperties: Variables.iconPlay24

            onClicked: {
                if(!element.isTimerRunning) {
                    if(!element.isTimerPaused)
                    {
                        anchors.bottomMargin = 88
                        stopButton.anchors.rightMargin = 16
                    }

                    element.isTimerRunning = true
                    element.isTimerPaused = false

                    backgroundColor = Variables.yellowAccentColor
                    iconProperties = Variables.iconPause24
                }
                else {
                    element.isTimerRunning = false
                    element.isTimerPaused = true

                    backgroundColor = Variables.greenAccentColor

                    iconProperties = Variables.iconPlay24
                }
            }

            Behavior on anchors.bottomMargin {
                NumberAnimation {
                    duration: 120
                }
            }
        }

        Button {
            id: stopButton

            height: 56
            width: height

            anchors { right: parent.right; bottom: parent.bottom; rightMargin: -height; bottomMargin: 16 }

            backgroundColor: Variables.redAccentColor

            cornerRadius: height / 2

            iconProperties: Variables.iconStop24

            onClicked: {
                element.isTimerRunning = false
                element.isTimerPaused = false

                playPauseButton.backgroundColor = Variables.greenAccentColor
                playPauseButton.iconProperties = Variables.iconPlay24

                playPauseButton.anchors.bottomMargin = 16
                anchors.rightMargin = -height
            }

            Behavior on anchors.rightMargin {
                NumberAnimation {
                    duration: 120
                }
            }
        }
    }

    DeletionModal {
        id: recordDeletionModal

        function display() {
            show("Are you sure that you want to delete the time record?")
        }

        onDeleteClicked: {
            console.log("Delete time record clicked")
        }
    }

    Sidebar {
        id: sidebar
    }
}
