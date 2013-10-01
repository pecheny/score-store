package commands;
import view.ApplicationView;
import view.PlayersChooserView;
import view.ModalBackgroundView;
class EnterPlayersChooseCommand extends mmvc.impl.Command {


    @inject public var modalBackgroundView:ModalBackgroundView;
    @inject public var playersChooserView:PlayersChooserView;
    @inject public var applicationView:ApplicationView;

    override public function execute():Void {
        applicationView.addChild(modalBackgroundView);
        applicationView.addChild(playersChooserView);
    }

}