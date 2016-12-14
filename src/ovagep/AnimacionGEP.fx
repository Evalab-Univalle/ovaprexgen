package ovagep;

import javafx.scene.*;
import javafx.animation.*;
import javafx.scene.shape.*;
import javafx.scene.paint.*;
import javafx.scene.text.*;
import javafx.util.Math.random;
import javafx.scene.control.Button;
import javafx.scene.input.MouseEvent;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.transform.Translate;
import javafx.scene.effect.Lighting;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.lang.System;

public class AnimacionGEP
{
var xtexto = 100;
var ngenes:String[]=["que","no","no534","n4534o","545no","n254o","n6563o","n35o","n65o","no4","no3","no4","no4","no4","no4","no4","no4","no4","no4","no4","no4","no4","nodfg4","no674","nereo4","235no4","norwer4","nodgfs4","n656o4","n55o4","no24"];
var nmutacion:String[]=["1","1","1","1","1","1","1","1","1","1"];
var ncruce1:String[]=["1","1","1","1","1","1","1","1","1","1"];
var ncruce2:String[]=["1","1","1","1","1","1","1","1","1","1"];
var ncruce3:String[]=["1","1","1","1","1","1","1","1","1","1"];

public var genes:String[] = bind ngenes ;
var opacidad = 0;
var opacidadtexto = 0;
var opacidadP1 = 0;
var opacidadP2 = 0;
var opacidadP3= 0;
var opacidadP4 = 0;
var opacidadP5 = 0;
var opacidadP6 = 0;
var opacidadP7 = 0;
var opacidadP8 = 0;
var opacidadP9 = 0;
var opacidadP10 = 0;
var opacidadFinal = 0;
var opacidadCruce = 0;
var opacidadCruce3 = 0;
var opacidadMutacion = 0;
var escala = 1.0;
var escala3 = 1.0;
var escala2 = 1.0;
var escalaCruce = 1.0;
var escalaMutacion = 1.0;
var crucey1 = 350;
var crucey2 = 400;
var crucex3 = 426;
var crucex4 = 426;
var crucey3 = 350;
var crucey4 = 400;
public var textos = Group
{

    content:
    [
         for (gen in [0..29])
             {
                Text {
                    x: bind xtexto +(random() * 150)
                    y: (random() *400) + 30

                    content:  genes[gen]
                    opacity: bind opacidadtexto
                    font: Font {
                                size: 14
                               }
                      }
              }

    ]
    opacity: bind opacidadtexto
 
}
var ele:String[] =["0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0",
                   "0","0","0","0","0","0","0","0","0","0","0"];
var elegidos = bind ele;

public var caja = VBox {
            spacing: 1
            opacity: bind opacidadFinal
            content: for (row in [0..9]) {
              HBox {
                spacing: 1
                content: for (column in [0..9]) {
                  Group {
                    var rectRef:Rectangle;
                    var textRef:Text;
                    content: [
                      rectRef = Rectangle {
                       width: 14
                        height: 14
                        fill: Color.WHITE
                        stroke: Color.BLACK
                        strokeWidth: 1
                      },
                      textRef = Text {
                        transforms: bind
                          Translate.translate((rectRef.layoutBounds.width -
                                     textRef.layoutBounds.width) / 2,
                                     (rectRef.layoutBounds.height -
                                     textRef.layoutBounds.height) / 2)
                        content: elegidos[row * 9 + column]
                        textOrigin: TextOrigin.TOP
                        fill: Color.BLACK
                        font: Font {
                          name: "Arial Bold"
                          size: 12
                        }
                      }
                    ]
                    }
                  }
                }
              }

              translateX: 590
              translateY: 150
            }

public var cajaMutacion =  VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLACK
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: nmutacion[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: 110
                          translateY: 450
                        }

public var grupoCruce = Group
                        {
                            content: [

                         VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLACK
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce1[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: 426
                          translateY: 350
                        }




                         VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLACK
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce2[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: 426
                          translateY: 400
                        }
                        ]

                        }

public  var animacion = Timeline
{
            keyFrames: [
                KeyFrame { time: 1s values: opacidadP1 => 1 tween Interpolator.EASEBOTH },
                KeyFrame { time: 3s values: opacidadP2 => 1 tween Interpolator.EASEBOTH },
                KeyFrame { time: 5s values: opacidadP3 => 1  tween Interpolator.EASEBOTH },
                KeyFrame { time: 4s values: xtexto => 100  tween Interpolator.EASEBOTH },
                 KeyFrame { time: 5s values: opacidadtexto => 1  tween Interpolator.EASEBOTH },


               KeyFrame { time: 14s values: xtexto => 180},
               KeyFrame { time: 14s values: opacidadtexto => 0 tween Interpolator.EASEOUT },
               KeyFrame { time: 9s values: opacidadP4 => 1 tween Interpolator.EASEOUT },
               KeyFrame { time: 13s values: opacidadP5 => 1 tween Interpolator.EASEOUT },
               KeyFrame { time: 16s values: opacidadP6 => 1 tween Interpolator.EASEOUT },
               KeyFrame { time: 18s values: opacidadCruce => 1 },
               KeyFrame { time: 18s values: opacidadMutacion => 1},
               KeyFrame { time: 21s values: escalaMutacion => 1.6 action: function() { verMutacion2() } },
               KeyFrame { time: 26s values: escalaMutacion => 1},
               
              KeyFrame { time: 26s values: escalaCruce => 1},
               KeyFrame { time: 32s values: escalaCruce => 1.6},
               KeyFrame { time: 30s values: crucey1 => 350 tween Interpolator.EASEBOTH},
               KeyFrame { time: 30s values: crucey2 => 400 tween Interpolator.EASEBOTH},
               KeyFrame { time: 30s values: crucey3 => 350 tween Interpolator.EASEBOTH},
               KeyFrame { time: 30s values: crucey4 => 400 tween Interpolator.EASEBOTH},
               KeyFrame { time: 30s values: crucex3 => 426 tween Interpolator.EASEBOTH},
               KeyFrame { time: 30s values: crucex4 => 426 tween Interpolator.EASEBOTH},
               
               KeyFrame { time: 32s values: crucey1 => 390 tween Interpolator.EASEBOTH},
               KeyFrame { time: 32s values: crucey2 => 450 tween Interpolator.EASEBOTH},
               KeyFrame { time: 32s values: crucey3 => 370 tween Interpolator.EASEBOTH},
               KeyFrame { time: 32s values: crucey4 => 480 tween Interpolator.EASEBOTH},
              
               KeyFrame { time: 34s values: crucex3 => 370 tween Interpolator.EASEBOTH},
               KeyFrame { time: 34s values: crucex4 => 520 tween Interpolator.EASEBOTH},
               KeyFrame { time: 34s values: crucey3 => 420 tween Interpolator.EASEBOTH},
               KeyFrame { time: 34s values: crucey4 => 420 tween Interpolator.EASEBOTH},

               KeyFrame { time: 37s values: crucex3 => 426 tween Interpolator.EASEBOTH},
               KeyFrame { time: 37s values: crucex4 => 489 tween Interpolator.EASEBOTH},

               KeyFrame { time: 31s values: opacidadCruce3 => 0 },
               KeyFrame { time: 32s values: opacidadCruce3 => 1   },
               KeyFrame { time: 37s values: opacidadP7 => 0 },
                KeyFrame { time: 38s values: opacidadP7 => 1 },
               KeyFrame { time: 38s values: escalaCruce => 1},
               KeyFrame { time: 39s values: opacidadFinal => 0  },
               KeyFrame { time: 40s values: opacidadFinal => 1  },
               KeyFrame { time: 40s values: opacidadP8 => 0  },
               KeyFrame { time: 41s values: opacidadP9 => 0  },
               KeyFrame { time: 41s values: opacidadP10 => 0  }

               KeyFrame { time: 42s values: opacidadP8 => 1  },
               KeyFrame { time: 42s values: opacidadP9 => 1  },
               KeyFrame { time: 42s values: opacidadP10 => 1  }

            ]
           
}

public var escenaP= Group {
        
        content: [

            Rectangle
            {
                 fill: Color.WHITESMOKE
                    width: 800
                height: 600
                strokeWidth: 2
                stroke: Color.BLACK
                opacity: 0.9
               effect: Lighting {
                        diffuseConstant: 1.0
                        specularExponent: 20
                        surfaceScale: 1.5
                        specularConstant: 1

                    }

            }



           ImageView
            {
                x: 442
                y: 82
                opacity: bind opacidadP7
                image: Image {
                    url: "{__DIR__}images/proceso7.png"
                    height: 100
                    width: 100
                }
            }

             ImageView
            {
                x: 348
                y: 75
                opacity: bind opacidadP6
                image: Image {
                    url: "{__DIR__}images/proceso6.png"
                    height: 100
                    width: 100
                }
            }

             
            ImageView
            {
                x: 252
                y: 78
                opacity: bind opacidadP5
                image: Image {
                    url: "{__DIR__}images/proceso5.png"
                    height: 110
                    width: 110
                }
            }

             ImageView
            {
                x: 160
                y: 75
                opacity: bind opacidadP4
                image: Image {
                    url: "{__DIR__}images/proceso4.png"
                    height: 100
                    width: 100
                }
            }
            ImageView
            {
                x: 60
                y: 75
                opacity: bind opacidadP3
                image: Image {
                    url: "{__DIR__}images/proceso3.jpg"
                    height: 110
                    width: 110
                }
            }
             
           
            ImageView
            {
                x: 80
                y: 50
                opacity: bind opacidadP2
                image: Image {
                    url: "{__DIR__}images/proceso2.png"
                    height: 50
                    width: 90
                }
            }
            ImageView
            {
                x: 10
                y: 10
                opacity: bind opacidadP1
                image: Image {
                    url: "{__DIR__}images/proceso1.png"
                    height: 90
                    width: 90
                }
            }


           
            ImageView
            {
                x: 535
                y: 80
                opacity: bind opacidadP8
                image: Image {
                    url: "{__DIR__}images/proceso8.png"
                    height: 180
                    width: 30
                }
            }
            ImageView
            {
                x: 30
                y: 171
                opacity: bind opacidadP9
                image: Image {
                    url: "{__DIR__}images/proceso9.png"
                    height: 90
                    width: 530
                }
            }
            ImageView
            {
                x: 35
                y: 100
                opacity: bind opacidadP10
                image: Image {
                    url: "{__DIR__}images/proceso10.png"
                    height: 110
                    width: 30
                }
            }
 
            
            
           
            


            
             /*Rectangle
            {
                 fill: Color.BLUE
                 height: 340
                 width: 310
                 x: 190
                 y: 50
                 arcHeight: 10
                 arcWidth: 10

                 strokeWidth: 2
                stroke: Color.BLACK

                opacity: 0.6


            }
            Rectangle
            {
                 fill: Color.BLUE
                 height: 45
                 width: 310
                 x: 190
                 y: 50
                 arcHeight: 50
                 arcWidth: 50

                  strokeWidth: 2
                stroke: Color.BLACK

            }


            Text {
                content: "   Mating Pool   "
                translateX: 260
                translateY: 80
                fill: Color.BLACK
                font: Font {
                    name: "Arial Bold"
                    size: 19
                }


            }*/
            
              Text {
                content: "   Elegidos   "
                translateX: 600
                translateY: 130
                opacity: bind opacidadFinal
                fill: Color.BLACK
                font: Font {
                    name: "Arial Bold"
                    size: 20
                     }
                }

            textos,

            caja,

              


          Group{

          content: [

                        cajaMutacion,

                        Text {
                                content: "  Mutación   "
                                translateX: 120
                                translateY: 420
                                fill: Color.BLACK

                                font: Font {
                                    name: "Arial Bold"
                                    size: 20
                                }


                            }
                ]
                
                scaleX: bind escalaMutacion
                scaleY: bind escalaMutacion
                opacity: bind opacidadMutacion
            }
             Group{
                       content: [
                           grupoCruce,
                         Text {
                            content: "   Cruce   "
                            translateX: 450
                            translateY: 340
                            fill: Color.BLACK
                            font: Font {
                                name: "Arial Bold"
                                size: 20
                            }



                        }
                    ]

                     scaleX: bind escalaCruce
                     scaleY: bind escalaCruce
                     opacity: bind opacidadCruce
             }


             Button {
                        translateX:150
                        translateY:550
                        text: "Pausa"

                        scaleX: bind escala2
                        scaleY: bind escala2
                       
                        onMouseClicked: function(e: MouseEvent): Void
                        {
                           animacion.stop();

                        }
                        onMouseEntered: function(e: MouseEvent): Void
                        {
                            escala2 = 2.0
                        }
                        onMouseExited: function(e: MouseEvent): Void
                        {
                            escala2 = 1.0
                        }
                    }
                     Button {
                        translateX:350
                        translateY:550
                        text: "Empezar"

                        scaleX: bind escala3
                        scaleY: bind escala3

                        onMouseClicked: function(e: MouseEvent): Void
                        {
                           animacion.play();

                        }
                        onMouseEntered: function(e: MouseEvent): Void
                        {
                            escala3 = 2.0
                        }
                        onMouseExited: function(e: MouseEvent): Void
                        {
                            escala3 = 1
                        }
                    }



        ]
        visible: false

}


public var boton = Button {
                        translateX:500
                        translateY:550
                        text: "Cerrar"

                        scaleX: bind escala
                        scaleY: bind escala
                        visible: false
                        onMouseClicked: function(e: MouseEvent): Void
                        {
                            escenaP.visible= false;
                           e.node.visible = false;

                        }
                        onMouseEntered: function(e: MouseEvent): Void
                        {
                            escala = 2.0
                        }
                        onMouseExited: function(e: MouseEvent): Void
                        {
                            escala = 1.0
                        }
                    }




