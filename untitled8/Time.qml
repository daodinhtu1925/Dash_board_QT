import QtQuick 2.0

Item {
    id: id_root

    property var currentDate: new Date()
    property int fuelValue: 0

    Timer {
        id: timer
        repeat: true
        interval: 1000
        running: true

        onTriggered: id_root.currentDate = new Date()
    }

    Rectangle {
        id: id_info

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: "black"
        border.color: "#696969"
        border.width: id_info.height * 0.02

        Text {
            id: id_date
            anchors {
                horizontalCenter: id_info.horizontalCenter
                top: id_info.top
                topMargin: id_info.height * 0.07
            }
            color:"white"
            font.pixelSize: 20
            font.family: "Impact"
            text: currentDate.getDate() + "/" + currentDate.getMonth() + "/" + currentDate.getFullYear()
        }

        Text {
            id: id_clock
            anchors {
                horizontalCenter: id_info.horizontalCenter
                top: id_date.bottom
                topMargin: id_info.height * 0.01
            }
            color: "white"
            font.pixelSize: 20
            font.family: "Impact"
            text: currentDate.getHours() + ":" + currentDate.getMinutes() + ":" + currentDate.getSeconds()
        }
    }
}
