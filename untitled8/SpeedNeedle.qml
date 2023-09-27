import QtQuick 2.0

Item {
    id: id_root
    width: parent.width
    height: parent.height

    property int value: 0
    property int startAngle : 0
    property double angleLength: 0
    property double endAngle: 0
    property int maxSpeed: 0

    Rectangle {
        width: id_root.height * 0.01
        height: id_root.height * 0.5
        color: "#81FFFE"
        anchors {
            horizontalCenter: id_root.horizontalCenter
            bottom: id_root.Bottom
        }
        transformOrigin: Item.Bottom
        rotation: value * angleLength + startAngle*1.635
        antialiasing: true
        //        y: id_root.height * 0.05
    }

    Behavior on rotation {
        SmoothedAnimation { velocity: 500 }
    }

    //    onEndAngleChanged: canvas.requestPaint()

    //    Canvas {
    //        id: canvas
    //        width: /*540*/ parent.width
    //        height: /*500*/ parent.height
    ////        x:-150
    //        onPaint: {
    //            var ctx = getContext("2d");
    //            ctx.clearRect(0, 0, canvas.width, canvas.height);
    //            var gradient = ctx.createRadialGradient(id_root.width/2, id_root.width/2, 5, id_root.width/2, id_root.width/2, 350);
    //            gradient.addColorStop(0.54,"#81FFFE");
    //            gradient.addColorStop(0.52,"#81FFFE");
    //            gradient.addColorStop(0.49,"#112478");
    //            gradient.addColorStop(0.35,"transparent");

    //            ctx.beginPath();
    //            ctx.lineWidth = 50;
    //            ctx.strokeStyle = gradient;
    //            ctx.arc(parent.width/2/*175*/ , /*175*/parent.height/2, 167, (id_root.startAngle/180*Math.PI)/*0.8*Math.PI*/, /*2.2*Math.PI*/(id_root.endAngle/180*Math.PI));
    //            ctx.stroke();
    //        }
    //    }
}
