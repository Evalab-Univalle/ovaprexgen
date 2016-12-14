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

/**
 * Interfaz que define un muestrario genérico. Un muestreador toma un conjunto de
 * ponderaciones para un conjunto de elementos y devuelve una matriz de índices
 * correspondientes a las personas seleccionadas. La longitud de la matriz
 * devuelta coincide con la longitud de la matriz de peso.
 *
 * @author    Matthew Sottile
 * @version   1.0
 */
public interface Sampler {
    /**
     * Sampling function.  Takes a set of weights, where each element of
     * the array is 0 <= weight < 1.0, and the sum of all of the weights
     * must equal 1.0.
     *
     * @param   weights  The array of weights.
     * @return           The array of indices that were selected in
     *                   sampling.
     */
    public int[] sample(double weights[]);
}
