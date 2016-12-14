
package ovagep;

import javax.swing.JOptionPane;

/**
 *
 * @author kenryo
 */
public class Derivada
{
     double dx;

    double[] imagenes1, imagenes;

    public double[] calcularDerivada(double dx, double ima[])
    {
        imagenes1 = ima;
        this.dx = dx;
        imagenes = new double[imagenes1.length-1];

        for(int i=0; i<imagenes1.length-1; i++)
        {
           
            imagenes[i]= (imagenes1[i+1]- imagenes1[i])/dx;

        }


        return imagenes;



    }

     public  void  ver()
    {
        String uno="", dos="";

         for(int i=0; i<imagenes.length; i++)
        {

             if(i%10==0)
             {

                 dos+=" \n "+imagenes[i];
            }else
            {

                 dos+=" - "+imagenes[i];
            }

         }
        JOptionPane.showMessageDialog(null,uno+" imag "+dos );


    }

}
