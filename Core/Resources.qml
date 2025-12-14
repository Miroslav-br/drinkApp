pragma Singleton
import QtQuick

QtObject {

    readonly property string qrcPath: "qrc:/images"

    function image(imageName: string): string {
        return `${qrcPath}/${imageName}`;
    }
}
