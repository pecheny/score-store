package commands;
import signals.AddChildSignal;
import constants.LayerName;
import signals.AddPlayerSignal;
import view.ApplicationView;
import view.PlayersChooserView;
import view.ModalBackgroundView;
class EnterPlayersChooseCommand extends mmvc.impl.Command {


    @inject public var modalBackgroundView:ModalBackgroundView;
    @inject public var playersChooserView:PlayersChooserView;
    @inject public var applicationView:ApplicationView;
    @inject public var addChildSignal:AddChildSignal;

    override public function execute():Void {
        addChildSignal.dispatch(LayerName.TOP, modalBackgroundView);
        addChildSignal.dispatch(LayerName.TOP, playersChooserView);
    }

}