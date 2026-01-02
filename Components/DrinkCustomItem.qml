import QtQuick
import Core

Rectangle {
    id: root

    required property string name
    required property string image
    signal clicked

    Image {
        id: drinkItemImage
        source: Resources.image(root.image)
        anchors.centerIn: parent
        width: parent.width * 0.6
        height: parent.height * 0.6
    }

    Text {
        id: drinkTextItem
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: drinkItemImage.bottom
            topMargin: 50
        }

        color: Colors.secondary
        text: root.name
        font.pixelSize: Fonts.sizeNormal
    }

    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
    }
}