    public  function empezarAnimacion()
    {
       animacion.playFromStart();
    }
     public  function continuarAnimacion()
    {
       animacion.play();
    }
    public  function pararAnimacion()
    {
       animacion.stop();
    }

    
    public function crearArregloGenes(datos:String[])
    {
        for(i in [0..39])
        {
            if(datos[i].length()>25)
            ngenes[i] = datos[i].substring(0, 25);
            
        }

       textos.content=
       [ for (gen in [0..39])
             {
                Text {
                    x: bind xtexto +(random() * 180)
                    y: (random() *260) + 200

                    content:  genes[gen]
                    opacity: bind opacidadtexto
                    font: Font {
                                name: "Arial Bold"
                                size: 10
                               }
                      }
              }
              ]

    }

    public function verMutacion2()
    {
         var colorm:Color[]=[Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK];
         var colorm2:Color[]=[Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK,Color.BLACK];

       
            for(j in [0..4])
            {

               var num:Integer = (random()*90) as Integer;
               var num2:Integer = (random()*10) as Integer;
                nmutacion[num2] =  ele[num];
               colorm[num2]=Color.BLUE;
               colorm2[num2]=Color.RED;
               
            }

              System.err.println(colorm);
        cajaMutacion.content=
              HBox {
                spacing: 1
                content: for (column in [0..9])
                {
                  Group {
                    var rectRef:Rectangle;
                    var textRef:Text;
                    content: [
                      rectRef = Rectangle {
                       width: 14
                        height: 14

                        
                        strokeWidth: 1
                        stroke:  colorm[column]
                        

                        fill:  Color.WHITE
                         
                      },
                      textRef = Text {
                        transforms: bind
                          Translate.translate((rectRef.layoutBounds.width -
                                     textRef.layoutBounds.width) / 2,
                                     (rectRef.layoutBounds.height -
                                     textRef.layoutBounds.height) / 2)
                        content: nmutacion[column]
                        textOrigin: TextOrigin.TOP
                       fill:  colorm2[column]
                         
                        font: Font {
                          name: "Arial Bold"
                          size: 12
                        }
                      }
                    ]
                    }
                  }
                }
              
    }

