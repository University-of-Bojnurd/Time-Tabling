import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Dialogs 1.3
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 580
    minimumWidth: 800
    minimumHeight: 500
    visible: true
    color: "#00000000"

    // REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint


    title: qsTr("Couse Qt Quick")

    // properties for restor after maximize
    property int windowStatus: 0
    property int windowMargin: 10



    // Text Edit Properties
    property alias actualPage: stackView.currentItem



    // INTERNAL FUNCTION FOR MINIMIZE, MAXIMIZE and CLOSE APP
    QtObject{
        id: internal

        function resetResizeBorders(){
            // RESIZE VISIBILITY
            resizeLeft.visible = true
            resizeBottom.visible = true
            resizeRight.visible = true
            resizeWindow.visible = true
        }


        function maximizeRestore(){
            if(windowStatus == 0){

                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                // Resize  visibility by mouse area off when maximize size of app
                resizeLeft.visible = false
                resizeBottom.visible = false
                resizeRight.visible = false
                resizeWindow.visible = false

                btnMaximizeRestore.btnIconSource = "../image/svg_images/restore_icon.svg"
            }
            else{

                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10

                // Resize visibility
                internal.resetResizeBorders()


                btnMaximizeRestore.btnIconSource = "../image/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin =10
                // Resize visibility
                internal.resetResizeBorders()
                btnMaximizeRestore.btnIconSource = "../image/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            // Resize visibility
            internal.resetResizeBorders()
            btnMaximizeRestore.btnIconSource = "../image/svg_images/maximize_icon.svg"
        }

    }


    Rectangle {
        id: bg
        color: "#2c313c"
        radius: 0
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z: 1

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton{
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 28
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#5f6a82"
                        text: qsTr("Application Description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#5f6a82"
                        text: qsTr("| HOME")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    //x: 70
                    //y: 0
                    //width: 803
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70

                    // Shaow
                    DragHandler{
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }



                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../image/svg_images/main_icon.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("My Application Title")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                        font.pointSize: 10
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 872
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }

                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../image/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#b50a40"
                        btnIconSource: "../image/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    // ANIMATION FOR OPEN FILE
                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 240; else return 70
                        duration: 1500
                        easing.type: Easing.OutBounce
                    }




                    Column {
                        id: columnMenus
                        width: 198
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        clip: true
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 90
                        anchors.topMargin: 0

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width

                            text: qsTr("Home")
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSettings.isActiveMenu = false
                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))


//                                pagesView.setSource(Qt.resolvedUrl("pages/homePage.qml"))
                            }


                        }

                        LeftMenuBtn {
                            id: btnOpen
                            width: leftMenu.width
                            text: qsTr("Open")
                            isActiveMenu: false
                            btnIconSource: "../image/svg_images/open_icon.svg"


                            onPressed: {
                                fileOpen.open()
                            }

                            FileDialog{
                                id: fileOpen
                                title: "Please Choose a File"
                                folder: shortcuts.home
                                selectMultiple: false
                                nameFilters: ["Text File (*.txt)"]
                                onAccepted:{
                                    backend.openFile(fileOpen.fileUrl)
                                }
                            }


                    }

                        LeftMenuBtn {
                            id: btnSave
                            width: leftMenu.width
                            text: qsTr("Save")
                            isActiveMenu: false
                            btnIconSource: "../image/svg_images/save_icon.svg"

                            onPressed: {
                                fileSave.open()
                            }

                            FileDialog{
                                id: fileSave
                                title: "Save File"
                                folder: shortcuts.home

                                nameFilters: ["Text File (*.txt)"]
                                selectExisting: false

                                onAccepted:{
                                    backend.getTextField(actualPage.getText)
                                    backend.writeFile(fileSave.fileUrl)

                                }
                            }

                        }

                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
//                        x: 0
//                        y: 413

                        text: qsTr("Setting")
                        anchors.bottom: parent.bottom
//                        clip: true

                        anchors.bottomMargin: 25
                        btnIconSource: "../image/svg_images/settings_icon.svg"
                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnSettings.isActiveMenu = true
                            stackView.push(Qt.resolvedUrl("pages/settingsPage.qml"))

//                            pagesView.setSource(Qt.resolvedUrl("pages/settingsPage.qml"))
                        }


                    }


                }

                Rectangle {
                    id: contentPages
                    color: "#00000000"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

                    StackView {
                        id: stackView
                        anchors.fill: parent
                        initialItem: Qt.resolvedUrl("pages/textEditor.qml")
                    }

//                    Loader{
//                        id: pageHome
//                        anchors.fill: parent
//                        source: Qt.resolvedUrl("pages/homePage.qml")
//                        visible: false

//                    }
//                    Loader{
//                        id: pageSettings
//                        anchors.fill: parent
//                        source: Qt.resolvedUrl("pages/settingsPage.qml")
//                        visible: true

//                    }
                }

                Rectangle {
                    id: rectangle
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelTopInfo1
                        color: "#5f6a82"
                        text: qsTr("Application Description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.rightMargin: 30
                    }


                    MouseArea {
                        id: resizeWindow
                        x: 884
                        y: 0
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0
                        cursorShape: Qt.SizeFDiagCursor

                        Image {
                            id: resizeImage
                            width: 16
                            height: 16
                            opacity: 0.5
                            anchors.fill: parent
                            source: "../image/svg_images/resize_icon.svg"
                            mipmap: true
                            sourceSize.height: 16
                            sourceSize.width: 16
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }

                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                                             }
                        }

                    }


                }


            }
        }
    }

    DropShadow{
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }


    // MOUSE ARGUMENT FOR RESIZING IN 4 SIDE FOR APP

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.LeftEdge)}
        }
    }

    MouseArea {
        id: resizeBottom
        y: 580
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.BottomEdge)}
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.RightEdge)}
        }
    }


    Connections{
        target: backend

        function onReadText(text){
            actualPage.setText = text
        }

    }





    //    MouseArea {
    //        id: resizeTop
    //        width: 10
    //        anchors.right: parent.right
    //        anchors.top: parent.top
    //        anchors.bottom: parent.bottom
    //        anchors.rightMargin: 0
    //        anchors.bottomMargin: 10
    //        anchors.topMargin: 10
    //        cursorShape: Qt.SizeVerCursor

    //        DragHandler{
    //            target: null
    //            onActiveChanged: if(active){mainWindow.startSystemResize(Qt.RightEdge)}
    //        }
    //    }

}


