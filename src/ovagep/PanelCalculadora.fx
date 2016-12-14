/*
 * PanelCalculadora.fx
 *
 * Created on 8/06/2010, 04:50:51 PM
 */

package ovagep;
import javafx.scene.*;
import javafx.scene.input.*;
import javafx.scene.layout.*;
import javafx.scene.paint.*;
import javafx.scene.shape.*;
import javafx.scene.text.*;
import javafx.scene.transform.*;
import javafx.scene.control.TextBox;
import javafx.stage.Alert;


/**
 * The "stage" for the application
 */

public class PanelCalculadora
{
    var  miParse =new Parseador();
     public     var displayStr:String;
     public   var calc =  Group {
  // The model



  var keyLabels = ["7", "8", "9","cos","sin","tan",
                   "4", "5", "6", "*","^","sqrt",
                   "1", "2", "3" ,"log","(",")",
                   "0", "x" , "+", "/", "-"," ce "];


    // The gradient on the calculator keys
    var btnGradient = LinearGradient {
      startX: 0.0, startY: 0.0,
      endX: 0.0, endY: 1.0
      stops: [
        Stop {
          offset: 0.0
          color: Color.web('#a6a6a8')
        },
        Stop {
          offset: 1.0
          color: Color.web('#7a7a7a')
        }
      ]
    };
    content: [
      // The rounded rectangle behind the entire calculator

      Rectangle {
        width: 420
        height: 350
        arcWidth: 16
        arcHeight: 16
        fill: LinearGradient {
          startX: 0.0, startY: 0.0,
          endX: 0.5, endY: 1.0
          stops: [
            Stop {
              offset: 0.0
              color: Color.web('#77747b')
            },
            Stop {
              offset: 1.0
              color: Color.web('#020202')
            }
          ]
        },
      },
      VBox {
        transforms: bind Translate.translate(20, 20)
        spacing: 27
        content: [
          // The calculator's display
          TextBox {
            text: bind displayStr
            width: 500
            columns:20
            height: 100
            editable: false
            font: Font {
                          name: "Arial Bold"
                          size: 24
                        }
          },
          // The calculator's keys
          VBox {
            spacing: 2
            content: for (row in [0..3]) {
              HBox {
                spacing: 2
                content: for (column in [0..5]) {
                  Group {
                    var rectRef:Rectangle;
                    var textRef:Text;
                    content: [
                      rectRef = Rectangle {
                        width: 58
                        height: 50
                        fill: btnGradient
                      },
                      textRef = Text {
                        transforms: bind
                          Translate.translate((rectRef.layoutBounds.width -
                                     textRef.layoutBounds.width) / 2,
                                     (rectRef.layoutBounds.height -
                                     textRef.layoutBounds.height) / 2)
                        content: keyLabels[row * 6 + column]
                        textOrigin: TextOrigin.TOP
                        fill: Color.web('#dedede')
                        font: Font {
                          name: "Arial Bold"
                          size: 26
                        }
                      }
                    ]
                    onMouseClicked: function(me:MouseEvent):Void {
                        if(textRef.content.equals(" ce "))
                        {                       
                                  displayStr = "";
                        }
                        else
                        {
                            displayStr = "{displayStr}{textRef.content}"
                        }
                    }
                  }
                }
              }
            }
          }


        ]
       

        

      }
    ]
         visible: false;
         translateX: 150
         translateY: 125
}

     public var boton = Group
     {
         content:
         [
                   Ellipse {
                                    centerX: 35, centerY: -5
                                    radiusX: 60, radiusY: 20
                                      translateX: 330
                                     translateY: 445
                                    strokeWidth: 2
                                    stroke: Color.WHITE

                            },
                             Text {
                                    content: "Cerrar"
                                    translateX: 330
                                     translateY: 445

                                                    fill: Color.WHITE
                                       font: Font {
                                                       name:  "Times New Roman bold"
                                                       size: 24
                                                    }





                              }



                ]
                visible: false;
                cursor: Cursor.HAND
                onMouseClicked: function( e: MouseEvent ):Void
                {
                    if(displayStr.equals(""))
                    {
                         Alert.inform
                             ( "No hay nada escrito");
                              calc.visible = false;
                              e.node.visible = false;
                    }
                    else
                    {


                          var parseada =  miParse.parsear(displayStr);
                        if(parseada!="0")
                        {
                         calc.visible = false;
                         e.node.visible = false;
                         }
                         else
                         {
                                 Alert.inform
                                 ( "Expresion mal escrita");
                         }


                   }

                  
                  
                 }
    }

}




