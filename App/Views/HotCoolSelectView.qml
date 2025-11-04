import QtQuick
import QtQuick.Controls 2.15
import Commons
import App.Views

Rectangle {
    id: hotCoolSelectView
    property StackView stackParentView: null

    Component {
        id: coffeeSelectViewComponent
        CoffeeSelectView {
            stackParentView: hotCoolSelectView.stackParentView
        }
    }

    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 30
        bottomMargin: 30
    }
    width: parent.width
    color: Colors.transparent

    Rectangle {
        id: coolButton
        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width * 0.5
        color: Colors.transparent

        Image {
            id: coolImage
            source: "qrc:/images/cool"
            anchors {
                top: parent.top
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width
            fillMode: Image.PreserveAspectFit
            height: parent.height * 0.7
        }

        Text {
            id: coolButtonText
            text: qsTr("Cool")
            anchors {
                top: coolImage.bottom
                horizontalCenter: parent.horizontalCenter
            }
            color: "#428dfe"
            font.pixelSize: 64
        }
    }
    Rectangle {
        id: hotButton
        anchors {
            right: parent.right
            top: parent.top
            bottom: parent.bottom
        }
        width: parent.width * 0.5
        color: Colors.transparent

        Image {
            id: hotImage
            source: "qrc:/images/hot"
            anchors {
                top: parent.top
                topMargin: 50
                horizontalCenter: parent.horizontalCenter
            }
            width: parent.width
            fillMode: Image.PreserveAspectFit
            height: parent.height * 0.7
        }

        Text {
            id: hotButtonText
            text: qsTr("HOT")
            anchors {
                top: hotImage.bottom
                horizontalCenter: parent.horizontalCenter
            }
            color: "#ec593b"
            font.pixelSize: 64
        }

        MouseArea {
            anchors.fill: parent
            onClicked: hotCoolSelectView.stackParentView.push(coffeeSelectViewComponent)
        }
    }
}
