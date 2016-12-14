/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ovagep;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.xy.XYDataset;
import org.jfree.data.xy.XYSeries;
import org.jfree.data.xy.XYSeriesCollection;
import java.awt.Dimension;
import javax.swing.JPanel;
import org.jfree.chart.StandardChartTheme;

public class Graficas extends JPanel
{
   XYSeriesCollection conjuntoDatos;
    public Graficas()
    {
         conjuntoDatos = new XYSeriesCollection();
    }
    public void verGrafico(double equis[],double  imagen[], int p)
    {

        XYDataset paresDeDatos = generarDatos(equis,imagen,p);
        JFreeChart diagrama = crearDiagrama(paresDeDatos);

        ChartPanel chartPanel = new ChartPanel(diagrama);

        chartPanel.setPreferredSize(new Dimension(450,450));
        removeAll();
        add(chartPanel);
    }

    private XYDataset generarDatos(double equis[],double  imagen[], int p)
    {
        //le pasamos una funcion generadora f(x)
        if(p==0)
        {
            XYSeries datos = new XYSeries("Ecuación Inicial");
            for(int i=0; i<equis.length; i++)
                datos.add(equis[i],imagen[i]);

            conjuntoDatos.addSeries(datos);
             XYSeries datos2 = new XYSeries("Ecuación Inicial");
            for(int i=0; i<equis.length; i++)
                datos2.add(equis[i],imagen[i]);

             conjuntoDatos.addSeries(datos2);

        }      
        else
        {
            conjuntoDatos.removeSeries(1);
            XYSeries datos2 = new XYSeries("Ecuación Encontrada");
            for(int i=0; i<equis.length; i++) 
                datos2.add(equis[i],imagen[i]);
            conjuntoDatos.addSeries(datos2);
        }


        return conjuntoDatos;
    }

    private JFreeChart crearDiagrama(XYDataset conjuntoDatos){



        ChartFactory.setChartTheme(StandardChartTheme.createLegacyTheme());
        JFreeChart diag = ChartFactory.createXYLineChart(
                                "Graficador GEP", //Titulo Grafica
                                "X", // Leyenda eje X
                                "Y", // Leyenda eje Y
                                conjuntoDatos, // Los datos
                                PlotOrientation.VERTICAL, //orientacion
                                true, // ver titulo de linea
                                false, //tooltips
                                false  //URL
                            );


        return diag;
    }

    public void borrarDatos()
    {
        conjuntoDatos.removeAllSeries();
    }


}
