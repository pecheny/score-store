package commands;
import signals.RemoveChildSignal;
import view.ApplicationView;
import view.PlayersChooserView;
import view.ModalBackgroundView;
class LeavePlayersChooseCommand extends mmvc.impl.Command {


    @inject public var modalBackgroundView:ModalBackgroundView;
    @inject public var playersChooserView:PlayersChooserView;
    @inject public var applicationView:ApplicationView;
    @inject public var removeChildSignal:RemoveChildSignal;

    override public function execute():Void {
        removeChildSignal.dispatch(modalBackgroundView);
        removeChildSignal.dispatch(playersChooserView);
    }

}