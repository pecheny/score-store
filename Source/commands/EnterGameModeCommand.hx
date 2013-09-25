package commands;
import signals.StageResizedSignal;
import signals.RefreshButtonsSignal;
import model.ButtonsModel;
import constants.ButtonName;
class EnterGameModeCommand extends mmvc.impl.Command {
    @inject public var resizeSignal:StageResizedSignal;
    @inject public var refreshButtonsSignal:RefreshButtonsSignal;
    @inject public var buttonsModel:ButtonsModel;

    override public function execute():Void {
        buttonsModel.enableButtons(ButtonName.New, ButtonName.EditPlayer, ButtonName.Exit);
        refreshButtonsSignal.dispatch();
        resizeSignal.dispatch();
    }
}