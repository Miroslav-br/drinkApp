import QtQuick
import QtQuick.Layouts
import Commons
import QtQuick.Controls
import Components.Items

Rectangle {
    id: coffeeSelectView
    property StackView stackParentView: null

    width: parent.width
    color: Colors.transparent
    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 40
        bottomMargin: 60
    }

    GridLayout {
        anchors.fill: parent
        rows: 2
        columns: 4
        rowSpacing: 5
        columnSpacing: 5

        Repeater {
            id: coffeeRepeater
            model: 8

            Rectangle {
                color: Colors.transparent
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 10

                Rectangle {
                    width: parent.width
                    height: parent.height
                    color: Colors.transparent

                    DrinkCustomItem {
                        id: drinkCustomItem
                        anchors.fill: parent
                    }
                }
            }
        }
    }

    Rectangle {
        id: backViewButton
        width: 100
        height: 40
        color: Colors.primary

        anchors {
            left: parent.left
            top: parent.bottom
            leftMargin: 50
        }

        Image {
            id: backViewButtonImage
            source: "qrc:/images/backButton"
            width: 30
            height: 30

            anchors {
                left: parent.left
                verticalCenter: parent.verticalCenter
            }
        }

        Text {
            text: "Back"
            color: Colors.secondary
            font.pixelSize: Font.sizeNormal

            anchors {
                left: backViewButtonImage.right
                leftMargin: 5
                verticalCenter: parent.verticalCenter
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: coffeeSelectView.stackParentView.pop()
        }
    }
}
