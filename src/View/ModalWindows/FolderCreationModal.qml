import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    anchors.fill: parent

    visible: false

    states: [
        State {
            name: "CreateFolder"
            PropertyChanges { target: modalTitle; text: "Create folder" }
            PropertyChanges { target: confirmButton; text: "Create" }
            PropertyChanges { target: confirmButton; onClicked: {
                        cpp_database.getFoldersList().createFolder(folderNameTextField.text);
                        element.close();
                    } }
            PropertyChanges { target: element; visible: true }
            PropertyChanges { target: folderNameTextField; text: "" }
            PropertyChanges { target: folderNameTextField; focus: true }
        }
    ]

    function showCreateFolder() {
        element.state = "CreateFolder"
    }

    function close() {
        folderNameTextField.focus = false;
        element.state = ""
    }

    Fade {
        onClicked: {
            folderNameTextField.focus = false
        }
    }

    Rectangle {
        anchors.centerIn: parent

        width: parent.width - 40
        height: createFolderModalItems.height + 32

        radius: 8

        color: Variables.backgroundColor

        ColumnLayout {
            id: createFolderModalItems

            anchors { top: parent.top; left: parent.left; right: parent.right; margins: 16 }

            spacing: 16

            Text {
                id: modalTitle

                color: Variables.foregroundColor
                font { family: Variables.generalFont; pixelSize: 16; weight: Font.Bold }
                Layout.fillWidth: true

                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Controls.TextField {
                id: folderNameTextField

                implicitHeight: 38
                Layout.fillWidth: true

                leftPadding: 12
                rightPadding: 12

                focus: false

                placeholderText: "Folder title"

                placeholderTextColor: Variables.placeholderColor
                selectionColor: Variables.textSelectionBgColor

                selectByMouse: true

                background: Rectangle {
                    color: Variables.greyAccentColor
                    radius: 8
                }

                font {
                    family: Variables.generalFont
                    pixelSize: 16
                }

                color: Variables.foregroundColor
            }

            RowLayout {
                Layout.alignment: Qt.AlignRight

                spacing: 16

                Button {
                    id: confirmButton

                    active: folderNameTextField.text != ""

                    horizontalPadding: 16
                    verticalPadding: 8

                    backgroundColor: Variables.greenAccentColor

                    cornerRadius: 8

                    font { family: Variables.generalFont; pixelSize: 16 }
                }

                Button {
                    horizontalPadding: 16
                    verticalPadding: 8

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: 8

                    text: "Cancel"
                    font { family: Variables.generalFont; pixelSize: 16 }

                    onClicked: {
                        element.close();
                    }
                }
            }
        }
    }
}
