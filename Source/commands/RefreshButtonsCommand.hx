package commands;
import constants.PlayerViewStyle;
import constants.PlayerViewStyle;
import view.ViewBase;
import model.ButtonBarContainerModel;
import model.ButtonsModel;
class RefreshButtonsCommand extends mmvc.impl.Command {
    @inject public var buttonsModel:ButtonsModel;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;

    override public function execute():Void {
        buttonBarContainerModel.butonBarContainer.clearChildren();
        var buttons = buttonsModel.getActiveButtons();
        var x:Float = 0; // PlayerViewStyle.GRID_STEP;
        var allButtonsWidth = PlayerViewStyle.UNIT_WIDTH - PlayerViewStyle.GRID_STEP * (buttons.length - 1);
        var width = allButtonsWidth / buttons.length;
        for (i in 0...buttons.length) {
            var button:ViewBase = buttons[i];
            button.initBounds(width, PlayerViewStyle.UNIT_HEIGHT, PlayerViewStyle.CORNER_RADIUS);
            button.x = x;
            x += button.width + PlayerViewStyle.GRID_STEP;
            buttonBarContainerModel.butonBarContainer.addChild(button);
        }
    }



}