    public function verCruce(dato1:String,dato2:String)
    {

            for(j in [0..9])
            {
               if(j<dato1.length())
               {
                ncruce1[j] = dato1.substring(j, (j+1));
                }
                else
                ncruce1[j] = " ";

            }

             for(j in [0..9])
            {
               if(j<dato2.length())
               {
                ncruce2[j] = dato2.substring(j, (j+1));
                }
                else
                ncruce2[j] = " ";

            }

           // var numero = ((random()*6) + 2) as Integer;
              var numero = 4;

              for(j in [0..9])
            {

               if(j<dato2.length())
               {
                   if(j<numero)
                   {
                        ncruce3[j] = dato1.substring(j, (j+1));
                   }
                   else
                   {
                        ncruce3[j] = dato2.substring(j, (j+1));
                   }
                }
                else
                ncruce3[j] = " ";

            }

        grupoCruce.content =[

                         VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLACK
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce1[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: 426
                          translateY: bind crucey1



                        }




                         VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLACK
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce2[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: 426
                          translateY:  bind crucey2
                        }


                         VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [0..(numero-1)]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.BLUE
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce3[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: bind crucex3
                          translateY: bind crucey3
                          opacity: bind opacidadCruce3
                        }
                        //////otro cruce

                        VBox {
                        spacing: 1

                        content:
                          HBox {
                            spacing: 1
                            content: for (column in [numero..9]) {
                              Group {
                                var rectRef:Rectangle;
                                var textRef:Text;
                                content: [
                                  rectRef = Rectangle {
                                   width: 14
                                    height: 14
                                    fill: Color.WHITE
                                    stroke: Color.RED
                                    strokeWidth: 1
                                  },
                                  textRef = Text {
                                    transforms: bind
                                      Translate.translate((rectRef.layoutBounds.width -
                                                 textRef.layoutBounds.width) / 2,
                                                 (rectRef.layoutBounds.height -
                                                 textRef.layoutBounds.height) / 2)
                                    content: ncruce3[column]
                                    textOrigin: TextOrigin.TOP
                                    fill: Color.BLACK
                                    font: Font {
                                      name: "Arial Bold"
                                      size: 12
                                    }
                                  }
                                ]
                                }
                              }

                          }

                          translateX: bind crucex4
                          translateY: bind crucey4
                          opacity: bind opacidadCruce3
                        }

                       ]

    }


