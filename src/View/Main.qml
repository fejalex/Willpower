import QtQuick
import QtQuick.Window

import "RecordsList"

Window {
    id: window

    visible: true

    width: Variables.windowWidth
    height: Variables.windowHeight

    title: Variables.applicationName

    color: Variables.backgroundColor

    RecordsList {
        id: recordsList
    }
}
