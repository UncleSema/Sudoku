import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    width: 550
    height: 550
    visible: true
    title: qsTr("Sudoku")

    color: gameboard.getBackgroundColor()

    GameBoard {
        anchors.fill: parent
    }
}
