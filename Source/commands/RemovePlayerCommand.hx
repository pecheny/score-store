package commands;
import signals.UpdateLayoutSignal;
import signals.RemoveChildSignal;
import view.PlayerView;
import view.ApplicationView;
import model.PlayerViewsModel;
import model.vo.PlayerId;
import model.PlayerModel;
import signals.RemovePlayerSignal;
class RemovePlayerCommand extends mmvc.impl.Command {
    @inject public var mySignal:RemovePlayerSignal;
    @inject public var playersModel:PlayerModel;
    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var appView:ApplicationView;
    @inject public var playerId:PlayerId;
    @inject public var removeChildSignal:RemoveChildSignal;
    @inject public var updateLayoutSignal:UpdateLayoutSignal;

    override public function execute():Void {
        playersModel.disablePlayer(playerId);
        var pview:PlayerView = playerViewsModel.getView(playerId);
        playerViewsModel.removeView(playerId);
        removeChildSignal.dispatch(pview);
        updateLayoutSignal.dispatch();
    }

}