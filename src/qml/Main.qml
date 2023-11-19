import QtQuick
import QtQuick.Window
import QtQuick.Layouts

import "Reusable"
import "RecordsList"
import "Sidebar"

Window {
    id: window

    width: Variables.windowWidth
    height: Variables.windowHeight
    visible: true
    title: qsTr(Variables.applicationName)

    property bool isTimerRunning: false
    property bool isTimerPaused: false

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
            iconWidth: 21
            iconHeight: 24

            title: "Default"

            onButtonClicked: {
                sidebarContainer.visible = true
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
                }
                TimeRecord {
                    Layout.fillWidth: true
                    isEditable: false
                }
                TimeRecord {
                    Layout.fillWidth: true
                    isDeletable: false
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

            iconSvg: "qrc:/src/resources/icons/play.svg"

            iconWidth: 22
            iconHeight: 24

            onClicked: {
                if(!window.isTimerRunning) {
                    if(!window.isTimerPaused)
                    {
                        anchors.bottomMargin = 88
                        stopButton.anchors.rightMargin = 16
                    }

                    window.isTimerRunning = true
                    window.isTimerPaused = false

                    backgroundColor = Variables.yellowAccentColor
                    iconSvg = "qrc:/src/resources/icons/pause.svg"
                    iconWidth = 15
                    iconHeight = 24
                }
                else {
                    window.isTimerRunning = false
                    window.isTimerPaused = true

                    backgroundColor = Variables.greenAccentColor
                    iconSvg = "qrc:/src/resources/icons/play.svg"
                    iconWidth = 22
                    iconHeight = 24
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

            iconSvg: "qrc:/src/resources/icons/stop.svg"

            iconWidth: 18
            iconHeight: 24

            onClicked: {
                window.isTimerRunning = false
                window.isTimerPaused = false

                playPauseButton.backgroundColor = Variables.greenAccentColor
                playPauseButton.iconSvg = "qrc:/src/resources/icons/play.svg"
                playPauseButton.iconWidth = 22
                playPauseButton.iconHeight = 24

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

    Item {
        id: sidebarContainer
        anchors.fill: parent

        visible: false

        Rectangle {
            anchors.fill: parent

            color: Variables.fadeColor

            opacity: 0.8

            MouseArea {
                anchors.fill:parent
                cursorShape: "ArrowCursor"
            }
    }

    Rectangle {
        id: sidebar
        anchors { fill: parent; rightMargin: parent.width * 0.2 }

        color: Variables.backgroundColor

        TopBar {
            id: sidebarTopBar
            anchors { left: parent.left; right: parent.right; top: parent.top }
            z: 2

            height: 56

            backgroundColor: Variables.backgroundColor
            foregroundColor: Variables.foregroundColor

            iconSvg: "qrc:/src/resources/icons/close.svg"
            iconWidth: 18
            iconHeight: 24

            title: "Folders"

            onButtonClicked: {
                    sidebarContainer.visible = false
            }
        }

        Flickable {
            anchors { top: sidebarTopBar.bottom; bottom: sidebarButtons.top; left: parent.left; right: parent.right }

            flickableDirection: Flickable.VerticalFlick

            contentHeight: folders.height

            boundsBehavior: Flickable.StopAtBounds

            ColumnLayout {
                anchors { left: parent.left; right: parent.right; }
                id: folders

                spacing: 0

                FolderOption {
                    Layout.fillWidth: true
                }

                FolderOption {
                    Layout.fillWidth: true
                    isSelected: true
                }

                FolderOption {
                    Layout.fillWidth: true
                }

                FolderOption {
                    Layout.fillWidth: true
                }
            }
        }

        Rectangle {
            id: sidebarButtons
            anchors { left: parent.left; right: parent.right; bottom: parent.bottom }

            color: Variables.backgroundColor

            readonly property real padding: 8

            height: 56 + padding * 2

            RowLayout {
                id: sidebarButtonsRow
                anchors { fill: parent; margins: sidebarButtons.padding }
                spacing: sidebarButtons.padding

                Button {
                    id: createFolderButton

                    height: 56
                    width: height

                    Layout.alignment: Qt.AlignRight

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: height / 2

                    iconSvg: "qrc:/src/resources/icons/plus.svg"

                    iconWidth: 21
                    iconHeight: 24

                    onClicked: {
                        console.log("Create folder clicked")
                    }
                }
            }
        }
    }
}
