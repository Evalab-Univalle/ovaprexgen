/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ovagep;

import javax.swing.JOptionPane;

/**
 *
 * @author kenryo
 */


public class Puntos
{
    
    Parseador miParse= new Parseador();

    String funcion ;
    float dx;

    float[] iniciales, imagenes;

    public void crearArreglos(String funt, String delta, String valorMin, String valorMax)
    {

        int numPuntos =0;
        float min = Float.parseFloat(valorMin);
        float max = Float.parseFloat(valorMax);
         dx = Float.parseFloat(delta);
        while(min<max)
        {
            numPuntos++;
            min+= dx;
        }

         numPuntos++;
        iniciales = new float[numPuntos];
        imagenes = new float[numPuntos];

       
        funcion = funt;
        String parseada;
        float puntox= Float.parseFloat(valorMin);
        double temp= 0.0;
        for(int i=0; i<numPuntos; i++)
        {
            parseada = miParse.parsear(funt);

            iniciales[i] = puntox;
            temp = (double)puntox;
            imagenes[i] = (float)miParse.f(parseada, temp);
            puntox+= dx;


        }
    }

     public void crearArreglosA(String funt, String delta,int puntos)
    {

        iniciales = new float[100];
        imagenes = new float[100];

        dx = Float.parseFloat(delta);
        funcion = funt;
        String parseada;
        float puntox=dx;
        double temp= 0.0;
        for(int i=0; i<100; i++)
        {
            parseada = miParse.parsear(funt);

            iniciales[i] = puntox;
            temp = (double)puntox;
            imagenes[i] = (float)miParse.f(parseada, temp);
            puntox+= dx;


        }
    }

    public float[] obtenerIniciales()
    {
        return iniciales;
    }

     public float[] obtenerImagenes()
    {

        return imagenes;
    }

    public double[] obtenerInicialesd()
    {
         double[] inicialesd = new double[imagenes.length];
        for(int i=0; i<imagenes.length; i++)
        {

            inicialesd[i] = (double)iniciales[i];

        }
        return inicialesd;
    }

     public double[] obtenerImagenesd()
    {

         double[] imagenesd = new double[imagenes.length];
        for(int i=0; i<imagenes.length; i++)
        {

            imagenesd[i] = (double)imagenes[i];

        }
        return imagenesd;
    }

      public double[] obtenerInicialesd1()
    {
         double[] inicialesd = new double[iniciales.length-1];
        for(int i=1; i<iniciales.length; i++)
        {

            inicialesd[(i-1)] = (double)iniciales[i];

        }
        return inicialesd;
    }

     public double[] obtenerImagenesd1()
    {

         double[] imagenesd = new double[imagenes.length-1];
        for(int i=1; i<imagenes.length; i++)
        {

            imagenesd[(i-1)] = (double)imagenes[i];

        }
        return imagenesd;
    }



    public  void  ver()
    {
        String uno="", dos="";

         for(int i=0; i<imagenes.length; i+=10)
        {
             if(i%imagenes.length==0)
             {
                 uno+=" \n "+iniciales[i];
                 dos+=" \n "+imagenes[i];
            }else
            {
                 uno+=" - "+iniciales[i];
                 dos+=" - "+imagenes[i];
            }
         }
        JOptionPane.showMessageDialog(null,uno+" dos "+dos );


    }




}
