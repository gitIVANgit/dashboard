import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle{

    id:speedMain
    width:200
    height:200
    color:"black"
    radius: width/2
property int rrrr:0
    Rectangle{


        id:speedPlane
        width:190
        height:190
        color:"black"
        radius: width/2
        border.color: "lightgreen"
        border.width: 5
        anchors.centerIn: parent
        Rectangle{
            id:tochka
            anchors.centerIn: parent
            color:"lightgreen"
            width:30
            height:width
            radius: width/2

        }
        Text {
            anchors.top: tochka.bottom
            anchors.bottomMargin: 30
            anchors.horizontalCenter: tochka.horizontalCenter
            text: "Speed\n km/h"
            font.pixelSize: 15
            color:"lightgreen"
        }

        Canvas{
            id:canvas
            width:1000
            height:1000

            onPaint: {
                var ctx=getContext("2d")

                ctx.beginPath()
                ctx.strokeStyle="blue"
                ctx.lineCap="round"
                ctx.lineWidth=3
                ctx.arc(speedPlane.x+speedPlane.width/2-5,speedPlane.y+speedPlane.height/2-5,83,13*Math.PI/18,13*Math.PI/18+14*Math.PI/9,false)
                ctx.stroke()

                ctx.beginPath()
                ctx.strokeStyle="red"
                ctx.lineWidth=3
                ctx.lineCap="round"
                ctx.arc(speedPlane.x+speedPlane.width/2-5,speedPlane.y+speedPlane.height/2-5,83,13*Math.PI/18+22*Math.PI/18,13*Math.PI/18+14*Math.PI/9,false)
                ctx.stroke()

            }
        }
        Repeater{
            model:15
            delegate: Item{
                id:itemSpeedPlane
                anchors.centerIn: speedPlane
                width:speedPlane.width-15
                height:15
                rotation: index*20+134
                Rectangle{
                    anchors.right: itemSpeedPlane.right
                    anchors.top: itemSpeedPlane.top
                    width:15
                    height:5
                    color:"light green"
                }
            }
        }
        Repeater{
            model:15
            delegate: Item{
                id:itemSpeedPlaneText
                anchors.centerIn: speedPlane
                width:speedPlane.width-48
                height:15
                rotation: index*20+131
               Text{
                   anchors.right: itemSpeedPlaneText.right
                   text: index*20
                   color:"light green"
                   rotation: -index*20-133
                   font.pixelSize: 11
               }
            }
        }
        Item{
            anchors.centerIn: tochka
            id:itemNeedle
            width:15
            height:speedPlane.height-15
            rotation: speedMain.rrrr-140
        Rectangle{
            width:2
            radius: 2
            height:100
            color:"light green"
            anchors.top:itemNeedle.top
            anchors.horizontalCenter: itemNeedle.horizontalCenter
        }

        }
    }

}
