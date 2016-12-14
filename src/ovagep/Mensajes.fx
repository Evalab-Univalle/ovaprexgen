/*
 * Mensajes.fx
 *
 * Created on 16/03/2010, 04:46:45 PM
 */

package ovagep;

import javafx.scene.Group;
import javafx.scene.input.MouseEvent;

/**
 * @author eva-04
 */


                    public var scroll1 = Group
                    {

                      content: [
                            InfoNode
                                    {

                                        x: 260
                                        y: 460
                                            items:
                                            [
                                                InfoItem {
                                                    title: "Manual de ayuda de OVAGEP"
                                                    summary: " OVAGEP es un objeto virtual de Aprendizaje para programación por expresión genética, el cual pretende dar a conocer este tipo de algoritmo evolutivo y su funcionamiento por medio de la integración numérica y las integrales y derivadas simbolicas   "
                                                },
                                               InfoItem {
                                                    title: " GEP"
                                                    summary: " (gene expression programing):   Programación por  expresión genética, ideado por Ferreira (Univ. Azores) en 2000.  Muy similar a GE, aunque con mas “detallitos”     "
                                                },
                                               
                                                InfoItem {
                                                    title: "  "
                                                    summary: "En GEP un gen no es un símbolo, sino una secuencia de símbolos de longitud fija"
 
                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary: "En GEP se mantiene una población de cromosomas, compuestos por genes de tamaño fijo codificados como cadenas de símbolos. Los cromosomas se reproducen como en GA (cruce, mutación, etc.). "
                                                },
                                                InfoItem {
                                                    title: "  "
                                                    summary: "Luego cada gen se convierte a un ET (expression tree = árbol de expresión), que consiste en un programa de computador. "
                                                },
                                                InfoItem {
                                                    title: "  "
                                                    summary: "La organización estructural de los genes en GEP es mejor entendida en terminos de marcos de lectura abierta (ORFs en inglés -Open Reading Frames- )  "
                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary: "En biología un ORF comienza cuando inicia el codon, continua con el aminoacido y termina cuando termina el codon, la diferencia con GEP es que no tiene que terminar cuando termina el codon lo puede hacer antes"
                                                },
                                                InfoItem {
                                                    title: "  "
                                                    summary: "Una cosa en común es que a travéz del codon en el gen de GEP también existen regiones sin codificar, en GEP serían datos que no se incluyen en la solución"
                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary: "En GEP los genes contienen una cabeza y una cola. En GEP los cromosomas están usualmente compuestos de mas de un gen de igual tamaño"
                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary: "La GEP se puede utilizar para resolver muchos tipos  de problemas en este caso vamos a resolver problemas matematicos, para hallar ecuaciones  a partir de puntos al igual que su deriva o integral. "
                                                },
                                                InfoItem {
                                                    title: " Derivada Simbólica "
                                                    summary: "Una expresión formada por funciones elementales (que admiten derivada formada por funciones elementales) permite establecer un conjunto de reglas llamadas las 'reglas de derivación' "
                                                },
                                                InfoItem {
                                                    title: "  "
                                                    summary: "que trivializan el proceso de derivar una expresión dada. Basta seguir cuidadosamente todos y cada uno de los pasos que determinan las reglas."
                                                },

                                                 InfoItem {
                                                    title: " Integración numérica "
                                                    summary: " El término cuadratura numérica (a menudo abreviado a cuadratura) es más o menos sinónimo de integración numérica, especialmente si se aplica a integrales de una dimensión a pesar de que para el caso de dos o más dimensiones (integral múltiple) también se utilizan."
                                                },
                                                 InfoItem {
                                                    title: " "
                                                    summary: "Con el desarrollo de los ordenadores, muchos profesionales, educadores y estudiantes han recurrido a los sistemas de cálculo algebraico por ordenador, que han sido diseñados específicamente para desarrollar tareas tediosas o difíciles, entre las cuales se encuentra la integración. "
                                                }
                                            ]
                                     }
                                ]


                        visible: false;
                        onMouseExited: function( e: MouseEvent ):Void
                        {
                           e.node.visible = false;
                        }


                    }

                   public var scroll2 = Group
                    {

                    content: [
                            InfoNode
                                    {

                                        x: 400
                                        y: 460
                                            items:
                                            [
                                                InfoItem {
                                                    title: " Manual de Ayuda  "
                                                    summary: "Ahora paso por paso veremos que debemos hacer para interactuar con la aplicación"
                                                },
                                                 InfoItem {
                                                    title: " Primero  "
                                                    summary: "Debemos escoger un metodo de prueba de la aplicación, los cuales se encuentran en un selector en la parte superior derecha de la aplicación"
                                                },
                                                 InfoItem {
                                                    title: " Segundo  "
                                                    summary: "Ingresamos la ecuación  haciendo click en botón que dice 'Ecuación' funció, luego digitamos un dx (diferencial de x) y el  (los en caso de predicción númerica) rango(s) de la función"
                                                },
                                                
                                                InfoItem {
                                                    title: "   "
                                                    summary: "Al hacer click donde dice 'Ecuación' aparecerá una especia de calculadora donde podemos ir escribiendo la formula presionan cada botón al final hacemos click donde dice 'cerrar' en la calculadora "
                                                    },
                                                InfoItem {
                                                    title: " Tercero  "
                                                    summary: " Debemos hacer click donde dice 'Comenzar' que está debajo de campo de la ecuación  "
                                                    },
                                                InfoItem {
                                                    title: " Cuarto  "
                                                    summary: " Ahora en la parte inferior derecha aparece un cuadro con un botón que dice 'iniciar', al darle click  comienza la busqueda de la solución "
                                                    },
                                                InfoItem {
                                                    title: "   "
                                                    summary: " Luego se habilitará un botón parar, en este momento podemos hacer click en cualquiera de la funciones dentro de cuadro y automaticamente sse mostrará en el cuadro de la izquierda "
                                                    },
                                               InfoItem {
                                                    title: "   "
                                                    summary: " Al darle click se habiltará el botón 'continuar' para seguir con la busqueda de la función solución "
                                                    },
                                               InfoItem {
                                                    title: "   "
                                                    summary: " El proceso se puede repetir cuantas veces quiera hasta que se encuentre la solución "
                                                    },
                                            ]
                                        }
                             ]


                        visible: false;
                         onMouseExited: function( e: MouseEvent ):Void
                         {
                           e.node.visible = false;
                         }


                    }
                     public var scroll3 = Group
                    {

                    content: [
                            InfoNode
                                    {

                                        x: 560
                                        y: 460
                                            items:
                                            [
                                                InfoItem {
                                                    title: " Acerca de "
                                                    summary:  "  OVAGEP es un proyecto de grado de Escuela de Ingenerias de Sistemas y Computación de la Universidad del Valle"

                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary: " Realizado por  Orlando Cossio Murillo estudiante de Ingeniería de Sistemas"


                                                },
                                                 InfoItem {
                                                    title: "  "
                                                    summary:" Dirigido por el PhD Angel Garcia Baños, profesor titular y director de la Escuela de Ingenerias de Sistemas y Computación de la Universidad del Valle "

                                                }
                                            ]
                                 }
                            ]




                        visible: false;
                         onMouseExited: function( e: MouseEvent ):Void
                         {
                           e.node.visible = false;
                         }


                    }



                                
public class Mensajes {



}
