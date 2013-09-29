package commands;
import view.ModalBackgroundView;
import view.ApplicationView;
import view.ScoreInputView;
import model.vo.PlayerId;
class EnterScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;
    @inject public var playerId:PlayerId;
    @inject public var modalBackgroundView:ModalBackgroundView;

    override public function execute():Void {
        scoreInputView.id = playerId;
        applicationView.addChild(modalBackgroundView);
        applicationView.addChild(scoreInputView);
    }

}