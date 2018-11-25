import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import "../jsfiles/CreateObjectDynamic.js" as Createobj

Menu {
    id: menuBar
    x: parent.x+parent.width-width
    y: parent.y
    property var seetingsrightmenu: null
    property var  sharetext: null
    property var aboutpopup: null
    property var msgdbbox: null

    MenuItem {
        id:rightmenusettings
        text:qsTr("Settings")
       icon.source:"qrc:/images/settings.png"

      onTriggered: {
         // settingpopupRightmenu.open()
          if(seetingsrightmenu == null)
          {
              Createobj.createObjects("qrc:/toolcomps/SettingsRighMenu.qml",homepage)
              seetingsrightmenu = Createobj.obj
              if(seetingsrightmenu !== null) {
                 seetingsrightmenu.open()
                  console.log("seetingsrightmenu was null,now it is created and opened")
              }
              else
              {
                console.log(" RightMenuPopup : seetingsrightmenu object creation failure !!",seetingsrightmenu)
              }
          }
          else {
              seetingsrightmenu.open()
              console.log("seetingsrightmenu already created ,opened")

          }
      }
    }

    MenuItem {
        id:rightmenushare
        text:qsTr("Share")
        icon.source:"qrc:/images/share.png"
        property string textmessage: "app 1.0 please download from the link"
        property url applink: "google.in"

        onTriggered:
        {
             // sharetext.share(textmessage,applink);
            if(sharetext == null)
            {
                Createobj.createObjects("qrc:/toolcomps/ShareText.qml",homepage)
                sharetext = Createobj.obj
                if(sharetext != null) {
                    console.log("sharetext was null,now it is created and opened")
                    sharetext.share(textmessage,applink);
                }
                else
                {
                  console.log(" RightMenuPopup : sharetext object creation failure !!",sharetext)
                }
            }
            else {
                console.log("sharetext already created ,opened")
                sharetext.share(textmessage,applink);
            }

        }
    }

    MenuItem {
        id:rightmenuabout
         text:qsTr("About")
         icon.source: "qrc:/images/about.png"
         onTriggered: {
             if(aboutpopup == null) {
                 Createobj.createObjects("qrc:/toolcomps/AboutPopup.qml",homepage)
                 aboutpopup = Createobj.obj
                 if(aboutpopup !== null) {
                    aboutpopup.open()
                     console.log("aboutpopup was null,created opened")
                 }
                 else
                 {
                   console.log(" RightMenuPopup : aboutpopup object creation failure !!")
                 }
             }
             else
             {
                 aboutpopup.open()
                 console.log("aboutpopup was alraedy created,opened")
             }
         }
    }

    MenuItem {
        id:rightmenuexit
         text:qsTr("Exit")
         icon.source: "qrc:/images/exit.png"
         onTriggered: {
           if(msgdbbox == null)
           {
               Createobj.createObjects("qrc:/toolcomps/MessageDialogueBox.qml",homepage)
                msgdbbox = Createobj.obj
               if(msgdbbox !== null) {
                   msgdbbox.title= "Exit "
                   msgdbbox.text= "exit the App?"
                   msgdbbox.yes.connect(exitapp)
                   msgdbbox.no.connect(nopressed)
                   msgdbbox.visible =true
                   console.log("msgdbbox was null,now created opened")
               }
               else
               {
                 console.log(" RightMenuPopup : MessageDialogueBox object creation failure !!")
               }
         }
         else {
               msgdbbox.open()
               console.log("msgdbbox was already created,now  opened")
         }

         }
    }


    function exitapp()
    {
        Qt.quit()
        console.log("exitapp : quit pressed !! qutting application !!")
    }
    function nopressed()
    {
        console.log("nopressed : not qutting app")

    }
}
