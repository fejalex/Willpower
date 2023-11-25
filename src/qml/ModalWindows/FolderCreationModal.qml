import QtQuick
import QtQuick.Controls as Controls
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    anchors.fill: parent

    visible: false

    function show() {
        checkboxEditable.isChecked = false
        checkboxDeletable.isChecked = false
        folderNameTextField.text = ""

        element.visible = true

        folderNameTextField.focus = true
    }

    function close() {
        element.visible = false
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
                id: test
                text: "Create folder"
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

                placeholderText: "Folder title"

                placeholderTextColor: Variables.placeholderColor
                selectionColor: Variables.selectionBgColor

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

            RowLayout {
                Layout.alignment: Qt.AlignRight

                spacing: 16

                Button {
                    horizontalPadding: 16
                    verticalPadding: 8

                    backgroundColor: Variables.greenAccentColor

                    cornerRadius: 8

                    text: "Create"
                    font { family: Variables.generalFont; pixelSize: 16 }

                    onClicked: {
                        console.log("Create folder clicked")
                    }
                }

                Button {
                    horizontalPadding: 16
                    verticalPadding: 8

                    backgroundColor: Variables.greyAccentColor

                    cornerRadius: 8

                    text: "Cancel"
                    font { family: Variables.generalFont; pixelSize: 16 }

                    onClicked: {
                        element.close()
                    }
                }
            }
        }
    }
}
