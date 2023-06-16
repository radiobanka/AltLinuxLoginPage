import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import QtQuick.Timeline 1.0
import "components"

Window {
    id: splashScreen
    width: 380
    height: 580
    visible: true
    property alias bg: bg
    title: qsTr("Alt Login Screen")

    Rectangle {
        id: bg
        width: 360
        height: 560
        color: "#c0bfbc"
        radius: 10
        anchors.verticalCenter: parent.verticalCenter
        smooth: true
        antialiasing: false
        anchors.verticalCenterOffset: 0
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        z: 1

        CircularProgressBar {
            id: circularProgressBar
            opacity: 1
            text: "%"
            anchors.verticalCenter: parent.verticalCenter
            enableDropShadow: true
            value: 100
            smooth: true
            progressColor: "#e99630"
            anchors.horizontalCenter: parent.horizontalCenter
        }


        CustomTestField {
            id: textUsername
            y: 367
            width: 288
            height: 38
            opacity: 1
            color: "#81848c"
            text: ""
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 160
            anchors.horizontalCenter: parent.horizontalCenter
            font.weight: Font.Bold
            antialiasing: false
            placeholderTextColor: "#7b7d81"
            colorMouseOver: "#f0c92c"
            colorDefault: "#f6f5f2"
            smooth: true
            placeholderText: "Введите имя пользователя"
        }

        CustomTestField {
            id: textPassword
            y: 411
            width: 288
            height: 40
            opacity: 1
            color: "#81848c"
            text: ""
            anchors.bottom: parent.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.bottomMargin: 109
            anchors.horizontalCenter: parent.horizontalCenter
            placeholderTextColor: "#7b7d81"
            colorMouseOver: "#f0c92c"
            font.weight: Font.Bold
            colorDefault: "#f7f7f7"
            smooth: true
            placeholderText: "Введите пароль"
            echoMode: TextInput.Password
        }

        CustomButton {
            id: btnLogin
            x: 30
            y: 465
            width: 300
            height: 40
            opacity: 1
            text: "Войти"
            anchors.bottom: parent.bottom
            font.weight: Font.Bold
            scale: 1
            smooth: true
            checkable: false
            autoRepeat: false
            font.pointSize: 10
            colorPressed: "#cfcfcd"
            colorMouseOver: "#f0c92c"
            colorDefault: "#f07b2c"
            anchors.bottomMargin: 50
            anchors.horizontalCenter: parent.horizontalCenter
        }
        Label {
            id: label
            y: 295
            opacity: 0
            color: "#25272c"
            text: qsTr("Войти в AltLinux")
            horizontalAlignment: Text.AlignHCenter
            styleColor: "#0f0e0e"
            antialiasing: true
            font.weight: Font.Bold
            scale: 1
            smooth: true
            anchors.bottomMargin: 15
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
            clip: true
        }

        CustomButton {
            id: btnClose
            x: 20
            width: 30
            height: 30
            opacity: 1
            text: "x"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 15
            anchors.topMargin: 15
            colorMouseOver: "#f0c92c"
            smooth: true
            font.pointSize: 10
            checkable: false
            colorPressed: "#cfcfcd"
            colorDefault: "#f07b2c"
            scale: 1
            onClicked: splashScreen.close()
        }

        Image {
            id: logo
            x: 16
            y: 8
            width: 320
            height: 141
            opacity: 0
            source: "image/logo.png"
            fillMode: Image.PreserveAspectFit
        }
    }

    DropShadow
    {
        x: 10
        y: 10
        anchors.fill: bg
        source: bg
        verticalOffset: 0
        horizontalOffset: 0
        radius: 10
        color: "#40000000"
        z: 0
    }

    Timeline {
        id: timeline
        animations: [
            TimelineAnimation {
                id: timelineAnimation
                running: true
                duration: 5000
                loops: 1
                to: 3000
                from: 0
            }
        ]
        enabled: true
        endFrame: 5000
        startFrame: 0

        KeyframeGroup {
            target: circularProgressBar
            property: "value"

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                frame: 1030
                value: 100
            }
        }

        KeyframeGroup {
            target: circularProgressBar
            property: "opacity"

            Keyframe {
                frame: 1030
                value: 1
            }

            Keyframe {
                frame: 1428
                value: 0
            }

            Keyframe {
                frame: 0
                value: "0"
            }
        }

        KeyframeGroup {
            target: label
            property: "opacity"

            Keyframe {
                frame: 2443
                value: 1
            }

            Keyframe {
                frame: 1834
                value: 0
            }

            Keyframe {
                frame: 0
                value: "0"
            }
        }

        KeyframeGroup {
            target: textPassword
            property: "opacity"

            Keyframe {
                frame: 2581
                value: 0
            }

            Keyframe {
                frame: 2844
                value: 1
            }

            Keyframe {
                frame: 0
                value: "0"
            }
        }

        KeyframeGroup {
            target: textUsername
            property: "opacity"

            Keyframe {
                frame: 2534
                value: 0
            }

            Keyframe {
                frame: 2854
                value: 1
            }

            Keyframe {
                frame: 0
                value: "0"
            }
        }

        KeyframeGroup {
            target: btnLogin
            property: "opacity"

            Keyframe {
                frame: 2688
                value: 0
            }

            Keyframe {
                frame: 2850
                value: 1
            }

            Keyframe {
                frame: 0
                value: "0"
            }
        }

        KeyframeGroup {
            target: bg
            property: "height"

            Keyframe {
                frame: 1868
                value: 360
            }

            Keyframe {
                frame: 2591
                value: 560
            }

            Keyframe {
                frame: 0
                value: "360"
            }
        }

        KeyframeGroup {
            target: logo
            property: "opacity"

            Keyframe {
                easing.bezierCurve: [0.772,0.0103,0.22,0.992,1,1]
                frame: 1493
                value: 0
            }

            Keyframe {
                frame: 0
                value: 0
            }

            Keyframe {
                easing.bezierCurve: [0.2,0.2,0.8,0.8,1,1]
                frame: 2358
                value: "1"
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:2}D{i:3}D{i:4}D{i:5}D{i:6}D{i:7}D{i:8}D{i:1}D{i:9}D{i:40;property:"opacity";target:"logo_alt_company_small"}
D{i:10}
}
##^##*/
