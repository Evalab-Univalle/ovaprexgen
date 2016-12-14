/*
 * ScrollButton.fx
 *
 * Created on 22/06/2010, 07:25:25 PM
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
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Rectangle;


public class ScrollButton extends CustomNode {

    public var x: Number;
    public var y: Number;
    public var h: Number;
    public var w: Number;
    public var arrow: Polygon;
    public var action:function():Void;

    public var canScroll = true;

    var curEffect: Effect;

    override public function create():Node {
        Group {
            translateX: x
            translateY: y
            effect: bind curEffect
            onMouseEntered: function(e:MouseEvent) {
                if (canScroll) {
                    curEffect = Glow {
                        level: 1.0
                    }
                }
            }
            onMouseExited: function(e:MouseEvent) {
                curEffect = null;
            }
            onMousePressed: function(e:MouseEvent) {
                if (canScroll) {
                    arrow.fill = Color.DARKGRAY;
                    action();
                }
            }
            onMouseReleased: function(e:MouseEvent) {
                arrow.fill = Color.BLACK
            }


            content: [
                Rectangle {
                    fill: LinearGradient {
                        startX: 0
                        startY: 0
                        endX: 0
                        endY: 1
                        stops: [
                            Stop {
                                offset: 0.0
                                color: Color {
                                    red: 0.3,
                                    green: 0.3,
                                    blue: 0.3
                                }
                            },
                            Stop {
                                offset: 1.0
                                color: Color {
                                    red: 0.1,
                                    green: 0.1,
                                    blue: 0.1
                                }
                            }
                        ]
                    }
                    width: w
                    height: h
                },
                arrow

            ]
        }
    }

}

