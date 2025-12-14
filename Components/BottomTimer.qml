import QtQuick
import Core

Rectangle {
    id: timeRect

    Text {
        id: timeRectText

        anchors {
            right: parent.right
            verticalCenter: parent.verticalCenter
        }

        color: Colors.secondary
        font.pixelSize: Fonts.sizeNormal
        text: Qt.formatDateTime(new Date(), "hh:mm:ss")

        Timer {
            interval: 1000
            repeat: true
            running: true
            onTriggered: parent.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
        }
    }
}
