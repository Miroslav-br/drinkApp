pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import App.Controllers
import Core

Rectangle {
    id: root

    readonly property var stack: StackView.view

    Component {
        id: confirmationScreen
        ConfirmationScreen {}
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
            id: drinksizeSelectionController

            Layout.fillWidth: true
            Layout.fillHeight: true

            radius: 25

            clip: true

            color: Colors.transparent

            ListModel {
                id: sugarLevelListModel

                ListElement {
                    level: 6
                    levelName: "More Sugar 150%"
                    levelColor: "#402D1F"
                }
                ListElement {
                    level: 5
                    levelName: "Normal Sugar 100%"
                    levelColor: "#6C4B2C"
                }
                ListElement {
                    level: 4
                    levelName: "Less Sugar 75%"
                    levelColor: "#8C6239"
                }
                ListElement {
                    level: 3
                    levelName: "Half Sugar 50%"
                    levelColor: "#A67C53"
                }
                ListElement {
                    level: 2
                    levelName: "Quarter Sugar 25%"
                    levelColor: "#C69C6C"
                }
                ListElement {
                    level: 1
                    levelName: "No Sugar 0%"
                    levelColor: "#C9B099"
                }
            }

            ListView {
                id: sugarView
                anchors.fill: parent
                anchors {
                    leftMargin: 20
                    rightMargin: 20
                    topMargin: 40
                    bottomMargin: 40
                }

                model: sugarLevelListModel

                delegate: Rectangle {
                    id: delegateRoot
                    required property int index
                    required property color levelColor
                    required property string levelName

                    height: ListView.view.height / 6
                    width: ListView.view.width

                    color: levelColor
                    topLeftRadius: index === 0 ? 20 : 0
                    topRightRadius: index === 0 ? 20 : 0
                    bottomLeftRadius: index === 5 ? 20 : 0
                    bottomRightRadius: index === 5 ? 20 : 0

                    Text {
                        anchors.centerIn: parent

                        text: delegateRoot.levelName
                        color: Colors.secondary

                        font.pointSize: Fonts.sizeNormal
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: parent.color = Qt.rgba(210, 210, 210, 0.5)
                        onReleased: parent.color = delegateRoot.levelColor
                        onClicked: {
                            SystemController.sugarLevel = delegateRoot.index + 1;
                            root.stack.push(confirmationScreen);
                        }
                    }
                }
            }
        }
    }
}
