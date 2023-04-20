import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    property string title: Variables.initialTopBarTitle

    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor

    property string iconSvg: ""

    signal buttonClicked()

    Rectangle {
        id: background

        anchors.fill: parent

        color: element.backgroundColor

        RowLayout {
            anchors.fill: parent

            Button {
                visible: element.iconSvg !== ""

                Layout.fillHeight: true
                Layout.preferredWidth: height

                width: element.height;
                height: element.height

                backgroundColor: "transparent"
                foregroundColor: element.foregroundColor

                iconSvg: element.iconSvg

                onClicked: {
                    element.buttonClicked()
                }
            }

            Text {
                id: titleText

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                color: element.foregroundColor

                font { pixelSize: Variables.topBarTextSize; bold: true; }

                text: element.title
            }
        }
    }
}
