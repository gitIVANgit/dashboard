import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.0

Rectangle{

    id:mainFuel
    width:170
    height:170
    color:"black"
    radius: width/2
    property var currentDate: new Date()
    property int angle:0
    property int hours:currentDate.getHours()
    property int mins:currentDate.getMinutes()
    property int secs:currentDate.getSeconds()
    property int days:currentDate.getDay()
    property int months:currentDate.getMonth()
    property int years:currentDate.getFullYear()


    Rectangle{
        id:mainFuelPlain
        width:mainFuel.width-mainFuel.width*0.04
        height:mainFuel.height-mainFuel.height*0.04
        color:"black"
        radius: width/2
        border.width: 3
        border.color: "lightgreen"
        anchors.centerIn: parent
       Text{
           color:"light green"
           text:mainFuel.days+"/"+mainFuel.months+"/"+mainFuel.years+"\n"+mainFuel.secs+":"+mainFuel.mins+":"+mainFuel.hours
           anchors.top: parent.top
           anchors.horizontalCenter: parent.horizontalCenter
           font.pixelSize: 15
           font.bold: true
           anchors.topMargin:mainFuel.height*0.06
       }
       Rectangle{
           id:roundFuel
           width:mainFuel.width*0.5
           height:width
           color:"black"
           border.color: "light green"
           border.width:3
           radius:width/2
           anchors.top: parent.top
           anchors.left: parent.left
anchors.topMargin: mainFuelPlain.height*0.35
anchors.leftMargin: mainFuelPlain.height*0.35
Canvas{
    id:canvas
    width:200
    height:200
    onPaint: {
        var ctx=getContext("2d")
        ctx.beginPath()
        ctx.strokeStyle="red"
        ctx.lineWidth=3
        ctx.arc(roundFuel.width/2,roundFuel.width/2,roundFuel.width*0.4,Math.PI,0,false)
        ctx.stroke()

        ctx.beginPath()
        ctx.strokeStyle="blue"
        ctx.lineWidth=3
        ctx.arc(roundFuel.width/2,roundFuel.width/2,roundFuel.width*0.4,Math.PI+Math.PI/4,0,false)
        ctx.stroke()

    }
}
Repeater{
    model:5
    delegate: Item{
        id:itemDelegate
        anchors.centerIn: parent
        width:parent.width*0.05
        height:parent.height*0.9
        rotation: 270+index*180/4
        Rectangle{
            width:itemDelegate.width*0.9
            height:index%2==0?itemDelegate.height*0.15:itemDelegate.height*0.1
            color:index==0?"red":"light green"
            anchors.left: itemDelegate.left
        }

    }
}
Text{
id:leterE
text:"E"
font.pixelSize: 10
font.bold: true
color:"red"
anchors.left: parent.left
anchors.top:parent.top
anchors.leftMargin: parent.height*0.09
anchors.topMargin: parent.height/2
}

Text{
id:leterF
text:"F"
font.pixelSize: 10
font.bold: true
color:"light green"
anchors.right: parent.right
anchors.top:parent.top
anchors.rightMargin: parent.height*0.09
anchors.topMargin: parent.height/2
}
Rectangle{
id:pointFuel
width:parent.width*0.12
height:width
radius: width/2
color:"light green"
anchors.centerIn: parent
}
Item{
id:needleFuel
width:parent.width*0.02
height:parent.height*0.9
anchors.centerIn: parent
rotation: 90*3
Rectangle{
    id:needlerectangleFuel
    width:parent.width
    height:parent.height*0.5
    color:"light green"
anchors.top:parent.top
}
}
Rectangle{
    id:firstRect
    width:parent.width*0.06
    height:parent.height*0.13
    color:"light green"
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.topMargin: parent.height*0.26
    anchors.leftMargin: parent.width*0.47
    Rectangle{
        id:secondRect
        width:firstRect.width*0.72
        height:firstRect.height*0.5
        color:"black"
        anchors.horizontalCenter: firstRect.horizontalCenter
        anchors.top: firstRect.top
        anchors.topMargin: height*0.2

    }
}
Rectangle{
id:thirdRect
width:parent.width*0.1
height:parent.height*0.03
color:"light green"
anchors.top: firstRect.bottom
anchors.topMargin: height*0.2

anchors.horizontalCenter: firstRect.horizontalCenter

}
       }

}
    Timer{
        id:timer
        interval: 1000
        running:true
        repeat: true
        onTriggered: currentDate=new Date
    }

}
