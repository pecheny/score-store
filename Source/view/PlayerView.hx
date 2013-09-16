package view;
import model.vo.PlayerId;
import flash.display.DisplayObject;
import flash.text.TextField;
class PlayerView extends ViewBase {
    var label:TextField;
    var playerId:PlayerId;
    var myHeight:Float;

    public function new() {
        super();
    }

    override public function getHeight():Float {
        return myHeight;
    }


    public function initBounds(w:Float, h:Float, r:Float):Void {
        myHeight = h;
        graphics.beginFill(0, 0.75);
        graphics.drawRoundRect(0, 0, w, h, r, r);
        graphics.endFill();
    }

    public function setMainTextField(textField:TextField) {
        if (textField == null) {
            throw "TextField should be null";
        }
        label = textField;
        addChild(label);
    }

    public function setText(text:String):Void {
        label.text = text;
    }

    override public function toString():String {
        return "PlayerView for player " + playerId.toInt();
    }

    public function setPlayerId(v:PlayerId):PlayerId {
        playerId = v;
        return v;
    }

    public function getPlayerId():PlayerId {
        return playerId;
    }
}