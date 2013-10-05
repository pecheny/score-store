package view;
import constants.PlayerViewStyle;
import model.vo.PlayerId;
import flash.display.DisplayObject;
import flash.text.TextField;
class PlayerView extends ViewBase {
    var label:TextField;
    var playerId:PlayerId;
    var myHeight:Float;
    var score:Int = 0;

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
        setScore(score);
        addChild(label);
    }

    public function setScore(score:Int):Void {
        this.score = score;
        if (label != null) {
        var magnitude = Math.abs(score);
            if (score < 0) {
                label.textColor = PlayerViewStyle.SCORE_NEGATIVE_COLOR;
            } else if (score > 0) {
                label.textColor = PlayerViewStyle.SCORE_POSITIVE_COLOR;
            } else {
                label.textColor = PlayerViewStyle.SCORE_NEUTRAL_COLOR;
            }
            label.text = (magnitude > 999) ? "" + 999 : "" + magnitude;
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