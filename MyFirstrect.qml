import QtQuick 2.15
import QtQuick.Window 2.15

Rectangle{
    property bool movingRight:false
    property bool movingLeft:false
    property bool movingUp:false
    property bool movingJump:false
    property bool movingDown:false
    property bool onPressedUpFirstRect:false
    signal ttt( bool p)
    id:firstrect
    width: 100
    height:width
    color:"black"
    focus:true

    Keys.onRightPressed: {movingRight=true;strilkiLeftRight.checkRightTurn=true}
    Keys.onLeftPressed: {movingLeft=true;strilkiLeftRight.checkLeftTurn=true}
    Keys.onSpacePressed:movingJump=true
    Keys.onUpPressed:  {movingUp=true;ttt(true)}
    Keys.onDownPressed:movingDown=true

    Keys.onReleased: {
        if(event.key==Qt.Key_Right){
            firstrect.movingRight=false
            strilkiLeftRight.checkRightTurn=false
        }else if(event.key==Qt.Key_Left){
            firstrect.movingLeft=false
            strilkiLeftRight.checkLeftTurn=false
        }else if(event.key==Qt.Key_Up){
            firstrect.movingUp=false
            ttt(false)
        }else if(event.key==Qt.Key_Space){
            firstrect.movingJump=false
        }else if(event.key==Qt.Key_Down){
            firstrect.movingDown=false
        }
    }

}
