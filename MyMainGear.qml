import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle{
    id:mainGear
    width:170
    height:170
    color:"black"
    radius: width/2
    property int gearThis:0
    Rectangle{
        id:mainGearPlain
        width:mainGear.width-mainGear.width*0.04
        height:mainGear.height-mainGear.height*0.04
        color:"black"
        radius: width/2
        border.width: 3
        border.color: "lightgreen"
        anchors.centerIn: parent
        Repeater{
            id:repeaterItem
            model:7
            delegate: Item {
                id: itemMainGearPlain
                width:15
                height:mainGearPlain.height
                anchors.centerIn: mainGearPlain
                rotation: index*28-160
                Rectangle{
                    width: index*15*0.1+20
                    height:width
                    radius: width/2
                    color:gearThis==index?"light green":"grey"
                    anchors.top:itemMainGearPlain.top
                    anchors.topMargin: itemMainGearPlain.height*0.031
                    Text {
                        id: textGear
                        text:index
                        rotation:-index*28+160
                        anchors.centerIn: parent
                        font.pixelSize: 14
                    }
                }
            }
        }
        Text{
            anchors.centerIn: parent
            color:"light green"
            font.pixelSize: 20
            text:"Gear\nPosition"
        }
    }


}
