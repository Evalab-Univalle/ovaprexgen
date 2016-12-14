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
 * Interface que representa una expresión nodo.
 *
 * @author   Matthew Sottile
 * @version  1.0
 */
public interface ExpressionNode {
    /**
     * El método de evaluación tiene una tabla hash de valores y devuelve un objeto.
     * Este trata al individuo como un mapa del espacio de tuplas representada por
     * la tabla hash a un espacio 1D de los objetos.
     * Por ejemplo, las expresiones aritméticas mapa de tuplas de números reales a un valor real solo
     * (R^n -> R).
     *
     * @param   values  The key/value pair of values being passed in.
     * @return          The object that this individual evaluates to
     *                  given the parameters in the hashtable.
     */
    public java.lang.Object evaluate(java.util.Hashtable values, String s) 
        throws Exception;

    public String stringRepresentation();
}

