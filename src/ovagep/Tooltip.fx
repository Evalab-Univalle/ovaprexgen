/*
 * Tooltip.fx
 *
 * Created on 11/03/2010, 04:46:29 PM
 */

package ovagep;

/**
 * @author eva-04
 */

import javafx.scene.CustomNode;
import javafx.scene.effect.DropShadow;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.shape.ShapeIntersect;
import javafx.scene.text.Font;
import javafx.scene.text.Text;

public class ToolTip extends CustomNode {

    public var x: Number;
    public var y: Number;
    //useless - content should decide
    public var width: Number = 100;
    public var height: Number = 50;
    //useless-Tooltip instance should be
    //added dynamically
    public var op: Number = 0.0;
    public var content: String;

    public override function create(): Node {
        return Group {
            content: [
                ShapeIntersect {
                    effect: DropShadow {
                        offsetY: -5
                        offsetX: -5
                        color: Color.color(0.9, 0.4, 0.4)

                    };
                    translateX: bind x
                    translateY: bind y
                    opacity: bind op
                    stroke: Color.GRAY
                    strokeWidth: 2
                    fill: Color.GREEN

                    a: [
                        Rectangle {
                            arcHeight:10
                            arcWidth:10
                            x: 0
                            y: 0
                            width: bind width
                            height: bind height
                        }
                        Rectangle {
                            rotate: 45
                            x: 40
                            y: 40
                            width: bind width / 5
                            height: bind 2 * height / 5
                        }
                    ]
                },
                Text {
                    font: Font {
                        size: 14
                    }
                    translateX: bind x
                    translateY: bind y
                    opacity: bind op
                    x: 10,
                    y: 12
                    content: bind content
                }
            ]
        };
    }
} 