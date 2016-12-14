/*
 * InfoNode.fx
 *
 * Created on 22/06/2010, 07:24:44 PM
 */

package ovagep;

/**
 * @author kenryo
 */
import javafx.animation.transition.TranslateTransition;
import javafx.scene.CustomNode;
import javafx.scene.Group;
import javafx.scene.Node;
import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;
import javafx.scene.paint.Stop;
import javafx.scene.shape.Polygon;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Text;
import javafx.scene.text.Font;



public class InfoNode extends CustomNode {

    public var title: String;
    public var x: Number;
    public var y: Number;
    public var items: InfoItem[];

    var w: Number = 370;
    var h: Number = 290;

    var rectOffsetX = w * 0.05;
    var rectOffsetY = h * 0.15;

    var textWidth = w - rectOffsetX;
    var textX = rectOffsetX / 2;
    var textY: Number;

    var textRect: Rectangle;

        var buttons: InfoButton[];
    var buttonGroup:Group;
    var topButton = 0;

    var scrollUp:ScrollButton;
    var scrollDown:ScrollButton;

    override public function create():Group
    {
        var centerX = w / 2;
        var centerY = h / 2;
        translateX = x - centerX;
        translateY = y - centerY;

        var scrollUpY = rectOffsetY * 0.75;
        var buttonHeight = 15;
        var arrowWidth = 10;
        scrollUp = ScrollButton {
            x: textX
            y: scrollUpY
            h: buttonHeight
            w: textWidth
            action: doScrollDown
            arrow: Polygon {
                fill: Color.WHITE
                points: [
                    centerX - arrowWidth, buttonHeight - 4,
                    centerX + arrowWidth, buttonHeight - 4,
                    centerX, 3

                ]
                opacity: 0.8
            }
        }
        textY = scrollUpY + scrollUp.boundsInLocal.height;

        var noItems = Text {
            visible: sizeof items == 0
            fill: Color.WHITESMOKE
            font: Font {
                    name: "Times New Roman bold"
                    size: 14
                }
            content: "No Items to Display"
            y: h / 2
        }
        noItems.x = w / 2 - noItems.boundsInLocal.width / 2;

        textRect = Rectangle {
            fill: Color.WHITE
            arcWidth: 5
            arcHeight: 5
            width: textWidth
            height: h - rectOffsetY - scrollUp.boundsInLocal.height * 2 // two scroll buttons
            x: textX
            y: textY
           // opacity: 0.4
        }

        scrollDown = ScrollButton {
            x: textX
            y: textY + textRect.boundsInLocal.height
            h: buttonHeight
            w: textWidth
            action: doScrollUp
            arrow: Polygon {
                fill: Color.BLACK
                points: [
                    centerX - arrowWidth, 3,
                    centerX + arrowWidth, 3,
                    centerX, buttonHeight - 4

                ]
            }
        }

        buttons = createItemButtons();

        buttonGroup = Group {
            content:[buttons]
            
        }

        checkScroll(); // enable/disable the scroll buttons
        Group {
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
                                color: Color.BLACK
                            },
                            Stop {
                                offset: 0.1
                                color: Color.GRAY
                            },
                            Stop {
                                offset: 1.0
                                color: Color.BLACK
                            }
                        ]
                    }
                    arcWidth: 5
                    arcHeight: 5
                    width: w
                    height: h
                },
              Group {
                    content: [buttonGroup]
                    clip: textRect
                }
                scrollUp,
                scrollDown
            ]
        }

    }

    function checkScroll():Void {
        scrollDown.canScroll = (topButton + 1) < sizeof buttons;
        scrollUp.canScroll = topButton > 0;

    }

    function doScroll(amount:Number) {
        scrollUp.canScroll = false;
        scrollDown.canScroll = false;
        TranslateTransition {
            node: buttonGroup
            byY: amount
            duration: 0.1s
            action: function() { checkScroll() }
        }.play();
    }


    var doScrollUp = function():Void {
        doScroll(-buttons[topButton].boundsInLocal.height);
        topButton++;
    }

    var doScrollDown = function():Void {
        doScroll(buttons[topButton - 1].boundsInLocal.height);
        topButton--;
    }


    function createItemButtons():InfoButton[] {
        var curY = textY + 10;
        for (i in items) {
            var button = InfoButton {
                item: i
                w: textWidth
                x: textX
                y: curY
            }
            curY += button.boundsInLocal.height;

            button;


        }
    }


}


