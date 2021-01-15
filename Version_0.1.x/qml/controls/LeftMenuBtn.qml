import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button{
    id: btnLeftMenu
    // CUSTOM PROPERTY
    text: qsTr("Left Menu Text")


    property url btnIconSource: "../../image/svg_images/home_icon.svg"
    property color btnColorDefult: "#1c1d20"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#55aaff"
    property bool isActiveMenu: false
    property color activeMenuColorRight: "#2c313c"



    QtObject{
        id: internal

        // MOUSE OVER AND CLICK CHANGE COLOR

        property var dynamicColor: if(btnLeftMenu.down){
                                      btnLeftMenu.down ? btnColorClicked : btnColorDefult
                                  } else{
                                      btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefult
                                  }

    }


    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle{
        id: bgBtn
        color: internal.dynamicColor
    }

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }

            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle{
            anchors{
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }

            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }


    contentItem: Item {
        anchors.fill: parent
        id: content


        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconHeight
            height: iconHeight

            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{


            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight

        }

        Text {
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }

    }

}



/*##^##
Designer {
    D{i:0;autoSize:true;height:60;width:250}
}
##^##*/
