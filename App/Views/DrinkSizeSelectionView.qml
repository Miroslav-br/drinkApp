import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Commons

Rectangle {
    id: drinkSizeSelectionView
    property StackView stackParentView: null

    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 30
        bottomMargin: 30
    }

    width: parent.width
    color: Colors.transparent

    Rectangle {
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
        }

        width: parent.width * 0.5
        color: Colors.transparent

        Image {
            id: drinkSizeSelectionImage
            source: "qrc:/images/cappuccino"
            anchors.fill: parent
            fillMode: Image.Pad
        }
    }

    Rectangle {
        id: drinksizeSelectionController

        anchors {
            verticalCenter: parent.verticalCenter
            right: parent.right
        }

        width: parent.width * 0.5
        color: Colors.transparent

        Rectangle {
            id: drinksizeSelectionPanel
            anchors.fill: parent
            anchors {
                leftMargin: 40
                rightMargin: 40
                topMargin: 20
                bottomMargin: 20
            }

            radius: 5
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

                font.pointSize: Font.sizeNormal * 2
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
                        font.pixelSize: Font.sizeNormal

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
                        top: parent.top
                    }

                    width: parent.width
                    height: parent.height / 3
                    color: Colors.transparent

                    Text {
                        text: "Medium"
                        color: Colors.secondary
                        font.pixelSize: Font.sizeNormal

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
                        top: parent.top
                    }

                    width: parent.width
                    height: parent.height / 3
                    color: Colors.transparent

                    Text {
                        text: "Small"
                        color: Colors.secondary
                        font.pixelSize: Font.sizeNormal

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
                        top: smallSelector.bottom
                        horizontalCenter: parent.horizontalCenter
                    }
                }
            }
        }
    }
}
