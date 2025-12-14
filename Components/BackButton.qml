import QtQuick
import Core

Rectangle {
    id: backViewButton

    signal clicked

    Image {
        id: backViewButtonImage
        source: Resources.image("backButton")
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
        font.pixelSize: Fonts.sizeNormal

        anchors {
            left: backViewButtonImage.right
            leftMargin: 5
            verticalCenter: parent.verticalCenter
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: backViewButton.clicked()
    }
}
