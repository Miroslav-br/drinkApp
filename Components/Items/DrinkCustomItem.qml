import QtQuick
import Commons

Item {

    Image {
        id: drinkItemImage
        source: "qrc:/images/cappuccino"
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
        text: "cappuccino"
        font.pixelSize: Font.sizeNormal
    }
}
