package view;
import model.vo.PlayerId;
import flash.display.DisplayObject;
import flash.text.TextField;
import flash.display.Sprite;
class PlayerView extends Sprite {
    var label:TextField;
    var playerId:PlayerId;

    public function new() {
        super();
    }

    public function initBackground(w:Float, h:Float, r:Float):Void {
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
        return "PlayerView: " + label.text;
    }

    public function getPlusButton():DisplayObject {
        return this;
    }

    public function setPlayerId(v:PlayerId):PlayerId {
        playerId = v;
        return v;
    }

    public function getPlayerId():PlayerId {
        return playerId;
    }
}