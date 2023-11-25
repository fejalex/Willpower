import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

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

            iconSvg: "qrc:/src/resources/icons/close.svg"
            iconWidth: 18
            iconHeight: 24

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

                    iconSvg: "qrc:/src/resources/icons/sun.svg"

                    iconWidth: 24
                    iconHeight: 24

                    onClicked: {
                        if (isLightThemeEnabled)
                        {
                            iconSvg = "qrc:/src/resources/icons/sun.svg"
                            iconWidth = 24
                            iconHeight = 24
                        }
                        else
                        {
                            iconSvg = "qrc:/src/resources/icons/moon.svg"
                            iconWidth = 18
                            iconHeight = 24
                        }

                        isLightThemeEnabled = !isLightThemeEnabled
                    }
                }

                Button {
                    id: settingsButton

                    Layout.preferredHeight: 56
                    Layout.preferredWidth: height

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: height / 2

                    iconSvg: "qrc:/src/resources/icons/settings.svg"

                    iconWidth: 24
                    iconHeight: 24

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

                    iconSvg: "qrc:/src/resources/icons/plus.svg"

                    iconWidth: 21
                    iconHeight: 24

                    onClicked: {
                        createFolderModal.show()
                    }
                }
            }
        }
    }
}
