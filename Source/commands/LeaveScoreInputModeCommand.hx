package commands;
import view.ScoreInputView;
import view.ApplicationView;
class LeaveScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;

    override public function execute():Void {
        applicationView.removeChild(scoreInputView);
    }

}