/*
 * InfoButton.fx
 *
 * Created on 22/06/2010, 07:23:03 PM
 */

package ovagep;

/**
 * @author kenryo
 */

import javafx.scene.CustomNode;
import javafx.scene.effect.Effect;
import javafx.scene.effect.Glow;
import javafx.scene.Group;
import javafx.scene.input.MouseEvent;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.scene.text.Font;
import javafx.scene.effect.DropShadow;


public class InfoButton extends CustomNode {

    public var item: InfoItem;
    public var w: Number;
    public var x: Number;
    public var y: Number;

    var curEffect: Effect;

    public var group:Group;

    override public function create():Node {
        var title = Text {
            fill: Color.WHITE
            content: item.title
            wrappingWidth: w
             font: Font
             {
                     name:  "Times New Roman bold"
                    size: 20
              }
               effect: DropShadow
              {
                offsetX: -4
                offsetY: -4
              }
        }
        var summary = Text {
            fill: Color.WHITE
            content: item.summary
            wrappingWidth: w
            y: title.boundsInLocal.height
            /*  effect: DropShadow
              {
                offsetX: -3
                offsetY: -3
              }*/
             font: Font
             {
                     name:  "Arial "
                    size: 16
              }
        }
        var rectHeight = title.boundsInLocal.height + summary.boundsInLocal.height;
        group = Group {
            translateX: x
            translateY: y+10
            effect: bind curEffect
            onMouseEntered: function(e:MouseEvent) {
                curEffect = Glow {
                    level: 0.8
                }
            }
            onMouseExited: function(e:MouseEvent) {
                curEffect = null;
            }

            content: [
                Rectangle {
                    fill: LinearGradient {
                        //proportional: false
                        startX: 0
                        startY: 0
                        endX: 0
                        endY: 1//rectHeight
                        stops: [
                            Stop {
                                offset: 0.0
                                color: Color {red: 0.2, green: 0.2, blue: 0.2}
                            },
                            Stop {
                                offset: 0.3
                                color: Color {red: 0.1, green: 0.1, blue: 0.1}
                            },
                            Stop {
                                offset: 0.7
                                color: Color.BLACK
                            },
                            Stop {
                                offset: 1.0
                                color: Color.BLACK
                            }
                        ]
                    }
                    width: w
                    height: rectHeight
                    y: -15
                },
                title,
                summary
            ]
        }

    }


}
