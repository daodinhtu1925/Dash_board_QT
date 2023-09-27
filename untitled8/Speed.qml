import QtQuick 2.0
import QtQuick.Controls 2.2
import SerialPortLib 1.0

Item {
    id: id_root
    property int value: 0

    Rectangle {
        id: id_speed

        property int numberIndexs: 10
        property int startAngle: 234
        property int angleLength: 28
        property int maxSpeed: 180

        anchors.centerIn: parent
        height: Math.min(id_root.width, id_root.height)
        width: height
        radius: width/2
        color: "black"

        Repeater {
            model: id_speed.numberIndexs

            Item {
                height: id_speed.height/2
                transformOrigin: Item.Bottom
                rotation: index * id_speed.angleLength + id_speed.startAngle
                x: id_speed.width/2

                Rectangle {
                    height: id_speed.height * 0.04
                    width: height / 3
                    color: "white"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: id_speed.height * 0.03
                }

                Text {
                    anchors {
                        horizontalCenter: parent.horizontalCenter
                    }
                    x: 0
                    y: id_speed.height * 0.09
                    color: "white"
                    rotation: 360 - (index * id_speed.angleLength + id_speed.startAngle)
                    text: index * (id_speed.maxSpeed / (id_speed.numberIndexs - 1))
                    font.pixelSize: id_speed.height * 0.05
                    font.family: "Comic Sans MS"
                }
            }
        }

        Repeater {
            model: id_speed.numberIndexs - 1

            Item {
                height: id_speed.height/2
                transformOrigin: Item.Bottom
                rotation: index * id_speed.angleLength + id_speed.startAngle * 1.06
                x: id_speed.width/2

                Rectangle {
                    height: id_speed.height * 0.03
                    width: height / 5
                    color: "white"
                    antialiasing: true
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: id_speed.height * 0.03
                }
            }
        }
    }

    Rectangle {
        id: id_center
        anchors.centerIn: parent
        height: id_speed.height*0.45
        width: height
        radius: width/2
        color: "black"
        border.width: 10
        border.color: "#696969"
        z:1

        Text {
            id: text_digits
            anchors {
                //                horizontalCenter: parent.horizontalCenter
                //                top: id_speed.verticalCenter
                //                topMargin: id_speed.height * 0.1
                centerIn: parent
            }
            text: /*slider.value*/  id_root.value
            color: "white"
            font.pixelSize: 50
            font.family: "Comic Sans MS"
        }
    }


    SpeedNeedle {
        id: id_speedNeedle
        anchors {
            top: id_speed.top
            bottom: id_speed.bottom
            horizontalCenter: parent.horizontalCenter
        }
        value: id_root.value  /*slider.value*/
        startAngle: id_speed.startAngle * 0.615
        endAngle: value  * 1.41 + 143
        angleLength: id_speed.angleLength / (id_speed.maxSpeed / (id_speed.numberIndexs - 1))
    }

            SerialPort{
                onSomeVar_Changed: {
                    text_digits.text = someVar;
                    id_root.value = someVar;
                }
            }

//    Slider {
//        id: slider
//        x: 300
//        font.pointSize: 14
//        stepSize: 1
//        to: 180
//        from: 0
//        value: 0
//    }
}
