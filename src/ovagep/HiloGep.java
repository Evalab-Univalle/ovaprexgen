

/** LANL:license
 * -------------------------------------------------------------------------
 * This SOFTWARE has been authored by an employee or employees of the
 * University of California, operator of the Los Alamos National Laboratory
 * under Contract No. W-7405-ENG-36 with the U.S. Department of Energy.
 * The U.S. Government has rights to use, reproduce, and distribute this
 * SOFTWARE.  The public may copy, distribute, prepare derivative works and
 * publicly display this SOFTWARE without charge, provided that this Notice
 * and any statement of authorship are reproduced on all copies.  Neither
 * the Government nor the University makes any warranty, express or implied,
 * or assumes any liability or responsibility for the use of this SOFTWARE.
 * If SOFTWARE is modified to produce derivative works, such modified
 * SOFTWARE should be clearly marked, so as not to confuse it with the
 * version available from LANL.
 * -------------------------------------------------------------------------
 * LANL:license
 * -------------------------------------------------------------------------
 */

package ovagep;

import java.util.Hashtable;
import java.util.Vector;
import javax.swing.JOptionPane;

public class HiloGep extends Thread {
    boolean keepGoing;
    public static void reportError(String s) {
        System.err.println("ERROR: "+s);
    }
    
     // boolean que pondremos a false cuando queramos parar el hilo
     boolean continuar = true;
     boolean esperar = false;
     char ts[] = {'1','x','2','x','3','x','4','x','5','x','6','x','7','x','8','x','9','x'};
     char    fs[] = {'+','-','/','*','r','s','c','t','l','^'};
     Population p;
     Vector individuals;
     double[] fitnesses,fitnessesn,ins,outs;
     int[] indices;
     String[] elegidos;
     String[] elegidosin;
     String[] palPool;
     

    public HiloGep(double[] insn, double[] outsn )
   {
    
     ins = insn;
     outs = outsn;
      keepGoing = true;
   }
     public HiloGep()
     {
     }
  
