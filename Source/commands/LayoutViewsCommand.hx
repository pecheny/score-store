package commands;
import model.ButtonBarContainerModel;
import view.ViewBase;
import constants.PlayerViewStyle;
import model.PlayerModel;
import model.PlayerViewsModel;
class LayoutViewsCommand extends mmvc.impl.Command {
    @inject
    public var playersModel:PlayerModel;
    @inject
    public var playerViewsModel:PlayerViewsModel;
    @inject public var buttonBarContainerModel:ButtonBarContainerModel;

    override public function execute():Void {
        var players = playersModel.getPlayers().iterator();
        var y:Float = PlayerViewStyle.GRID_STEP;
        for (playerId in players) {
            var viewInstance:ViewBase = playerViewsModel.getView(playerId);
            viewInstance.y = y;
            y += viewInstance.getHeight() + PlayerViewStyle.GRID_STEP;
        }

        buttonBarContainerModel.butonBarContainer.y = y;
    }

}