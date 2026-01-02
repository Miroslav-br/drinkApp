import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Core

Rectangle {
    id: root

    readonly property var stack: StackView.view

    anchors {
        fill: parent
        topMargin: 20
        bottomMargin: 20
    }

    color: Colors.transparent

    RowLayout {
        anchors {
            leftMargin: 40
            rightMargin: 40
        }

        anchors.fill: parent
        Rectangle {
            color: Colors.transparent

            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                id: drinkImage
                anchors.fill: parent
                source: Resources.image("cappuccino")
                fillMode: Image.PreserveAspectFit
            }
        }

        Rectangle {
            id: confirmationContent

            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Colors.transparent

            Column {
                anchors.verticalCenter: parent.verticalCenter
                spacing: parent.height / 4 * 0.1
                Text {
                    text: "Hot Drink"
                    color: Colors.secondary
                    font.pixelSize: Fonts.sizeNormal * 1.9
                    width: confirmationContent.width
                    horizontalAlignment: Qt.AlignHCenter
                }
                Rectangle {
                    height: 1
                    width: confirmationContent.width
                    color: Colors.secondary
                }
                Text {
                    text: "cappuccino"
                    color: Colors.secondary
                    font.pixelSize: Fonts.sizeNormal * 1.9
                    width: confirmationContent.width
                    horizontalAlignment: Qt.AlignHCenter
                }
                Rectangle {
                    height: 1
                    width: confirmationContent.width
                    color: Colors.secondary
                }
                Text {
                    text: "Medium Size"
                    color: Colors.secondary
                    font.pixelSize: Fonts.sizeNormal * 1.9
                    width: confirmationContent.width
                    horizontalAlignment: Qt.AlignHCenter
                }
                Rectangle {
                    height: 1
                    width: confirmationContent.width
                    color: Colors.secondary
                }
                Text {
                    text: "Half Sugar 50%"
                    color: Colors.secondary
                    font.pixelSize: Fonts.sizeNormal * 1.9
                    width: confirmationContent.width
                    horizontalAlignment: Qt.AlignHCenter
                }
            }
        }

        Rectangle {
            id: confirmButtonBlock
            color: Colors.transparent
            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                source: Resources.image("start")
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent
            }
        }
    }
}
