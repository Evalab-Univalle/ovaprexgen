/*
 * CanvasCurva.fx
 *
 * Created on 23/03/2010, 11:58:29 AM
 */

package ovagep;

/**
 * @author eva-04
 */

import javafx.scene.chart.LineChart;
import javafx.scene.chart.part.NumberAxis;
import javafx.util.Math;

import javafx.scene.chart.AreaChart;

import javafx.scene.paint.Color;




public class CanvasCurva
{




/**
 * An x axis that goes from 0 to 2*PI with labels every PI/2 radians.
 * The labels are formatted to display on 2 significant digits.
 */
function createXAxis() {
  NumberAxis {
    label: "Radians"
    upperBound: 2 * Math.PI
    tickUnit: Math.PI / 2
    formatTickLabel: function(value) {
      "{%.2f value}"
    }
  }
}

/**
 * A y axis that that goes from -1 to 1 with labels every 0.5 units.
 */
function createYAxis() {
  NumberAxis {
    upperBound: 1.0
    lowerBound: -1.0
    tickUnit: 0.5
  }
}

/**
 * Create a line chart to display sine and cosine values.
 */
public function createLineChart() {
  LineChart {
          translateX: 50
        translateY: 150
        width: 475
        chartBackgroundFill: Color.WHITESMOKE
       
    title: "Función "
    showSymbols: false
    dataEffect: null
    xAxis: createXAxis()
    yAxis: createYAxis()
    data: [
      LineChart.Series {
        name: "Seno"
        data: for (rads in [0..2*Math.PI step 0.01]) {
          LineChart.Data {
            xValue: rads
            yValue: Math.sin( rads )
          }
        }
      }
      LineChart.Series {
        name: "Coseno"
        data: for (rads in [0..2*Math.PI step 0.01]) {
          LineChart.Data {
            xValue: rads
            yValue: Math.cos( rads )
          }
        }
      }
    ]
  }
}

/**
 * Create a area chart to display sine and cosine values.
 */
public function createAreaChart() {
 var canvas = AreaChart {
    title: "Area Chart"
    translateX: 550
    xAxis: createXAxis()
    yAxis: createYAxis()
    data: [
      AreaChart.Series {
        name: "Sine Wave"
        data: for (rads in [0..2*Math.PI step 0.01]) {
          AreaChart.Data {
            xValue: rads
            yValue: Math.sin( rads )
          }
        }
      }
      AreaChart.Series {
        name: "Cosine Wave"
        data: for (rads in [0..2*Math.PI step 0.01]) {
          AreaChart.Data {
            xValue: rads
            yValue: Math.cos( rads )
          }
        }
      }
    ]
      
  }
}



}