    public  void run()
    {
        /**
         * step 1 : create the genome with a set of terminals and
         *          functions.
         */
    
        Genome g = new Genome(ts,fs,2,30);

        /**
         * step 2 : create the population that progresses with a
         *          specific sampling technique
         */
        int popsize = 200;
        java.util.Random r = new java.util.Random();
        RouletteWheelSampler rws = new RouletteWheelSampler(r,1);
         p = new Population(rws, popsize, g);

        /**
         * step 3 : initialize the population with random individuals
         */
        for (int i = 0; i < popsize; i++)
        {

	 
		  ArithmeticIndividual ai = null;
		  try {
		      ai = new ArithmeticIndividual(g,1);
		  } catch (Exception e) {
		      reportError(e.toString());
		  }
		  if (ai != null) {
		      ai.randomChromosome(r);
		      try {
			  p.addIndividual(ai);
		      } catch (Exception e) {
			  reportError(e.toString());
		      }
		  } else {
		      reportError("null individual no encontrado .");
		  }
	      }

        //
        // set up the vector of test values
        //
       
        Vector v = new Vector();
        for (int i = 0; i < ins.length; i++)
	{
            Hashtable ht = new Hashtable();
            ht.put("a",new Double(ins[i]));
            ht.put("Expected",new Double(outs[i]));
            v.addElement(ht);
        }

        //
        //
        Fitness fitness = new Fitness(v,0);

        //
        // set up the genetic operators - set the probabilities
        // for different operators.
        //
        GeneticOperators gops = new GeneticOperators(g,r);
        gops.setP1Point(0.8);
        gops.setP2Point(0.8);
        gops.setPGRecomb(0.5);
        gops.setPGTrans(0.8);
        gops.setPISTrans(0.8);
        gops.setPMutate(0.9);
        gops.setPRISTrans(0.8);

        
        
        while (keepGoing) 
	{
	   while (continuar)
	   {

	       synchronized (this) 
	      {
		      while (esperar) 
		      {
			  try {
			      wait();
			  } catch (Exception e) 
			  {
			  }
		      }
	      }

            /**
             * Evaluar aptitud
             */
            individuals = p.getIndividuals();
            fitnesses = new double[popsize];
            double bestFitness = 0;
            int    bestIndex = 0;
            double weights[] = new double[popsize];
            for (int i = 0; i < popsize; i++) 
	    {
                weights[i] = (double)(1.0/(double)popsize);
            }

            palPool = new String[40];
            for (int i = 0; i < popsize; i++) 
	    {
                Individual ind = (Individual)individuals.elementAt(i);
                if(i<40)
                    palPool[i] = ind.getChromosome();
                fitnesses[i] = fitness.evaluate(ind);
                if (fitnesses[i] > bestFitness) 
		{
                    bestFitness = fitnesses[i];
                    bestIndex = i;
                }
            }
	  int rnum;
	  indices = new int[10];
	  elegidos= new String[10];
           elegidosin= new String[10];
	    for(int i=0; i<10; i++)
	    {
	      
	       rnum = (int)((popsize * r.nextDouble())-1);
	       Individual ind = (Individual)individuals.elementAt(rnum);
               elegidosin[i] = ind.getChromosome();
	      indices[i] = rnum;
            
            ExpressionNode roots[] = ind.express();  
	    elegidos[i] =roots[0].stringRepresentation();
	    
          //  System.err.println("root tam=  "+roots.length);
	      
		
		
	    
	    }
	    
	    
            
            Individual ind = (Individual)individuals.elementAt(bestIndex);
            System.err.println("Best="+bestFitness);
            
            ExpressionNode roots[] = ind.express();            
            System.err.println(" Donde va   ="+roots[0].stringRepresentation());
            
            /**
             * step 5 : selection and advancing the population
             */
            p.select(weights,bestIndex);
            individuals = p.getIndividuals();

            /**
             * step 6 : genetic operators
             */
            for (int i = 1; i < popsize; i++)
	    {
                double draw;
                ind = (Individual)individuals.elementAt(i);

                //
                // mutation
                //
                draw = r.nextDouble();
                if (draw < gops.getPMutate()) 
		{
                    String newChromosome = 
                        gops.mutate(ind.getChromosome(),1);
                    ind.setChromosome(newChromosome);
                }

                //
                // crossover
                //
                draw = r.nextDouble();
                if (draw < gops.getCrossoverRate()) 
		{
                    String chromosomes[] = new String[2];
                    int which = r.nextInt(2);

                    //
                    // crossover requires another individual --
                    // pick another other than the one we're dealing with
                    // right now.  also leave index 0 alone - that's the
                    // best individual, and we want them to carry across
                    // generations in case none of the others are any better
                    //
                    int otherIdx = r.nextInt(popsize);
                    while (otherIdx == i || otherIdx == 0) 
		    {
                        otherIdx = r.nextInt(popsize);
                    }
                    
                    Individual otherind = 
                        (Individual)individuals.elementAt(otherIdx);

                    chromosomes[0] = ind.getChromosome();
                    chromosomes[1] = otherind.getChromosome();

                    switch (which)
		    {
                    case 0: // 1pt
                        chromosomes = 
                            gops.OnePointRecombination(chromosomes);
                        break;
                    case 1: // 2pt
                        chromosomes = 
                            gops.TwoPointRecombination(chromosomes);
                        break;
                    case 2: // gene
                        System.err.println("No se puede hacer la recombinación.");
                        break;
                    default:
                        System.err.println("No debe ocurrir.");
                    }

                    ind.setChromosome(chromosomes[0]);
                    otherind.setChromosome(chromosomes[1]);
                }
            }
            
            /**
             * Si el fitness es aceptado termina
             */
            //  System.err.println("No debe ocurrir.");
            if (bestFitness ==0.0 )
	    {
                keepGoing = false;
		continuar = false;
                JOptionPane.showMessageDialog(null, "Ecuación encontrada");
            }
	  }
        }
    }
    
    public double[] quickSort(double[] x, int a, int b)
    {
	int i = a, j = b;
	double p = (x[(a+b)/2]);
	double v;
	do{
		while(x[i] < p) i++;
		while(x[j] > p) j--;
		if( i <= j ){
			v = x[j];
			x[j] = x[i];
			x[i] = v;
			i++;
			j--;
		}
	} while (i <= j);
	if( a < j ) quickSort(x,a, j);
	if( b > i ) quickSort(x,i, b);
	
	return x;
     }
     
     public int buscarIndice(double[] fits,double fit )
     {
       
       for(int i=0; i<fits.length; i++)
       {
	  if(fits[i]==fit)
	    return i;
       }
        return 0;
     }

   
}
