/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package ovagep;
import javafx.scene.control.TextBox;
import java.lang.NumberFormatException;

/**
 * @author Kenryo
 */

public class NumberTextBox extends TextBox {

    public-init var tb: TextBox;
    public var max: Number = 99999999999;
    public var min: Number = 0;
    var waitForAction: Boolean = true;
    var n: Number;

    public function setValue(n: Number) : Void {
        tb.text = "{n}";
        validated = true;
    }

    function getStyle(color: String): String {
        "-fx-background-color: "
            "{color},"
            " -fx-text-box-border, "
            "-fx-control-inner-background;";
    }

    public var set: Boolean = false on replace {
        tb.style = getStyle(if (set) "orange" else "red");
    }

    public var validated = false on replace {
        tb.style = getStyle(if (validated) "green" else "orange");
    }

    public var onChange: function (n: Number);

    init {
        def str: String = bind tb.rawText on replace {
            validated = false;
            try{
                n = Number.valueOf(tb.rawText);
                if(n > max) n = max;
                if(n < min) n = min;
                set = true;
                if(not waitForAction) tb.action();
            }catch(e: NumberFormatException) {
                set = false;
            }
        }
        tb.action = function(): Void {
            if(set) {
                validated = true;
                onChange(n);
            }
        }
    }
}
