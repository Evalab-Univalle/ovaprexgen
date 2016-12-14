/*
 * Main.fx
 *
 * Created on 17/02/2010, 04:17:50 PM
 */
package ovagep;

import javafx.scene.*;
import javafx.scene.paint.*;
import javafx.scene.text.*;
import javafx.scene.Scene;
import javafx.scene.text.Font;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.Color;
import javafx.scene.effect.Lighting;
import javafx.scene.effect.light.SpotLight;
import javafx.scene.effect.DropShadow;
import javafx.scene.text.Text;
import javafx.scene.Cursor;
import javafx.scene.input.MouseEvent;
import javafx.scene.Group;
import javafx.scene.control.TextBox;
import javafx.scene.paint.*;
import javafx.scene.control.Button;
import java.lang.System;
import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import javafx.scene.shape.Ellipse;
import javafx.ext.swing.SwingComboBox;
import javafx.ext.swing.SwingComboBoxItem;
import ovagep.InterfazGep;
import javafx.ext.swing.SwingComponent;
import javafx.scene.layout.VBox;
import javafx.stage.Alert;
import ovagep.Graficas;
import ovagep.AnimacionGEP;
import javafx.stage.Stage;
import java.lang.NumberFormatException;

/**
 * @author eva-04
 */
var ex: Float = 250;
var ey: Float = 40;
var exc: Float = 40;
var eyc: Float = 100;
var exc1: Float = 560;
var eyc1: Float = 80;
var exc2: Float = 560;
var eyc2: Float = 325;
var lisx: Float = 10;
var lisy: Float = 10;
var ayuda1 = Mensajes.scroll1;
var ayuda2 = Mensajes.scroll2;
var ayuda3 = Mensajes.scroll3;
var ptest = new InterfazGep();
var elegida = bind ptest.elegida;

var calculadora = new PanelCalculadora();
var animacion = new AnimacionGEP;
var derivada = new Derivada();
var integral = new Integral();
var graficas = new Graficas();
var puntos = new Puntos();


ptest.organizarGUI();
        var dx = NumberTextBox
        {
            translateX: 640
            translateY: 190
            columns: 8
        }

        var valorMin = TextBox
        {
            translateX: 710
            translateY: 210
            columns: 8
        }
        var valorMax = TextBox
        {
            translateX: 710
            translateY: 232
            columns: 8
            onKeyTyped: function(e) 
            {

                if(opciones.selectedIndex ==1)
                       cuadro.visible = true;
             }  
        }

        var valorMin2 = TextBox
        {
            translateX: 780
            translateY: 210
            columns: 8


        }
        var valorMax2 = TextBox
        {
            translateX: 780
            translateY: 232
            columns: 8
        }

        var cuadro =  Group
        {
                content: [
                           Rectangle {
                                    width: 100, height: 70
                                    fill: Color.GRAY
                                    x: 770 y: 190
                                    arcWidth: 5 arcHeight: 5
                                    opacity: 0.3
                                    stroke: Color.BLACK
                                    strokeWidth: 3
                                    effect: Lighting {
                                        surfaceScale: 7
                                        light: SpotLight {
                                            x: 0 y: 0 z: 90
                                            pointsAtX: 10
                                            pointsAtY: 10
                                            pointsAtZ: 1
                                            color: Color.WHITE
                                        }
                                    }
                                }
                                Text {
                            content: "Nuevo Rango"
                            translateX: 780
                            translateY: 205
                            font: Font {
                                name: "Times New Roman bold"
                                size: 12
                            }
                        
                       
                        }
                        valorMin2,valorMax2
                        ]
                        visible: false
           }

           var opciones = SwingComboBox
           {
            translateX: 645
            translateY: 105
            width: 150
            text: "Escoger"

            font: Font {
                name: "Times New Roman bold"
                size: 14
            }
            // foreground: Color.BLACK
            effect: DropShadow {
                offsetX: 5
                offsetY: 5
                color: Color.BLACK
                radius: 10
            }

            items: [
                SwingComboBoxItem {
                    text: "Interpolación Simbolica"
                    value: "opcion1"
                    selected: true
                }
                SwingComboBoxItem {
                    text: "Predicción Simbolica"
                    value: "opcion2"
                }
                SwingComboBoxItem {
                    text: "Intergral Simbolica"
                    value: "opcion3"
                }
                SwingComboBoxItem {
                    text: "Derivada Simbolica"
                    value: "opcion4"
                }
                
                ]

               }
