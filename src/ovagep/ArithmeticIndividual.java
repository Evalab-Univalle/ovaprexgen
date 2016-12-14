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

import java.util.Vector;

/**
 * Esta clase es un individual de base que pueden evolucionar expresiones
 * que representan  las operaciones aritméticas sobre variables múltiples
 * y  contienen operadores
 *
 * @author    Matthew Sottile
 * @version   1.0
 */
public class ArithmeticIndividual extends Individual {
    /**
     * Constructor.
     *
     * @param  s Cromosoma que contiene simbolos y funciones que da el genema.
     * @param  g  El genoma del cual derivas un cromosoma para el individual.
     * @param  gc contador de genes.
     */
    
   
    public ArithmeticIndividual(String s, Genome g, int gc) throws Exception {
        super(s,g,gc);
    }

    public ArithmeticIndividual(Genome g, int gc) throws Exception {
        super(g,gc);
    }

    /**
     * replica el individual.
     *
     * @return   un nuevo objeto con instancia identica .
     */
    public Individual replicate() {
        try {
            return new ArithmeticIndividual(chromosome,genome,genes);
        } catch (Exception e) {
            System.err.println("EXCEPTION (replicate) :: "+e.toString());
        }
        return null;
    }

    /**
     * expresa a este individuo como un árbol de expresión para las expresiones
     * aritméticas (+,-,/,*,^,sqrt).
     *
     * @return    Un bosque de árboles que representan los árboles de expresiones
     *             generadas por cada gen para este individual
     */
    public ExpressionNode[] express() {
        int numGenes = chromosome.length() / genome.getGeneLength();
        Vector stack;
        ExpressionNode roots[] = new ExpressionNode[numGenes];
        int pos;

        for (int curGene = 0; curGene < numGenes; curGene++) {
            pos = curGene*genome.getGeneLength();
            stack = new Vector();
            int geneEnd = pos+genome.getGeneLength();

            boolean done = false;
            int need = 1;

            while (pos < geneEnd && done == false) {
                char c = chromosome.charAt(pos);
		
                need--;

                if (genome.isFunction(c)) {
                    stack.addElement(new Character(c));
                    need += 2;
                } else {
                    stack.addElement(new Character(c));
                } 
                pos++;
                if (need == 0) done = true;
            }
            
            for (int i = stack.size() - 1; i >= 0; i--) {
                Character c = (Character)stack.elementAt(i);
                char ch = c.charValue();
                ArithmeticExpressionNode n = new ArithmeticExpressionNode(ch);
                stack.setElementAt(n,i);
                if (genome.isFunction(ch)) {
                    n.setRight((ArithmeticExpressionNode)stack.elementAt(stack.size()-1));
                    n.setLeft((ArithmeticExpressionNode)stack.elementAt(stack.size()-2));
                    stack.removeElementAt(stack.size()-1);
                    stack.removeElementAt(stack.size()-1);
                }
            }

            roots[curGene] = (ArithmeticExpressionNode)stack.elementAt(0);
        }

        return roots;
    }

    /**
     * Implementacion de la clase interna  de la expresión específica del nodo
     * este individual va a utilizar.
     *
     * Las clases internas son buenos para esto, ya que el tipo de nodo está
     * íntimamente ligada al individual, y no lo quieren fuera disponible. Cuando
     * se lo pasamos a cabo , para que otros puedan utilizarlo si
     * esperan un objeto genérico
     *
     * @author   Matthew Sottile
     * @version  1.0
     */
    class ArithmeticExpressionNode implements ExpressionNode
    {
        private ArithmeticExpressionNode left, right;
        private char c;
	 
	  double total =0.0;

        public ArithmeticExpressionNode(char c)
        {
            this.c = c;
	    
        }

        public String stringRepresentation()
        {
            String s = "";
            if (genome.isFunction(c)) {

		if(c=='s'||c=='c'||c=='t'||c=='r'||c=='l')
		{
			   s = " " + c + " ( "+ right.stringRepresentation() + " ) ";
		}
		else {
		      s = " ("+left.stringRepresentation() + " " + c + " " + right.stringRepresentation() + ") ";
		    }
            } else {
                s = ""+c;
            }

            return s;
        }
        
        public Object evaluate(java.util.Hashtable values,String cromosoma) throws Exception 
	{
      
	   double total;
	   String parseada;

            cromosoma =cromosoma.replace(" r "," sqrt ");
            cromosoma =cromosoma.replace(" s "," sin ");
            cromosoma =cromosoma.replace(" c "," cos ");
            cromosoma =cromosoma.replace(" t "," tan ");
            cromosoma =cromosoma.replace(" l "," log ");
            cromosoma =cromosoma.replace(" e "," ^ ");

	
             Parseador parser =new Parseador();
             parseada =  parser.parsear(cromosoma);

             total = redondeo(parser.f(parseada,(Double)values.get("a")),3);
	
	      return total;
        }
	
	

	
	private double redondeo(double numero, int decimales)
	{
		return ((double)Math.round(numero*Math.pow(10,decimales)))/Math.pow(10,decimales);
	}

        protected void setLeft(ArithmeticExpressionNode l)
        {
            left = l;
        }

        protected void setRight(ArithmeticExpressionNode r)
        {
            right = r;
        }
    }
}
