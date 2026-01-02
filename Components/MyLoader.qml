import QtQuick
import Core

Item {
    id: root
    Rectangle {
        id: mainCircle
        anchors.fill: parent

        radius: width / 2

        color: Colors.secondary

        clip: true

        Rectangle {

            anchors.centerIn: parent
            width: parent.width * 0.9
            height: width
            radius: width / 2

            color: Colors.primary
        }

        Rectangle {

            anchors {
                top: mainCircle.top
                right: mainCircle.right
                bottom: mainCircle.bottom
            }
            width: parent.width * 0.1
            height: width

            color: Colors.primary
        }

        ParallelAnimation {
            running: true
            RotationAnimation {
                target: mainCircle
                from: 0
                to: 360
                duration: 2000
                loops: Animation.Infinite
            }
            SequentialAnimation {
                loops: Animation.Infinite
                NumberAnimation {
                    target: mainCircle
                    property: "scale"
                    to: 1.4
                    duration: 1000
                    easing.type: Easing.OutQuad
                }
                NumberAnimation {
                    target: mainCircle
                    property: "scale"
                    to: 0.9
                    duration: 1000
                    easing.type: Easing.InQuad
                }
            }
        }
    }
}
