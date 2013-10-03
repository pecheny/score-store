package commands;
import signals.UpdateLayoutSignal;
import signals.RemoveChildSignal;
import view.PlayerView;
import model.PlayerViewsModel;
import model.vo.PlayerId;
import model.PlayerModel;
class DisablePlayerCommand extends mmvc.impl.Command {
    @inject public var playersModel:PlayerModel;
    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var playerId:PlayerId;
    @inject public var removeChildSignal:RemoveChildSignal;
    @inject public var updateLayoutSignal:UpdateLayoutSignal;

    override public function execute():Void {
        playersModel.disablePlayer(playerId);
        var pview:PlayerView = playerViewsModel.getPlayerView(playerId);
        playerViewsModel.removePlayerView(playerId);
        removeChildSignal.dispatch(pview);
        updateLayoutSignal.dispatch();
    }

}