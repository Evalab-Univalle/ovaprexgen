package ovagep;

import javax.swing.*;
import java.awt.event.*;
import java.awt.*;
import javax.swing.event.ListSelectionEvent;
import javax.swing.event.ListSelectionListener;




public class InterfazGep extends JPanel implements ActionListener
{

    Container contenedor;
    FlowLayout miFlow;

    JPanel panelBotones,panel;

    JLabel label1;

    String elegida="";
    JButton bParar;
    JButton bContinuar;
    JButton bIniciar;
    Parseador miParse;
    JScrollPane scroll;

   
    HiloGep test ;
    double delta;
    double[] imagenes, iniciales;
    Puntos puntos ;
    String[] palPool;
    String[] genes;

      String[] selections = { "", "", "", "","","","","","","" };
    JList list = new JList(selections);

    public InterfazGep()
    {



        bParar = new JButton("Parar");
        bContinuar = new JButton("Continuar");
        bIniciar = new JButton("Iniciar");
        bParar.setEnabled(false);
        bContinuar.setEnabled(false);




        panelBotones = new JPanel(new GridLayout(1, 2));




        bParar.addActionListener(this);
        bContinuar.addActionListener(this);
        bIniciar.addActionListener(this);

        puntos = new Puntos();
        iniciales = new double[400];
        imagenes = new double[400];


        ListSelectionListener listSelectionListener = new ListSelectionListener()
        {
              public void valueChanged(ListSelectionEvent listSelectionEvent)
              {
               
                boolean adjust = listSelectionEvent.getValueIsAdjusting();
              
                if (!adjust) {
                  JList list = (JList) listSelectionEvent.getSource();
                  int selections[] = list.getSelectedIndices();
                  Object selectionValues[] = list.getSelectedValues();
                  for (int i = 0, n = selections.length; i < n; i++) {
                    if (i == 0) {
                      System.out.print("  Selections: ");
                    }

                      elegida = (String)selectionValues[i];
                    System.out.print(selections[i] + "/" + elegida + " ");
                  
                      iniciales = puntos.obtenerInicialesd();
                      imagenes = puntos.obtenerImagenesd();
                   


                  }
                  System.out.println();
                }
              }
            };
    list.addListSelectionListener(listSelectionListener);


        list.setSelectionBackground(Color.blue);
     //   list.setSize(200,200);

        scroll = new JScrollPane(list);
       scroll.setHorizontalScrollBarPolicy(JScrollPane.HORIZONTAL_SCROLLBAR_ALWAYS);

       scroll.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        scroll.setPreferredSize(new Dimension(225, 220));

       setLayout(new BorderLayout());


       setVisible(false);

	
      


    }

    public void organizarGUI()
    {


        panelBotones.add(bIniciar);
        panelBotones.add(bParar);
        panelBotones.add(bContinuar);

         bIniciar.setVerticalTextPosition(AbstractButton.BOTTOM);
    bIniciar.setHorizontalTextPosition(AbstractButton.CENTER);

     bParar.setVerticalTextPosition(AbstractButton.BOTTOM);
    bParar.setHorizontalTextPosition(AbstractButton.CENTER);

     bContinuar.setVerticalTextPosition(AbstractButton.BOTTOM);
    bContinuar.setHorizontalTextPosition(AbstractButton.CENTER);



        add(scroll, BorderLayout.CENTER);
        add(panelBotones, BorderLayout.SOUTH);
        iniciarElegidos();


    }

    public void iniciar(double[] ins, double[] outs)
    {
         test = new HiloGep(ins,outs);
        
    }

     public void iniciar(double[] ins, double[] outs, double delta)
    {
         test = new HiloGep(ins,outs);
        this.delta = delta;
    }



    @Override
    public void actionPerformed(ActionEvent e)
    {


         if(test.keepGoing==false)
         {

              for(int i=0; i<test.elegidos.length; i++)
                 {

                    test.elegidos[i] =test.elegidos[i].replace(" r "," sqrt ");
                    test.elegidos[i] =test.elegidos[i].replace(" s "," sin ");
                    test.elegidos[i] =test.elegidos[i].replace(" c "," cos ");
                    test.elegidos[i] =test.elegidos[i].replace(" t "," tan ");
                    test.elegidos[i] =test.elegidos[i].replace(" l "," log ");
                    test.elegidos[i] =test.elegidos[i].replace(" e "," ^ ");
                   

                  selections[i] = test.elegidos[i];

                 }

                 list.setListData(selections);
              bContinuar.setEnabled(false);
              bParar.setEnabled(false);
               palPool = test.palPool;
               genes = test.elegidosin;
         }
        else
         {


            if (e.getSource().equals(bParar))
            {

                 synchronized (test)
                 {
                                    test.esperar= true;
                 }

                 for(int i=0; i<test.elegidos.length; i++)
                 {

                    test.elegidos[i] =test.elegidos[i].replace(" r "," sqrt ");
                    test.elegidos[i] =test.elegidos[i].replace(" s "," sin ");
                    test.elegidos[i] =test.elegidos[i].replace(" c "," cos ");
                    test.elegidos[i] =test.elegidos[i].replace(" t "," tan ");
                    test.elegidos[i] =test.elegidos[i].replace(" l "," log ");
                    test.elegidos[i] =test.elegidos[i].replace(" e "," ^ ");

                  selections[i] = test.elegidos[i];

                 }

                 list.setListData(selections);
                  bContinuar.setEnabled(true);
                  bParar.setEnabled(false);
                   genes = test.elegidosin;
                  palPool = test.palPool;

            }

            if (e.getSource().equals(bContinuar))
            {

                  bContinuar.setEnabled(false);
                  bParar.setEnabled(true);

                  synchronized (test)
                  {
                        test.esperar= false;
                         test.notify();
                   }
                   palPool = test.palPool;

            }

            if (e.getSource().equals(bIniciar))
            {


                 test.start();
                 System.out.println("new inicio ");
                   bParar.setEnabled(true);
                   bIniciar.setEnabled(false);
                    genes = test.elegidosin;
                    palPool = test.palPool;

            }
        }
       

      }

     public void iniciarElegidos()
     {

	      selections[0] = "Para empezar";
              selections[1] = "Presione con el raton";
              selections[2] = "El botón Iniciar";
              selections[3] = "Luego puede Presionar ";
              selections[4] = "El botón Parar y luego  ";
              selections[5] = "Puede presionar cualquier función ";
              selections[6] = "De la lista luego puede";
              selections[7] = "Presionar el botón Continuar";
              selections[8] = "y repetir el proceso hasta encontrar";
              selections[9] = "una  buena  solución  ^_^";





             list.setListData(selections);

              bContinuar.setEnabled(false);
              bParar.setEnabled(false);
              bIniciar.setEnabled(true);
     }
    
}