package commands;
import view.ApplicationView;
import model.ButtonBarContainerModel;
import view.ViewBase;
import constants.PlayerViewStyle;
import model.PlayerModel;
import model.PlayerViewsModel;
class LayoutViewsCommand extends mmvc.impl.Command {
    @inject public var playersModel:PlayerModel;
    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;
    @inject public var applicationView:ApplicationView;

    override public function execute():Void {
        var players = playersModel.getPlayers().iterator();
        var y:Float = PlayerViewStyle.GRID_STEP;
        for (playerId in players) {
            var viewInstance:ViewBase = playerViewsModel.getPlayerView(playerId);
            viewInstance.y = y;
            y += viewInstance.getHeight() + PlayerViewStyle.GRID_STEP;
        }

        buttonBarContainerModel.butonBarContainer.y = isFitInScreen()?
            applicationView.getStageHeight() / applicationView.calculateScale() - PlayerViewStyle.UNIT_HEIGHT - PlayerViewStyle.GRID_STEP
            :y;
    }

    private function isFitInScreen():Bool {
        var numUnits = playersModel.getPlayers().length + 1;
           var unitsHeight = numUnits * (PlayerViewStyle.UNIT_HEIGHT + PlayerViewStyle.GRID_STEP) + PlayerViewStyle.GRID_STEP;
           var stageHeight = applicationView.getStageHeight() / applicationView.calculateScale();
           return unitsHeight < stageHeight;
    }

}