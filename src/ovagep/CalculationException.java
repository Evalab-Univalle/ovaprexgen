
package ovagep;


/**
 * @author omer bar-or
 *
 */
public class CalculationException extends Exception{
        public CalculationException(String error) {
                myError = error;
        }
        public String getText() {
                return myError;
        }
        String myError;
}