import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle{
    id:strilkiLeftRight
    color:black
    property bool checkRightTurn:false
    property bool checkLeftTurn:false

    Rectangle{
        id:rectLeft
        width: 20
        height:width/2
        color:checkLeftTurn?"lightgreen":"grey"
        anchors.bottom:parent.bottom
        anchors.bottomMargin: height
        anchors.left: parent.left
        anchors.leftMargin: speedMain.x-parent.x+width

            Canvas{
                id:canvas
                x:-50
                y:-50
                width:200
                height:200
                onPaint: {
                    var ctx=getContext("2d")
                    ctx.beginPath()
                    ctx.fillStyle=checkLeftTurn?"lightgreen":"grey"
                    ctx.strokeStyle=checkLeftTurn?"lightgreen":"grey"
                    ctx.moveTo(0+50,+50+rectLeft.height+rectLeft.height*0.4)
                    ctx.lineTo(+50-rectLeft.width*0.4,50+rectLeft.height*0.5)
                    ctx.lineTo(0+50,+50-rectLeft.height*0.4)
                    ctx.lineTo(0+50,+50+rectLeft.height+rectLeft.height*0.4)
                    ctx.fill()
                    ctx.stroke()
                }


           }
       }

    Rectangle{
        id:rectRight
        width: 20
        height:width/2
        color:checkRightTurn?"lightgreen":"grey"
        anchors.bottom:parent.bottom
        anchors.bottomMargin: height
        anchors.right: parent.right
anchors.rightMargin: parent.x+parent.width-speedMain.x-speedMain.width+width
            Canvas{
                id:canvas2
                x:-50
                y:-50
                width:200
                height:200
                onPaint: {
                    var ctx=getContext("2d")


                    ctx.beginPath()
                    ctx.fillStyle=checkRightTurn?"lightgreen":"grey"
                    ctx.strokeStyle=checkRightTurn?"lightgreen":"grey"
                    ctx.moveTo(0+50+rectRight.width,+50+rectRight.height+rectRight.height*0.4)
                    ctx.lineTo(+50+rectRight.width+rectRight.width*0.4,50+rectRight.height*0.5)
                    ctx.lineTo(0+50+rectRight.width,+50-rectRight.height*0.4)
                    ctx.lineTo(0+50+rectRight.width,+50+rectRight.height+rectRight.height*0.4)
                    ctx.fill()
                    ctx.stroke()
                }


           }
       }
    Timer{
        interval: 10
        running: true
        repeat: true
        onTriggered: {
            canvas.requestPaint()
            canvas2.requestPaint()
        }
    }

}
