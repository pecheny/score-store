package commands;
import signals.AddChildSignal;
import constants.LayerName;
import signals.UpdateLayoutSignal;
import view.PlayerView;
import model.vo.PlayerId;
import view.ApplicationView;
import factories.PlayerViewFactory;
import model.PlayerViewsModel;
import model.PlayerModel;
import signals.AddPlayerSignal;
class AddPlayerCommand extends mmvc.impl.Command {
    @inject public var mySignal:AddPlayerSignal;
    @inject public var playersModel:PlayerModel;
    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var viewFactory:PlayerViewFactory;
    @inject public var appView:ApplicationView;
    @inject public var updateLayoutSignal:UpdateLayoutSignal;
    @inject public var playerId:PlayerId;
    @inject public var addChildSignal:AddChildSignal;

    override public function execute():Void {
        playersModel.enablePlayer(playerId);
        var view:PlayerView = viewFactory.getView();
        playerViewsModel.addView(playerId, view);
        view.setPlayerId(playerId);
        addChildSignal.dispatch(LayerName.MAIN, view);
        updateLayoutSignal.dispatch();
    }
}