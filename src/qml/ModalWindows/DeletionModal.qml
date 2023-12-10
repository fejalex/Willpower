import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.
import "../Reusable"

Item {
    id: element

    anchors.fill: parent

    visible: false

    function close() {
        element.visible = false
    }

    function show(question) {
        modalQuestion.text = question
        element.visible = true
    }

    Fade { }

    signal deleteClicked()

    Rectangle {
        anchors.centerIn: parent

        width: parent.width - 40
        height: items.height + 32

        radius: 8

        color: Variables.backgroundColor

        ColumnLayout {
            id: items

            anchors { top: parent.top; left: parent.left; right: parent.right; margins: 16 }

            spacing: 16

            Text {
                id: modalQuestion
                Layout.fillWidth: true

                text: "Are you sure?"
                wrapMode: Text.WordWrap
                color: Variables.foregroundColor
                font { family: Variables.generalFont; pixelSize: 16 }
            }

            RowLayout {
                Layout.alignment: Qt.AlignRight

                spacing: 16

                Button {
                    id: confirmButton

                    horizontalPadding: 16
                    verticalPadding: 8

                    backgroundColor: Variables.redAccentColor

                    cornerRadius: 8

                    text: "Delete"
                    font { family: Variables.generalFont; pixelSize: 16 }

                    onClicked: {
                        element.deleteClicked()
                        element.close()
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
