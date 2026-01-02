import QtQuick
import QtQuick.Layouts
import Core

Item {
    id: root

    property alias color: content.color
    property alias text: label.text

    required property string sourceImage
    property bool reversed: false
    signal clicked

    Rectangle {
        id: content
        anchors.fill: parent

        Row {
            id: backViewButton
            anchors.fill: parent
            layoutDirection: root.reversed ? Qt.RightToLeft : Qt.LeftToRight

            Rectangle {
                height: parent.height
                width: height
                color: Colors.transparent

                Image {
                    id: backViewButtonImage
                    anchors.centerIn: parent
                    source: Resources.image(root.sourceImage)
                    height: parent.height / 2
                    width: height
                }
            }

            Text {
                id: label
                height: parent.height
                color: Colors.secondary
                verticalAlignment: Qt.AlignVCenter

                font.pixelSize: Fonts.sizeNormal
            }
        }
        MouseArea {
            anchors.fill: parent
            onClicked: root.clicked()
        }
    }
}
