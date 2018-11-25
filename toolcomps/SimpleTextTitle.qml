// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2

ToolBar {
    id: titleToolBar
    property alias text: titleLabel.text

    RowLayout {
        focus: false
        spacing: 6
        anchors.fill: parent
        Label{
            id: titleLabel
            text: "ekke"
            leftPadding: 16
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            color: textOnPrimary
        }
        ToolButton {
            Image {
                id: buttonImage
                anchors.centerIn: parent
                //source: "qrc:/images/"+iconOnPrimaryFolder+"/more_vert@4x.png"
                source: "qrc:/images/more_vert@2x.png"
            }
            onClicked: {
                optionsMenu.open()
                console.log(buttonImage.source)
            }
            Menu {
                id: optionsMenu
                x: parent.width - width
                transformOrigin: Menu.TopRight
                MenuItem {
                    text: isDarkTheme? qsTr("Light Theme") : qsTr("Dark Theme")
                    onTriggered: {
                      //  themePalette = myApp.swapThemePalette()
                    }
                }
                MenuItem {
                    text: headlineColoredPrimary? qsTr("Headline Accent Color") : qsTr("Headline Primary Color")
                    onTriggered: {
                        headlineColoredPrimary = !headlineColoredPrimary
                    }
                }
            } // end optionsMenu
        } // end ToolButton
    } // end RowLayout
} // end ToolBar


