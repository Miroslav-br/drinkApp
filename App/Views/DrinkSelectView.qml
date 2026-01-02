pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import App.Controllers
import App.Models
import Core
import Components

Rectangle {
    id: root

    property var stack: StackView.view
    required property string drinkType

    DrinkListModel {
        id: drinkModel
        jsonKey: root.drinkType

        Component.onCompleted: {
            drinkModel.loadFromJson();
        }
    }

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
            model: drinkModel

            DrinkCustomItem {
                color: Colors.transparent
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 10

                onClicked: {
                    SystemController.setSelectedDrink(id, name, image, glassImage);
                    root.stack.push(sizeSelection);
                }
            }
        }

        Component {
            id: sizeSelection
            DrinkSizeSelectionView {}
        }
    }
}
