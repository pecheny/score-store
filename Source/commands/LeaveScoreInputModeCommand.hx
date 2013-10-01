package commands;
import signals.RemoveChildSignal;
import view.ModalBackgroundView;
import view.ScoreInputView;
import view.ApplicationView;
class LeaveScoreInputModeCommand extends mmvc.impl.Command {
    @inject public var applicationView:ApplicationView;
    @inject public var scoreInputView:ScoreInputView;
    @inject public var modalBackgroundView:ModalBackgroundView;
    @inject public var removeChildSignal:RemoveChildSignal;


    override public function execute():Void {
        removeChildSignal.dispatch(modalBackgroundView);
        removeChildSignal.dispatch(scoreInputView);
    }

}