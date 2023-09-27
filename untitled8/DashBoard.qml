import QtQuick 2.0
import SerialPortLib 1.0

Item {
    id: id_dashboard

    //to creating data for demonstration purpose
    property int count: 0
    property int randNum: 0

    Timer {
        id: id_timer
        repeat: true
        interval: 700
        running: true

        onTriggered: {
            if(id_gear.value == 6) id_gear.value = 0;
            else id_gear.value++;

            if(count % 5 == 0){
                if(id_fuel.value == 0) id_fuel.value = 4
                else id_fuel.value = 0
            }
            count++;

            if(count % 2 == 0){
                id_turnLeft.isActive = true
                id_turnRight.isActive = false
            }else{
                id_turnLeft.isActive = false
                id_turnRight.isActive = true
            }
        }
    }

    // Speed Area
    Rectangle {
        id: id_speedArea

        anchors {
            horizontalCenter: parent.horizontalCenter
            verticalCenter: parent.verticalCenter
        }
        width: parent.width * 0.5
        height: width
        color: "#696969"
        radius: width/2
        z: 1

        Speed {
            id: id_speed
            anchors.fill: id_speedArea
            anchors.margins: id_speedArea.width * 0.02
        }
    }

    // Gear Area
    Rectangle {
        id: id_gearArea
        //            anchors {
        //                bottom: id_speedArea.bottom
        //            }
        x: 40
        y: 20
        width: parent.width * 0.35
        height: width
        color: "#696969"
        radius: width/2

        Gear {
            id: id_gear
            anchors.fill: id_gearArea
            //                anchors.margins: id_fuelArea.width * 0.025
        }
    }

    //Fuel Area
    Rectangle {
        id: id_fuelArea
        //            anchors {
        //                bottom: id_speedArea.bottom
        //            }
        x: 575
        y: 20
        width: parent.width * 0.30
        height: width
        color: "#696969"
        radius: width/2

        Fuel {
            id: id_fuel
            anchors.fill: id_fuelArea
            //                anchors.margins: id_fuelArea.width * 0.025
        }
    }

    // Turn Area
    Turn {
        id: id_turnLeft

        anchors {
            right: id_speedArea.right
            rightMargin: id_speedArea.height
            bottom: id_speedArea.bottom
            bottomMargin: id_speedArea.height * 0.01
        }
        width: id_speedArea.width / 5.5
        height: id_speedArea.height / 8.2

        isActive: false
    }

    Turn {
        id: id_turnRight

        anchors {
            left: id_speedArea.left
            leftMargin: id_speedArea.height
            bottom: id_speedArea.bottom
            bottomMargin: id_speedArea.height * 0.01
        }
        width: id_speedArea.width / 5.5
        height: id_speedArea.height / 8.2
        transformOrigin: Item.Center
        rotation: 180

        isActive: true
    }

    Rectangle {
        id: id_timeArea
        width: 100
        height: width
        color: "transparent"
        radius: width/2
        z: 1
        x: 350
        y: 300

        Time {
            id: id_time
            anchors.centerIn: id_timeArea
        }
    }
}

