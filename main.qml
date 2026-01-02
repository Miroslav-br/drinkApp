import QtQuick
import QtQuick.Controls
import Components
import Core
import App.Views

ApplicationWindow {
    id: root
    width: 1280
    height: 840
    visible: true
    color: Colors.primary

    Rectangle {
        id: topLine
        width: parent.width * 0.95
        height: 1
        anchors {
            top: parent.top
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
    }
    Component {
        id: page
        // HotCoolSelectView {}
        LoadingIndicatorView {}
    }

    StackView {
        id: rootStack
        anchors {
            top: topLine.bottom
            bottom: bottomLine.top
        }
        width: parent.width
        initialItem: page
    }

    Rectangle {
        id: bottomLine
        width: parent.width * 0.95
        height: 1
        anchors {
            bottom: bottomPanel.top
            horizontalCenter: parent.horizontalCenter
        }
    }

    Rectangle {
        id: bottomPanel
        height: 48
        width: parent.width
        color: Colors.transparent

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 50
            rightMargin: 50
        }

        NavigationButton {
            anchors {
                left: parent.left
            }
            visible: rootStack.depth > 1
            width: 100
            height: parent.height
            color: Colors.primary
            text: "Back"

            sourceImage: "back"

            onClicked: rootStack.pop()
        }
        NavigationButton {
            anchors {
                verticalCenter: parent.verticalCenter
                horizontalCenter: parent.horizontalCenter
            }
            visible: rootStack.depth > 2
            width: 100
            height: parent.height
            color: Colors.primary

            text: "Restart"

            reversed: true

            sourceImage: "restart"

            onClicked: rootStack.pop(null)
        }
        BottomTimer {
            anchors {
                right: parent.right
            }
            width: parent.width * 0.3
            color: Colors.transparent
            height: parent.height
        }
    }
}