    public function verMutacion(dato:String)
    {


            for(j in [0..9])
            {
               if(j<dato.length())
               {
                nmutacion[j] = dato.substring(j, (j+1));
                }
                else
                nmutacion[j] = " ";

            }

        cajaMutacion.content= {
              HBox {
                spacing: 1
                content: for (column in [0..9]) {
                  Group {
                    var rectRef:Rectangle;
                    var textRef:Text;
                    content: [
                      rectRef = Rectangle {
                       width: 14
                        height: 14
                        fill: Color.WHITE
                        stroke: Color.BLACK
                        strokeWidth: 1
                      },
                      textRef = Text {
                        transforms: bind
                          Translate.translate((rectRef.layoutBounds.width -
                                     textRef.layoutBounds.width) / 2,
                                     (rectRef.layoutBounds.height -
                                     textRef.layoutBounds.height) / 2)
                        content: nmutacion[column]
                        textOrigin: TextOrigin.TOP
                        fill: Color.BLACK
                        font: Font {
                          name: "Arial Bold"
                          size: 12
                        }
                      }
                    ]
                    }
                  }
                }
                }

    }



     public function crearElegidos(datos:String[])
    {
        var dato:String;
         for(i in [0..9])
        {
            dato = datos[i];
            for(j in [0..9])
            {
               if(j<dato.length())
               {
                ele[i * 9 + j] = dato.substring(j, (j+1));
                }
                else
                ele[i * 9 + j] = " ";

            }

        }

        caja.content= for (row in [0..9]) {
              HBox {
                spacing: 1
                content: for (column in [0..9]) {
                  Group {
                    var rectRef:Rectangle;
                    var textRef:Text;
                    content: [
                      rectRef = Rectangle {
                       width: 14
                        height: 14
                        fill: Color.WHITE
                        stroke: Color.BLACK
                        strokeWidth: 1
                      },
                      textRef = Text {
                        transforms: bind
                          Translate.translate((rectRef.layoutBounds.width -
                                     textRef.layoutBounds.width) / 2,
                                     (rectRef.layoutBounds.height -
                                     textRef.layoutBounds.height) / 2)
                        content: ele[row * 9 + column]
                        textOrigin: TextOrigin.TOP
                        fill: Color.BLACK
                        font: Font {
                          name: "Arial Bold"
                          size: 12
                        }
                      }
                    ]
                    }
                  }
                }
              }
    }

   
}
 function crearArreglo(datos:String[]):String[]
{
    var dato:String = "";
    var elegidos:String[];
    for(i in [0..10])
    {
        dato = datos[i];

        for(j in [0..9])
        {
            elegidos[i]= dato.substring(j);
        }
    }


}





