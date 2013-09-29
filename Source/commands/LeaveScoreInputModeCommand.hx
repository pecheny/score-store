package commands;
import view.ModalBackgroundView;
import view.ScoreInputView;
import view.ApplicationView;
class LeaveScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;
    @inject public var modalBackgroundView:ModalBackgroundView;


    override public function execute():Void {
        applicationView.removeChild(modalBackgroundView);
        applicationView.removeChild(scoreInputView);
    }

}