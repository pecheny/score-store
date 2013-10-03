package commands;
import model.PlayerModel;
import model.PlayerViewsModel;
class StartNewGameCommand extends mmvc.impl.Command {

 @inject public var playerModel:PlayerModel;
 @inject public var playerViewsModel:PlayerViewsModel;

    override public function execute():Void {
    playerModel.resetScores();
        for (player in playerModel.getPlayers().iterator()) {
        playerViewsModel.getView(player).setText("0");
        }
    }

}