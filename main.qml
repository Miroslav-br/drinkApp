import QtQuick
import QtQuick.Controls
import Commons
import App.Views

Window {
    id: root
    width: 1280
    height: 840
    visible: true
    color: Colors.primary

    Rectangle {
        id: timeRect
        anchors.top: parent.top
        anchors.left: topLine.left
        width: parent.width * 0.3
        color: Colors.transparent
        height: 48
        Text {
            id: timeRectText
            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
            color: Colors.secondary
            font.pixelSize: 24
            text: Qt.formatDateTime(new Date(), "hh:mm:ss")
            Timer {
                interval: 1000
                repeat: true
                running: true
                onTriggered: parent.text = Qt.formatDateTime(new Date(), "hh:mm:ss")
            }
        }
    }

    Rectangle {
        id: topLine
        width: parent.width * 0.95
        height: 1
        anchors {
            top: parent.top
            topMargin: 40
            horizontalCenter: parent.horizontalCenter
        }
    }

    StackView {
        id: rootStack
        anchors.fill: parent
        objectName: "rootStack"
        initialItem: DrinkSizeSelectionView {
            stackParentView: rootStack
        }
    }

    Rectangle {
        id: bottomLine
        width: parent.width * 0.95
        height: 1
        anchors {
            bottom: parent.bottom
            bottomMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
    }
}
