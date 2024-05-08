import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ActiveTimer

import ".." // For using Variables.qml.
import "../Reusable"
import "../Sidebar"
import "../ModalWindows"

Item {
    id: element

    anchors.fill: parent

    Item {
        id: _

        function getCurrentFolder()
        {
            return cpp_database.getFoldersList().getFolderAt(sidebar.currentFolder);
        }

        function getActiveTimer()
        {
            return getCurrentFolder().getActiveTimer();
        }
    }

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

            title: _.getCurrentFolder().getName();

            onButtonClicked: {
                sidebar.show()
            }
        }

        Flickable {
            anchors { top: topBar.bottom; bottom: parent.bottom; left: parent.left; right: parent.right }

            flickableDirection: Flickable.VerticalFlick

            contentHeight: timeRecords.height

            boundsBehavior: Flickable.StopAtBounds

            ActiveTimeRecord {
                id: activeTimeRecord

                readonly property int hidingMargin: -(height + timeRecords.spacing)

                anchors {
                    left: parent.left
                    right: parent.right
                    leftMargin: 8
                    rightMargin: 8

                    top: parent.top
                    topMargin: hidingMargin
                }

                visible: _.getActiveTimer().status !== ActiveTimer.Stopped
                status: _.getActiveTimer().status

                onTick: {
                    text = _.getActiveTimer().getElapsedTimeText()
                }

                onVisibleChanged: {
                    if(visible)
                    {
                        showActiveTimeRecord.running = true;
                    }
                    else
                    {
                        showActiveTimeRecord.running = false;
                        anchors.topMargin = Qt.binding(function() { return hidingMargin })
                    }
                }

                PropertyAnimation {
                    id: showActiveTimeRecord

                    target: activeTimeRecord
                    property: "anchors.topMargin"

                    to: 0
                    duration: 200
                    easing.type: Easing.OutCubic
                }
            }

            ColumnLayout {
                id: timeRecords

                anchors {
                    top: activeTimeRecord.bottom
                    topMargin: spacing

                    left: parent.left
                    right: parent.right
                    leftMargin: 8
                    rightMargin: 8
                }

                Repeater {
                    model: _.getCurrentFolder()

                    delegate: TimeRecord {
                        required property string textValue // Exported from C++

                        Layout.fillWidth: true

                        text: textValue
                        isEditable: false
                        isDeletable: false
                    }
                }

                // For timer buttons to not overlap time records.
                Rectangle {
                    Layout.fillWidth: true

                    // I'm sorry for this hell.
                    implicitHeight: activeTimeRecord.visible ?
                                        timerButtons.buttonSize * 2 + timerButtons.edgeMargin * 3
                                            - timeRecords.spacing - activeTimeRecord.hidingMargin :
                                        timerButtons.buttonSize + timerButtons.edgeMargin * 2
                                            - timeRecords.spacing

                    color: Variables.backgroundColor
                }
            }
        }

        TimerButtons {
            id: timerButtons

            anchors { right: parent.right; bottom: parent.bottom }

            status: _.getActiveTimer().status

            onPlayClicked: {
                _.getActiveTimer().start();
            }
            onPauseClicked: {
                _.getActiveTimer().pause();
            }
            onStopClicked: {
                let elapsedSeconds = _.getActiveTimer().stop();
                _.getCurrentFolder().appendTimeRecord(elapsedSeconds);
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

        onCurrentFolderChanged: {
            activeTimeRecord.refresh();
        }
    }
}
