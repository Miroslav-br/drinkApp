import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import App.Controllers
import Core

Rectangle {
    id: root

    readonly property var stack: StackView.view

    Component {
        id: preparingView
        LoadingIndicatorView {}
    }

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
                source: Resources.image(SystemController.selectedDrink.glassImage)
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
                    text: {
                        if (SystemController.drinkTemperature === SystemController.HOT) {
                            return "Hot Drink";
                        }
                        if (SystemController.drinkTemperature === SystemController.COOL) {
                            return "Cool Drink";
                        }

                        return "Fresh Juice";
                    }

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
                    text: SystemController.selectedDrink.name
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
                    text: {
                        if (SystemController.drinkSize === SystemController.SMALL) {
                            return "Small Size";
                        }
                        if (SystemController.drinkSize === SystemController.MEDIUM) {
                            return "Medium Size";
                        }
                        return "Large Size";
                    }
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
                onClicked: {
                    root.stack.push(preparingView);
                }
            }
        }
    }
}
