import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Core

Rectangle {
    id: root

    property var stack: StackView.view

    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 20
        bottomMargin: 20
    }

    width: parent.width
    height: parent.height

    color: Colors.transparent

    RowLayout {

        anchors.fill: parent

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true

            color: Colors.transparent

            Image {
                id: drinkSizeSelectionImage
                source: Resources.image("cappucino")
                anchors.fill: parent
                fillMode: Image.Pad
            }
        }

        Rectangle {
            id: drinksizeSelectionController

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: Colors.transparent

            Rectangle {
                id: drinkSizeSelectionPanel
                anchors.fill: parent
                anchors {
                    leftMargin: 40
                    rightMargin: 40
                    topMargin: 20
                    bottomMargin: 20
                }

                radius: 20
                color: "#404040"

                Text {
                    id: panelTitleText
                    color: Colors.secondary
                    text: "Size"

                    anchors {
                        top: parent.top
                        topMargin: 5
                        horizontalCenter: parent.horizontalCenter
                    }

                    font.pointSize: Fonts.sizeNormal * 1.5
                }

                Rectangle {
                    id: selectedPanel

                    anchors {
                        top: panelTitleText.bottom
                        bottom: parent.bottom
                    }
                    width: parent.width
                    color: Colors.transparent

                    Rectangle {
                        id: largeSelector
                        anchors {
                            top: parent.top
                        }

                        width: parent.width
                        height: parent.height / 3
                        color: Colors.transparent

                        Text {
                            text: "Large"
                            color: Colors.secondary
                            font.pixelSize: Fonts.sizeNormal

                            anchors {
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 26
                            }
                        }
                    }
                    Rectangle {
                        width: parent.width * 0.9
                        height: 1

                        anchors {
                            top: largeSelector.bottom
                            horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Rectangle {
                        id: mediumSelector
                        anchors {
                            top: largeSelector.bottom
                        }

                        width: parent.width
                        height: parent.height / 3
                        color: Colors.transparent

                        Text {
                            text: "Medium"
                            color: Colors.secondary
                            font.pixelSize: Fonts.sizeNormal

                            anchors {
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 26
                            }
                        }
                    }
                    Rectangle {
                        width: parent.width * 0.9
                        height: 1

                        anchors {
                            top: mediumSelector.bottom
                            horizontalCenter: parent.horizontalCenter
                        }
                    }
                    Rectangle {
                        id: smallSelector
                        anchors {
                            top: mediumSelector.bottom
                        }

                        width: parent.width
                        height: parent.height / 3
                        color: Colors.transparent

                        Text {
                            text: "Small"
                            color: Colors.secondary
                            font.pixelSize: Fonts.sizeNormal

                            anchors {
                                verticalCenter: parent.verticalCenter
                                left: parent.left
                                leftMargin: 26
                            }
                        }
                    }
                }
            }
        }
    }
}
