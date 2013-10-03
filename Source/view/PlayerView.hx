package view;
import model.vo.PlayerId;
import flash.display.DisplayObject;
import flash.text.TextField;
class PlayerView extends ViewBase {
    var label:TextField;
    var playerId:PlayerId;
    var myHeight:Float;
    var text:String;

    public function new() {
        super();
    }

    override public function getHeight():Float {
        return myHeight;
    }

    override public function initBounds(w:Float, h:Float, r:Float):Void {
        myHeight = h;
        super.initBounds(w, h, r);
    }


    public function setMainTextField(textField:TextField) {
        if (textField == null) {
            throw "TextField should be null";
        }
        label = textField;
        label.text = text;
        addChild(label);
    }

    public function setText(text:String):Void {
        this.text = text;
        if (label != null) {
            label.text = text;
        };
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