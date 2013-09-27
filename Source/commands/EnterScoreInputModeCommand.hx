package commands;
import view.ApplicationView;
import view.ScoreInputView;
import model.vo.PlayerId;
class EnterScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;
    @inject public var playerId:PlayerId;

    override public function execute():Void {
        scoreInputView.id = playerId;
        applicationView.addChild(scoreInputView);
    }

}