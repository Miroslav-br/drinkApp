import QtQuick
import QtQuick.Controls
import Components
import Core
import App.Controllers

Rectangle {
    id: root

    readonly property var stack: StackView.view

    Component.onCompleted: {
        SystemController.startPreparing();
    }

    Component {
        id: finishedView
        FinishedView {}
    }

    anchors {
        fill: parent
        topMargin: 20
        bottomMargin: 20
    }

    color: Colors.transparent

    MyLoader {
        id: loader
        anchors.centerIn: parent
        width: parent.width * 0.1
        height: width
    }

    Text {
        text: "Preparing drink"
        font.pixelSize: Fonts.sizeNormal
        color: Colors.secondary

        anchors {
            top: loader.bottom
            topMargin: 30
            horizontalCenter: parent.horizontalCenter
        }
    }

    Connections {
        target: SystemController
        function onDrinkPreparationFinished() {
            root.stack.push(finishedView);
        }
    }
}
