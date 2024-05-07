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
                        console.log("Create folder clicked");
                        element.close();
                    } }
            PropertyChanges { target: element; visible: true }
            PropertyChanges { target: checkboxEditable; visible: true }
            PropertyChanges { target: checkboxDeletable; visible: true }
            PropertyChanges { target: checkboxEditable; isChecked: false }
            PropertyChanges { target: checkboxDeletable; isChecked: false }
            PropertyChanges { target: folderNameTextField; text: "" }
            PropertyChanges { target: numberSelector; number: 0 }
            PropertyChanges { target: element; visible: true }
            PropertyChanges { target: folderNameTextField; focus: true }
            PropertyChanges { target: deleteButton; visible: false }
        },
        State {
            name: "EditFolder"
            PropertyChanges { target: modalTitle; text: "Edit folder" }
            PropertyChanges { target: confirmButton; text: "Save" }
            PropertyChanges { target: confirmButton; onClicked: {
                        console.log("Save folder properties clicked");
                        element.close();
                    } }
            PropertyChanges { target: element; visible: true }
            PropertyChanges { target: checkboxEditable; visible: false }
            PropertyChanges { target: checkboxDeletable; visible: false }
            PropertyChanges { target: folderNameTextField; text: "" }
            PropertyChanges { target: numberSelector; number: 0 }
            PropertyChanges { target: element; visible: true }
            PropertyChanges { target: folderNameTextField; focus: true }
            PropertyChanges { target: deleteButton; visible: true }
        }
    ]

    function showCreateFolder() {
        element.state = "CreateFolder"
    }

    function showEditFolder(currentTitle) {
        element.state = "EditFolder"
        folderNameTextField.text = currentTitle
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

            LabeledCheckbox {
                id: checkboxEditable

                Layout.fillWidth: true

                foregroundColor: Variables.foregroundColor
                backgroundColor: Variables.backgroundColor
                accentColor: Variables.greyAccentColor
                secondaryColor: Variables.placeholderColor

                text: "Editable time records"
                hintText: "This property can't be changed later"
            }

            LabeledCheckbox {
                id: checkboxDeletable

                Layout.fillWidth: true

                foregroundColor: Variables.foregroundColor
                backgroundColor: Variables.backgroundColor
                accentColor: Variables.greyAccentColor
                secondaryColor: Variables.placeholderColor

                text: "Deletable time records"
                hintText: "This property can't be changed later"
            }

            NumberSelector {
                id: numberSelector

                Layout.fillWidth: true

                font { family: Variables.generalFont; pixelSize: 16 }

                foregroundColor: Variables.foregroundColor
                backgroundColor: Variables.backgroundColor
                accentColor: Variables.greyAccentColor
                secondaryColor: Variables.placeholderColor
            }

            Button {
                id: deleteButton

                Layout.preferredHeight: 38

                verticalPadding: 2
                spacing: 12

                foregroundColor: Variables.redAccentColor
                backgroundColor: Variables.backgroundColor

                iconProperties: Variables.iconDelete16

                text: "Delete folder"
                font { family: Variables.generalFont; pixelSize: 16; weight: 600 }

                onClicked: {
                    folderDeletionModal.display()
                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignRight

                spacing: 16

                Button {
                    id: confirmButton

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

    DeletionModal {
        id: folderDeletionModal

        function display() {
            show("Are you sure that you want to delete the folder?");
        }

        onDeleteClicked: {
            console.log("Delete folder clicked");
            element.close();
        }
    }
}
