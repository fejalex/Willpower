import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    height: itemsRow.height
    implicitHeight: height

    property bool isChecked: false

    property string foregroundColor: "white"
    property string backgroundColor: "black"
    property string accentColor: "blue"
    property string secondaryColor: "grey"

    property string text: "Check box"
    property string hintText: ""

    RowLayout {
        id: itemsRow
        spacing: 8

        anchors { left: parent.left; right: parent.right }

        Button {
            Layout.preferredHeight: 32
            Layout.preferredWidth: height

            Layout.alignment: Qt.AlignVCenter

            foregroundColor: element.isChecked ? element.foregroundColor : element.secondaryColor
            backgroundColor: element.isChecked ? element.accentColor : element.backgroundColor

            borderColor: element.accentColor
            borderWidth: 2

            cornerRadius: 8

            iconProperties: Variables.iconTick16

            onClicked: {
                console.log("Check box unset")
            }
        }

        ColumnLayout {
            spacing: 0
            Text {
                Layout.fillWidth: true

                font { family: Variables.generalFont; pixelSize: 16 }
                color: element.foregroundColor

                text: element.text
                wrapMode: Text.WordWrap
            }
            Text {
                visible: element.hintText != ""
                
                Layout.fillWidth: true

                font { family: Variables.generalFont; pixelSize: 12 }
                color: element.secondaryColor
                
                text: element.hintText
                wrapMode: Text.WordWrap
            }
        }
    }

    MouseArea {
        anchors.fill: parent

        cursorShape: "PointingHandCursor"

        onClicked: {
            element.isChecked = !element.isChecked
        }
    }
}
