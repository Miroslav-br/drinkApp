import QtQuick
import QtQuick.Controls
import App.Controllers
import Core

Rectangle {
    id: root
    property var stack: StackView.view
    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 30
        bottomMargin: 30
    }

    width: parent.width
    color: Colors.transparent

    Timer {
        id: finishTimer
        interval: 2000 // 2s
        running: false
        onTriggered: {
            SystemController.drinkTemperature = SystemController.NONE;
            SystemController.drinkSize = SystemController.NOSIZE;
            SystemController.sugarLevel = 0;

            root.stack.pop(null);
        }
    }

    Component.onCompleted: finishTimer.start()

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            top: parent.top
            topMargin: 10
            bottomMargin: 10
        }

        width: parent.width * 0.5
        color: "transparent"

        Image {
            id: drinkImg
            source: Resources.image(SystemController.selectedDrink.glassImage)

            anchors.fill: parent
            fillMode: Image.PreserveAspectFit
        }
    }

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
            top: parent.top
            topMargin: 10
            bottomMargin: 10
        }

        width: parent.width * 0.5
        color: "transparent"

        Image {
            id: checkImg
            source: Resources.image("finish")
            anchors.centerIn: parent
            width: 200
            height: 200
        }

        Text {
            id: enjoyText
            text: "Enjoy your drink..."
            color: "white"
            font.pixelSize: 50
            anchors {
                horizontalCenter: parent.horizontalCenter

                top: checkImg.bottom
                bottomMargin: 30
            }
        }
    }
}
