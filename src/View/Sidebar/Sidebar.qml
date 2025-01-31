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

    property int currentFolder: 0
    property double sidebarWidth: parent.width * 0.8

    function show() {
        showAnimation.running = true;
    }

    function close() {
        hideAnimation.running = true;
    }
    
    Item {
        id: _

        property double showingCompletion: 0
    }

    Fade {
        id: fade

        opacity: _.showingCompletion * Variables.fadePower
    }

    Rectangle {
        id: sidebar
        anchors { left: parent.left; top: parent.top; bottom: parent.bottom;
                  leftMargin: (1 - _.showingCompletion) * -element.sidebarWidth }

        width: element.sidebarWidth

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

                Repeater {
                    model: cpp_database.getFoldersList()

                    delegate: FolderOption {
                        required property int index
                        required property string textValue // Exported from C++

                        Layout.fillWidth: true

                        title: textValue
                        isSelected: index == element.currentFolder
                        
                        onEditClicked: {
                            createFolderModal.showEditFolder(title)
                        }
                        onSelected: {
                            element.currentFolder = index;
                            element.close();
                        }
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

            property int maxButtonSize: (width - padding * 4) / 3

            RowLayout {
                id: sidebarButtonsRow
                anchors { fill: parent; margins: sidebarButtons.padding }
                spacing: sidebarButtons.padding

                // Spacer
                Item {
                    Layout.fillWidth: true
                }

                Button {
                    Layout.preferredHeight: Math.min(56, sidebarButtons.maxButtonSize)
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

        PropertyAnimation {
            id: hideAnimation
            duration: 150

            target: _
            property: "showingCompletion"
            to: 0

            onRunningChanged: {
                if(!running)
                {
                    element.visible = false
                }
            }
        }

        PropertyAnimation {
            id: showAnimation
            duration: 150

            target: _
            property: "showingCompletion"
            to: 1

            onRunningChanged: {
                if(running)
                {
                    element.visible = true
                }
            }
        }
    }

    MouseArea {
        id: closer

        anchors { left: sidebar.right; right: parent.right; top: parent.top; bottom: parent.bottom }

        onClicked: {
            element.close()
        }
    }

    FolderCreationModal {
        id: createFolderModal
    }
}
