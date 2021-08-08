import QtQuick 2.0

Rectangle {
    property alias internalText: internalText.text
    property alias fontColor: internalText.color

    anchors.margins: 1

    Text {
        id: internalText
        anchors.centerIn: parent
        font.pointSize: Math.max(10, parent.height/2)
    }
}
