import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:wind

    property bool onPressedUpTochka
    property int onMovingRect:0
    property int onGear:0

    width: 1000
    height: 800
    visible: true
    title: qsTr("Hello World")
    Text {
        id: name
        text: onGear
    }
    MyStrilkiLeftRight {
        id: strilkiLeftRight
        width:mainFuel.x+mainFuel.width/2-mainGear.x-mainGear.width/2
        anchors.bottom: speedMain.bottom
        x: mainGear.x+mainGear.width/2
        height:mainGear.height/2
        color:"black"


    }
    MySpeedMain {
        id: speedMain
        x:parent.width/2-width/2
        y:parent.height*0.05
        z:1
        rrrr: onMovingRect
    }

    MyMainGear {
        id: mainGear
        anchors.bottom: speedMain.bottom
        anchors.right:  speedMain.left
        anchors.rightMargin: mainGear.width*(-1)*0.20
gearThis: onGear
    }

    MyMainFuel {
        id: mainFuel
        anchors.bottom: speedMain.bottom
        anchors.left:  speedMain.right
        anchors.leftMargin: mainGear.width*(-1)*0.20
    }

    MyFirstrect {
        id: firstrect
        Behavior on x{NumberAnimation{duration:10}}
        Behavior on y{NumberAnimation{duration:10}}
        onTtt: wind.onPressedUpTochka=p
    }

    Timer{
    id:timer
    interval: 10
    repeat: true
    running: true
    onTriggered: {
        if(firstrect.movingRight&&firstrect.movingUp){
            firstrect.x=firstrect.x+5
            firstrect.y=firstrect.y-5
        }
        if(firstrect.movingRight&&firstrect.movingDown){
            firstrect.x=firstrect.x+5
            firstrect.y=firstrect.y+5
        }
        if(firstrect.movingLeft&&firstrect.movingDown){
            firstrect.x=firstrect.x+5
            firstrect.y=firstrect.y+5
        }
        if(firstrect.movingLeft&&firstrect.movingJump){
               firstrect.x=firstrect.x-5
               firstrect.y=firstrect.y-15
           }
        if(firstrect.movingRight&&firstrect.movingJump){
               firstrect.x=firstrect.x+5
               firstrect.y=firstrect.y-15
           }
         if(firstrect.movingLeft&&firstrect.movingUp){
            firstrect.x=firstrect.x-5
            firstrect.y=firstrect.y-5
        }
         if(firstrect.movingRight){
                firstrect.x=firstrect.x+5
            }
         if(firstrect.movingLeft){
            firstrect.x=firstrect.x-5
        }
         if(firstrect.movingUp){
            firstrect.y=firstrect.y-5
        }
         if(firstrect.movingDown){
            firstrect.y=firstrect.y+5
        }
         if(firstrect.movingJump){
                firstrect.y=firstrect.y-15
            }
        }
    }
    Timer{
        id:speeding
        running: true
        interval: 100
        repeat: true
        onTriggered: {
            if(onPressedUpTochka){
                if(onMovingRect<=277){
                   onMovingRect+=3
                    if(onMovingRect<46){
                        onGear=0
                    }
                    else if(onMovingRect<92){
                                            onGear=1
                                    }
                    else if(onMovingRect<138){
                                            onGear=2
                                    }
                    else if(onMovingRect<184){
                                            onGear=3
                                    }
                    else if(onMovingRect<230){
                                            onGear=4
                                    }
                    else if(onMovingRect<=270){
                                            onGear=5
                                    }
                    else if(onMovingRect<=280){
                                            onGear=6
                                    }
                }
            }

            else{
                if(onMovingRect>0){
                    onMovingRect-=3
                }
                if(onMovingRect<46){

                    onGear=0
                }
                else if(onMovingRect<92){
                                        onGear=1
                                }
                else if(onMovingRect<138){
                                        onGear=2
                                }
                else if(onMovingRect<184){
                                        onGear=3
                                }
                else if(onMovingRect<230){
                                        onGear=4
                                }
                else if(onMovingRect<=270){
                                        onGear=5
                                }
                else if(onMovingRect<=280){
                                        onGear=6
                                }

            }
        }
    }


}



