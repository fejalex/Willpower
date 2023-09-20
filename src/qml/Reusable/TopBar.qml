import QtQuick
import QtQuick.Layouts

import ".." // For using Variables.qml.

Item {
    id: element

    property string title: Variables.initialTopBarTitle

    property string backgroundColor: Variables.backgroundColor
    property string foregroundColor: Variables.foregroundColor

    property string iconSvg: ""
    property real iconWidthToHeightRatio: 1

    signal buttonClicked()

    Rectangle {
        id: background

        anchors.fill: parent

        color: element.backgroundColor

        RowLayout {
            anchors.fill: parent
            spacing: 0

            Button {
                visible: element.iconSvg !== ""

                Layout.fillHeight: true
                Layout.preferredWidth: height

                width: element.height;
                height: element.height

                backgroundColor: element.backgroundColor
                foregroundColor: element.foregroundColor

                iconSvg: element.iconSvg

                iconWidthToHeightRatio: element.iconWidthToHeightRatio

                onClicked: {
                    element.buttonClicked()
                }
            }

            Text {
                id: titleText

                Layout.fillWidth: true
                Layout.alignment: Qt.AlignVCenter

                color: element.foregroundColor

                font { family: Variables.generalFont; pixelSize: 20; weight: Font.DemiBold }

                text: element.title
            }
        }
    }
}
