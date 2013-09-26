package mediators;
import signals.ChangeScoreSignal;
import factories.LabelFactory;
import view.ScoreInputView;
using mediators.AssetsMixin;

class ScoreInputViewMediator extends mmvc.impl.Mediator<ScoreInputView> {

    @inject public var labelFactory:LabelFactory;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    var scoreInputView:ScoreInputView;
    var scoreValue:Int;

    override public function preRemove():Void {
    }

    override public function onRegister():Void {
    }

    public function setScoreValue(value:Int):Void {
        scoreValue = value;
    }

    public function getScoreValue():Int {
        return scoreValue;
    }

}