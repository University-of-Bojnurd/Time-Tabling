import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    property alias topPageBordercolor: topPage.border.color
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Rectangle {
            id: topPage
            height: 59
            color: "#2c313c"
            border.color: "#2c313c"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Label {
                id: timeTablingTitle
                color: "#ffffff"
                text: qsTr("Time Tabling Page")
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter

                topPadding: 13
                font.styleName: "Bold"
                font.pointSize: 15
            }
        }

        Rectangle {
            id: rectangle1
            color: "#2c313c"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: topPage.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: 10
            anchors.leftMargin: 10
            anchors.bottomMargin: 10
            anchors.topMargin: 10
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:3}D{i:2}D{i:4}
}
##^##*/
