import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Core
import Components

Rectangle {
    id: root

    property var stack: StackView.view

    width: parent.width
    color: Colors.transparent

    anchors {
        top: parent.top
        bottom: parent.bottom
        topMargin: 40
        bottomMargin: 60
    }

    GridLayout {
        anchors.fill: parent
        rows: 2
        columns: 4
        rowSpacing: 5
        columnSpacing: 5

        Repeater {
            id: coffeeRepeater
            model: 8

            DrinkCustomItem {
                color: Colors.transparent
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 10

                onClicked: root.stack.push(sizeSelection)
            }
        }

        Component {
            id: sizeSelection
            DrinkSizeSelectionView {}
        }
    }
}
