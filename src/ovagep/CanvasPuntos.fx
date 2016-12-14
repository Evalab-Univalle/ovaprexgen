/*
 * CanvasPuntos.fx
 *
 * Created on 19/03/2010, 04:54:33 PM
 */

package ovagep;

import javafx.scene.chart.BubbleChart;
import javafx.scene.chart.part.NumberAxis;
import javafx.scene.paint.Color;




/**
 * @author eva-04
 */


/*public var canvas = BubbleChart {


 chartBackgroundFill: Color.WHITESMOKE

        scaleBubbleRadiusUsingAxis: false

        translateX: 50
        translateY: 150
        width: 475


        title : "Funcion en X"
                xAxis : NumberAxis{
                    lowerBound: 7
                    upperBound : 13
                    label: "Axis"
                    visible: true
                    axisStrokeWidth: 1
                    tickUnit : 1
                    tickLabelsVisible: true



                }
                yAxis : NumberAxis{
                    lowerBound: 0
                    upperBound : 20
                    tickUnit: 1
                    label: "Función en Y"
                    visible: true
                    tickLabelsVisible: true

               }

        data: [
            BubbleChart.Series {
                name: "Nube de Puntos"

                data: [
                    BubbleChart.Data {
                     xValue: 8
                     yValue: 15.6
                     radius: 2
                   }

                   BubbleChart.Data {
                     xValue: 9
                     yValue: 15.1
                     radius: 2
                   }

                   BubbleChart.Data {
                     xValue: 10
                     yValue: 14.4
                     radius: 2
                   }

                   BubbleChart.Data {
                     xValue: 11
                     yValue: 16.6
                     radius: 2
                   }

                   BubbleChart.Data {
                     xValue: 12
                     yValue: 17.5
                     radius: 2
                   }

                    BubbleChart.Data {
                     xValue: 13
                     yValue: 18.5
                     radius: 2
                   }
                    BubbleChart.Data {
                     xValue: 2
                     yValue: 7.5
                     radius: 2
                   }
                ]
            }
         ]
        }*/
public class CanvasPuntos
{
    public  var x: Number[] ;
    public var y: Number[] ;
    public var yl: Number;
    public var xl: Number;
    public var canvas;


public function obtenerCanvas(x1: Number[], y1: Number[],yl1: Number,xl1: Number)
{

     x= x1;
     y= y1 ;
    yl= yl1;
     xl= xl1;
    var r :  BubbleChart.Data[] = [];

    var s1 : BubbleChart.Series =  BubbleChart.Series{data: [r]};
    var BubbleChartData : BubbleChart.Series[] = [s1];


    for(i in [0..(x1.size()-1)])
    {
        insert  BubbleChart.Data {fill: Color.YELLOWGREEN xValue : x[i] yValue : y[i] radius: 2 }into r;

    }

     canvas = BubbleChart {



     translateX: 40
        translateY: 150
        width: 475

              title : "Vista de Puntos"
              xAxis : NumberAxis{
                  lowerBound: 0
                  upperBound : xl
                  label: "X"
                  visible: true
                  axisStrokeWidth: 1
                  tickUnit : 20
                  tickLabelsVisible: true

              }
              yAxis : NumberAxis{
                  lowerBound: 0
                  upperBound : yl
                  tickUnit: 20
                  label: "Y"
                  visible: true
                  tickLabelsVisible: true
             }
              data:  BubbleChartData

           visible: false;
          }

          return canvas;

}
 










public function verCanvas()
{
    canvas.visible = true;
 }

 public function ocultarCanvas()
{
    canvas.visible = false;
 }

}



