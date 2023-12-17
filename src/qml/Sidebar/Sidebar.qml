import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"
import "../ModalWindows"

Item {
    id: element
    anchors.fill: parent

    visible: false

    function show() {
        element.visible = true
    }

    function close() {
        element.visible = false
    }

    Fade { }

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

            iconProperties: Variables.iconClose24

            title: "Folders"

            onButtonClicked: {
                element.close()
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
                    onEditClicked: {
                        createFolderModal.showEditFolder(title)
                    }
                }

                FolderOption {
                    Layout.fillWidth: true
                    isSelected: true
                    onEditClicked: {
                        createFolderModal.showEditFolder(title)
                    }
                }

                FolderOption {
                    Layout.fillWidth: true
                    onEditClicked: {
                        createFolderModal.showEditFolder(title)
                    }
                }

                FolderOption {
                    Layout.fillWidth: true
                    onEditClicked: {
                        createFolderModal.showEditFolder(title)
                    }
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

                // Spacer
                Item {
                    Layout.fillWidth: true
                }

                Button {
                    id: themeSwitcher

                    property bool isLightThemeEnabled: false

                    Layout.preferredHeight: 56
                    Layout.preferredWidth: height

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: height / 2

                    iconProperties: isLightThemeEnabled ? Variables.iconMoon24 : Variables.iconSun24

                    onClicked: {
                        isLightThemeEnabled = !isLightThemeEnabled
                    }
                }

                Button {
                    id: settingsButton

                    Layout.preferredHeight: 56
                    Layout.preferredWidth: height

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: height / 2

                    iconProperties: Variables.iconSettings24

                    onClicked: {
                        console.log("Settings button clicked")
                    }
                }

                Button {
                    id: createFolderButton

                    Layout.preferredHeight: 56
                    Layout.preferredWidth: height

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: height / 2

                    iconProperties: Variables.iconPlus24

                    onClicked: {
                        createFolderModal.showCreateFolder()
                    }
                }
            }
        }
    }

    FolderCreationModal {
        id: createFolderModal
    }
}