Stage {
    title: "OVAGEP"
    width: 900
    height: 740
    scene: Scene {
        content: [
            Rectangle {
                x: 1, y: 1
                width: 890, height: 770
                arcWidth: 15 arcHeight: 15
                fill: Color.WHITE
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 900
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.LIGHTGRAY
                    }
                }
            }
            Rectangle {
                arcWidth: 15 arcHeight: 15
                width: 500, height: 500
                fill: Color.WHITE
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 900
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
                x: bind exc y: bind eyc
            }
            Rectangle {
                arcWidth: 15 arcHeight: 15
                width: 290, height: 245
                fill: Color.WHITE
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 900
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
                x: bind exc1 y: bind eyc1
            }
            Rectangle {
                arcWidth: 15 arcHeight: 15
                width: 290, height: 295
                fill: Color.WHITE
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 900
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
                x: bind exc2 y: bind eyc2
            }
            Group {
                content: [
                    Rectangle {
                        width: 640, height: 40
                        fill: Color.BLACK
                        //opacity:0.5

                        arcWidth: 5 arcHeight: 5
                        stroke: Color.WHITE
                        x: bind ex - 150 y: bind ey - 25
                        effect: DropShadow {
                            offsetX: 10
                            offsetY: 10
                            color: Color.GRAY
                            radius: 10
                        }
                    }
                    Text {
                        effect: DropShadow {
                            offsetX: -3
                            offsetY: -3
                        }
                        font: Font {
                            name: "Times New Roman bold"
                            size: 24
                        }
                        fill: Color.WHITE
                        stroke: Color.WHITE, strokeWidth: 0.5
                        x: bind ex y: bind ey
                        content: "Objeto Virtual de Aprendizaje para GEP"
                    }
                ]
            }
            Rectangle {
                width: 810, height: 70
                fill: Color.BLACK
                x: 40 y: 625
                arcWidth: 5 arcHeight: 5
                stroke: Color.WHITE
                effect: DropShadow {
                    offsetX: 10
                    offsetY: 10
                    color: Color.BLACK
                    radius: 10
                }
            }
            Ellipse {
                centerX: 100, centerY: 100
                radiusX: 70, radiusY: 20
                translateX: 33
                translateY: 559
                strokeWidth: 2
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.GRAY
                    radius: 15
                }
                stroke: Color.WHITE
                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda1.visible = true

                }
            }
            Text {
                content: "   Ayuda GEP   "
                translateX: 75
                translateY: 665
                fill: Color.WHITE
                font: Font {
                    name: "Times New Roman bold"
                    size: 18
                }

                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda1.visible = true

                }
            }
            Ellipse {
                centerX: 100, centerY: 100
                radiusX: 80, radiusY: 23
                translateX: 212
                translateY: 559
                strokeWidth: 2
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.GRAY
                    radius: 15
                }
                stroke: Color.WHITE
                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda2.visible = true

                }
            }
            Text {
                content: "   Ayuda Aplicación   "
                translateX: 230
                translateY: 665
                fill: Color.WHITE
                font: Font {
                    name: "Times New Roman bold"
                    size: 18
                }
                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda2.visible = true

                }
            }
            Ellipse {
                centerX: 100, centerY: 100
                radiusX: 60, radiusY: 21
                translateX: 380
                translateY: 559
                strokeWidth: 2
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.GRAY
                    radius: 15
                }
                stroke: Color.WHITE
                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda3.visible = true

                }
            }
            Text {
                content: "  Acerca de  "
                translateX: 435
                translateY: 665
                fill: Color.WHITE
                font: Font {
                    name: "Times New Roman bold"
                    size: 18
                }
                cursor: Cursor.HAND
                onMouseEntered: function(e: MouseEvent): Void {


                    ayuda3.visible = true

                }
            }
            Ellipse {
                centerX: 100, centerY: 100
                radiusX: 60, radiusY: 20
                translateX: 670
                translateY: 557
                strokeWidth: 2
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.GRAY
                    radius: 15
                }
                stroke: Color.WHITE
                cursor: Cursor.HAND
                onMouseClicked: function(e: MouseEvent): Void {
                  
                     System.exit(0);
                }

            }
            Text {
                content: "Salir"
                translateX: 750
                translateY: 665
                fill: Color.WHITE
                font: Font {
                    name: "Times New Roman bold"
                    size: 24
                }
                cursor: Cursor.HAND
                onMouseClicked: function(e: MouseEvent): Void {

                   
                  
                }
            }


             Ellipse {
                centerX: 100, centerY: 100
                radiusX: 60, radiusY: 20
                translateX: 520
                translateY: 557
                strokeWidth: 2
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.GRAY
                    radius: 15
                }
                stroke: Color.WHITE
                cursor: Cursor.HAND
                onMouseClicked: function(e: MouseEvent): Void {

                  if(ptest.elegida.equals(""))
                  {}
                  else
                  {
                      animacion.crearElegidos(ptest.genes);
                      animacion.crearArregloGenes(ptest.palPool);
                      animacion.verMutacion(ptest.palPool[16]);
                      animacion.verCruce(ptest.palPool[2],ptest.palPool[32]);
                      animacion.empezarAnimacion();

                      animacion.escenaP;
                      animacion.escenaP.visible = true;
                      animacion.boton.visible = true;
                 }
                }

            }
            Text {
                content: "Animación"
                translateX: 580
                translateY: 665
                fill: Color.WHITE
                font: Font {
                    name: "Times New Roman bold"
                    size: 18
                }
                cursor: Cursor.HAND
                onMouseClicked: function(e: MouseEvent): Void {



                }
            }
            Rectangle {
                width: 260, height: 50
                fill: Color.GRAY
                x: 575 y: 95
                arcWidth: 5 arcHeight: 5
                opacity: 0.3
                stroke: Color.BLACK
                strokeWidth: 3
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 90
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
            }

            Button {
                text: "         Ecuación             "
                font: Font {
                    name: "Times New Roman bold"
                    size: 16
                }
                translateX: 600
                translateY: 160
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.BLACK
                    radius: 10
                }
                onMouseClicked: function(e: MouseEvent): Void {
                    calculadora.calc.visible = true;
                    calculadora.boton.visible = true;





                }
            }
            TextBox {
                translateX: 615
                translateY: 255
                columns: 24
                editable: false

                text: bind calculadora.displayStr;
            }
            Text {
                content: "Dx"
                translateX: 605
                translateY: 205
                font: Font {
                    name: "Times New Roman bold"
                    size: 14
                }
            }

             Text {
                content: "Valor min"
                translateX: 605
                translateY: 227
                font: Font {
                    name: "Times New Roman bold"
                    size: 14
                }
            }
            Text {
                content: "Valor max"
                translateX: 605
                translateY: 248
                font: Font {
                    name: "Times New Roman bold"
                    size: 14
                }
            }

            Button {
                text: "           Comenzar          "
                font: Font {
                    name: "Times New Roman bold"
                    size: 16
                }
                translateX: 600
                translateY: 280
                effect: DropShadow {
                    offsetX: 5
                    offsetY: 5
                    color: Color.BLACK
                    radius: 10
                }

                cursor: Cursor.HAND
                onMouseClicked: function(e: MouseEvent): Void {

                 
                    var texto = calculadora.displayStr;
                    var tdx = dx.text;
                    var tvmin = valorMin.text;
                    var tvmax = valorMax.text;

                    if (texto.equals("") or tdx.equals("") or tvmin.equals("") or tvmax.equals(""))
                    {
                        Alert.confirm("Debe llenar los campo de la ecuación, Dx, Valor min y valor max son obligatorios");

                        
                    }
                    else if( (notNumeric(tvmin)) or (notNumeric(tvmax)) or notNumeric(tdx))
                    {
                         Alert.confirm( "Los campos Dx, Valor min y valor max deben ser todos numeros");

                    }
                    else
                    {

                        graficas.borrarDatos();
                        ptest.iniciarElegidos();
                        
                        if(Double.valueOf(tvmin)>Double.valueOf(tvmax))
                        {
                            valorMin.text = valorMax.text;
                            valorMax.text = tvmin;
                            tvmin = valorMin.text;
                            tvmax = valorMax.text;
                        }
                        puntos.crearArreglos(texto,tdx,tvmin,tvmax);
                     
                      

                        if (opciones.getJComboBox().getSelectedIndex() == 0) {

                            graficas.verGrafico(puntos.obtenerInicialesd(), puntos.obtenerImagenesd(),0);

                            ptest.iniciar(puntos.obtenerInicialesd(), puntos.obtenerImagenesd());

                        }
                        else if (opciones.getJComboBox().getSelectedIndex() == 1) {


                            //+String.valueOf(valorMax2.text));
                            graficas.verGrafico(puntos.obtenerInicialesd(), puntos.obtenerImagenesd(),0);
                             var tvmin2 = valorMin2.text;
                             var tvmax2 = valorMax2.text;
                               puntos.crearArreglos(texto,tdx,tvmin2,tvmax2);
                                graficas.verGrafico(puntos.obtenerInicialesd(), puntos.obtenerImagenesd(),1);

                             ptest.iniciar(puntos.obtenerInicialesd(), puntos.obtenerImagenesd());

                        }else if (opciones.getJComboBox().getSelectedIndex() == 3) {

                        

                            graficas.verGrafico(puntos.obtenerInicialesd(), puntos.obtenerImagenesd(),0);

                            ptest.iniciar(puntos.obtenerInicialesd1(), derivada.calcularDerivada(Double.parseDouble(dx.text), puntos.obtenerImagenesd()));

                        } else if (opciones.getJComboBox().getSelectedIndex() == 2) {

                            graficas.verGrafico(puntos.obtenerInicialesd1(), puntos.obtenerImagenesd(),0);

                            ptest.iniciar(puntos.obtenerInicialesd(), integral.calcularIntegral(Double.parseDouble(dx.text), puntos.obtenerImagenesd()));
                                integral.ver();
                        }

                        //  derivada.ver();
                        //  integral.ver();
                        ptest.setSize(200, 200);
                        ptest.setVisible(true);

                    }




                }
            }

            Rectangle {
                width: 260, height: 158
                fill: Color.GRAY
                x: 575 y: 155
                arcWidth: 5 arcHeight: 5
                opacity: 0.3
                stroke: Color.BLACK
                strokeWidth: 3
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 90
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
            }
            Rectangle {
                width: 260, height: 260
                fill: Color.GRAY
                x: 575 y: 340
                arcWidth: 5 arcHeight: 5
                opacity: 0.3
                stroke: Color.BLACK
                strokeWidth: 3
                effect: Lighting {
                    surfaceScale: 7
                    light: SpotLight {
                        x: 0 y: 0 z: 200
                        pointsAtX: 10
                        pointsAtY: 10
                        pointsAtZ: 1
                        color: Color.WHITE
                    }
                }
            }
            Text {
                font: Font {
                    name: "Times New Roman bold"
                    size: 16
                }
                translateX: 585
                translateY: 125
                content: "Metodo"
            }

            ImageView {
                x: bind lisx with inverse;
                y: bind lisy with inverse;

                translateX: 573
                translateY: 340

                image: Image {
                    url: "{__DIR__}images/arbol_tesis.jpg"
                    height: 240
                    width: 245
                }
            }

           
            
            opciones, dx,valorMin,valorMax,
          
            VBox {
                content: [

                    SwingComponent.wrap(graficas),
                ]
                translateX: 60
                translateY: 120
                width: 400
                height: 400
            },
            VBox {
                content: [

                    SwingComponent.wrap(ptest),
                ]

                translateX: 583
                translateY: 345
                width: 350
                height: 350

                onMouseClicked: function(e: MouseEvent): Void {
                    if (ptest.elegida.equals("")) { } 
                    else if(opciones.selectedIndex==1)
                    {
                         puntos.crearArreglos(ptest.elegida, dx.text,valorMin2.text,valorMax2.text);
                        var iniciales = puntos.obtenerInicialesd();
                        var imagenes = puntos.obtenerImagenesd();
                        graficas.verGrafico(iniciales, imagenes,3);
                    }
                    else {
                        puntos.crearArreglos(ptest.elegida, dx.text,valorMin.text,valorMax.text);
                        var iniciales = puntos.obtenerInicialesd();
                        var imagenes = puntos.obtenerImagenesd();
                        graficas.verGrafico(iniciales, imagenes,3);
                    }

                }
            },
            ayuda1, ayuda2, ayuda3, calculadora.calc, calculadora.boton,cuadro,animacion.escenaP,animacion.boton,
        ]
       
    }

}

 function notNumeric(cadena:String ):Boolean
 {
	try {
		Double.valueOf(cadena);
		return false;
	}
        catch (nex:NumberFormatException ){
		return true;
	}
}