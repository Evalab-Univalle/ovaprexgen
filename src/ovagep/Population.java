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
 * Clase que representa una población. Esto incluye el almacenamiento de todas
 * las personas y el manejo de selección y la reproducción.
 *
 * @author   Matthew Sottile
 * @version  1.0
 */
public class Population {
    private Sampler sampler;     // Sampler object to be used in selection
    private Vector  individuals; // Vector of individuals in the population
    private Genome  genome;      // The genome that makes up each individual
    private int     size;        // Size of the population

    /**
     * Constructor.
     *
     * @param  sampler   Sampling object for use in selecting individuals
     *                   during the selection phase.
     * @param  size      Population size.
     * @param  genome    The genome describing the genetic make-up of the
     *                   population.
     */
    public Population(Sampler sampler, int size, Genome genome) {
        this.sampler = sampler;
        this.size = size;
        individuals = new Vector();
        this.genome = genome;
	 this.genome.verGenome();
    }

    /**
     * Add an individual to the population.  If the population is full,
     * throw an exception.
     *
     * @param    i    The individual to add.
     */
    public void addIndividual(Individual i) throws Exception {
        if (individuals.size() < size) {
            individuals.addElement(i);
        } else {
            throw new Exception("Poblaci�n llena - No puede adherir un individual.");
        }
    }

    /**
     * Return the size of the population (not necessarily the number of
     * individuals currently in the population though.)
     *
     * @return   The size as specified in the constructor.
     */
    public int getSize() {
        return size;
    }

    /**
     * Selección de fase para una población. Se nos ha dado una serie de pesos
     * que están determinados por el gimnasio (de modo que el mejor individuo
     * tiene el mayor peso) y el índice de la mejor individuo.
     * Esto nos permite llamar a un sampler que puede o no puede usar los pesos,
     * y asegurar que las mejores estancias individuales en la población.
     *
     * @param  weights    The weights of the individuals.  Each element, w,
     *                    fulfils 0.0 <= w < 1.0.  The sum of all elements
     *                    MUST equal 1.0.
     * @param  bestIndex  The index of the best ("most fit") individual.
     */
    public void select(double weights[], int bestIndex) {
        Vector newIndividuals = new Vector();

        // sample.
        int indices[] = sampler.sample(weights);
        
        // note, we throw out the last index sampled so we have room in the
        // new population for the best individual from the previous.
        newIndividuals.addElement(individuals.elementAt(bestIndex));

        // move the selected individuals into the new population
        for (int i = 0; i < indices.length - 1; i++) {
            newIndividuals.addElement(individuals.elementAt(indices[i]));
        }

        individuals = newIndividuals;
    }

    /**
     * Return the vector of individuals to the caller.
     *
     * @return   The vector containing the individuals.
     */
    public Vector getIndividuals() {
        return individuals;
    } 

    /**
     * Set the vector of individuals to those specified.
     * 
     * @param   i   The vector of individuals.
     */
    public void setIndividuals(Vector i) {
        individuals = i;
    }
}
