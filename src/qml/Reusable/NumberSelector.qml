import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    Item {
        id: _

        property int numberLength: 3
    }

    property int minNumber: 0
    property int maxNumber: 999

    property int number: 0

    property string title: "Select number:"

    property string foregroundColor: "white"
    property string backgroundColor: "black"
    property string accentColor: "blue"
    property string secondaryColor: "grey"

    property alias font: title.font

    implicitHeight: Math.max(title.height, decrementButton.height, numberText.height, incrementButton.height)

    onMaxNumberChanged: {
        // Do this only "once" for optimization.
        _.numberLength = maxNumber.toString().length
    }

    function padNum() {
        return String(element.number).padStart(_.numberLength, '0')
    }

    Row {
        anchors { left: parent.left; right: parent.right }
        spacing: 16

        Text {
            id: title

            color: element.foregroundColor

            wrapMode: Text.WordWrap

            height: parent.height

            verticalAlignment: Text.AlignVCenter

            text: element.title
        }

        RowLayout {
            Button {
                id: decrementButton

                enabled: element.number > element.minNumber

                Layout.preferredHeight: 32
                Layout.preferredWidth: height

                Layout.alignment: Qt.AlignLeft

                foregroundColor: enabled ? element.foregroundColor : element.secondaryColor
                backgroundColor: enabled ? element.accentColor : element.backgroundColor

                borderColor: element.accentColor
                borderWidth: 2

                cornerRadius: 8

                iconSvg: "qrc:/src/resources/icons/chevron-down.svg"
                iconWidth: 14
                iconHeight: 16

                onClicked: {
                    --element.number
                }
            }

            Text {
                id: numberText

                Layout.fillHeight: true

                color: element.foregroundColor
                font { family: Variables.monospaceFont; pixelSize: 16; }

                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap

                text: padNum()
            }

            Button {
                id: incrementButton

                enabled: element.number < element.maxNumber

                Layout.preferredHeight: 32
                Layout.preferredWidth: height

                Layout.alignment: Qt.AlignLeft

                foregroundColor: enabled ? element.foregroundColor : element.secondaryColor
                backgroundColor: enabled ? element.accentColor : element.backgroundColor

                borderColor: element.accentColor
                borderWidth: 2

                cornerRadius: 8

                iconSvg: "qrc:/src/resources/icons/chevron-up.svg"
                iconWidth: 14
                iconHeight: 16

                onClicked: {
                    ++element.number
                }
            }
        }
    }
}
