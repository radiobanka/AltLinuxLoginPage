import QtQuick 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.15

Item
{
    id: progress
    implicitWidth: 250
    implicitHeight: 250

    property bool roundCap: true
    property int startAngle: -90
    property real maxValue: 100
    property real value: 30
    property int samples: 12
    property bool enableDropShadow: false
    property color dropShadowColor: "#20000000"
    property int dropShadowRadius: 10
    property color bgColor: "transparent"
    property color bgStrokeColor: "#7e7e7e"
    property int strokeBgWigdht: 16
    //Progress Circle
    property color progressColor: "#55aaff"
    property int progressWidth: 16
    //Text
    property string text:  "%"
    property bool textShowValue: true
    property string textFontFamily: "Segoe UI"
    property int textSize: 12
    property color textColor: "#7c7c7c"


    QtObject
    {
        id: internal

        property Component dropShadow: DropShadow
        {

            color: progress.dropShadowColor
            fast: true
            verticalOffset: 0
            horizontalOffset: 0
            samples: progress.samples
            radius: progress.dropShadowRadius
        }
    }


    Shape
    {
        id: shape
        anchors.fill: parent
        layer.enabled: true
        layer.samples: progress.samples
        layer.effect: progress.enableDropShadow ? internal.dropShadow : null

        ShapePath
        {
            id: pathBG
            strokeColor: progress.bgStrokeColor
            fillColor: progress.bgColor
            strokeWidth:  progress.strokeBgWigdht
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap
            PathAngleArc
            {
                radiusX: (progress.width / 2) - (progress.strokeBgWigdht > progress.progressWidth ? (progress.strokeBgWigdht / 2) : (progress.progressWidth / 2))
                radiusY: (progress.height / 2) - (progress.strokeBgWigdht > progress.progressWidth ? (progress.strokeBgWigdht / 2) : (progress.progressWidth / 2))
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle: 360
            }
        }

        ShapePath
        {
            id: path
            strokeColor: progress.progressColor
            fillColor: "transparent"
            strokeWidth:  progress.progressWidth
            capStyle: progress.roundCap ? ShapePath.RoundCap : ShapePath.FlatCap
            PathAngleArc
            {
                radiusX: (progress.width / 2) - (progress.strokeBgWigdht > progress.progressWidth ? (progress.strokeBgWigdht / 2) : (progress.progressWidth / 2))
                radiusY: (progress.height / 2) - (progress.strokeBgWigdht > progress.progressWidth ? (progress.strokeBgWigdht / 2) : (progress.progressWidth / 2))
                centerX: progress.width / 2
                centerY: progress.height / 2
                startAngle: progress.startAngle
                sweepAngle:(360 / progress.maxValue * progress.value)
            }
        }

        Text
        {
            id: textProgress
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            color: progress.textColor
            text: progress.textShowValue ? parseInt(progress.value) + progress.text : progress.text
            font.pointSize: progress.textSize
            font.family: progress.textFontFamily

        }
    }
}
