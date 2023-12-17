import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"
import "../Sidebar"
import "../ModalWindows"

Item {
    id: element

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

        TimerButtons {
            anchors { right: parent.right; bottom: parent.bottom }

            onPlayClicked: {
                console.log("Play clicked")
            }
            onPauseClicked: {
                console.log("Pause clicked")
            }
            onStopClicked: {
                console.log("Stop clicked")
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
