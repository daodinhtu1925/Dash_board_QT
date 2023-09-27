import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 2.2 /*1.4*/
import SerialPortLib 1.0

Window {
    width: 800
    height: 480
    visible: true
    color: "black"
    title: qsTr("Hello World")

    DashBoard {
        id: dashboard
        anchors.centerIn: parent
        width:  parent.width   /*720*/
        height: parent.height  /*500*/
        scale: 0.9
    }

}
