package commands;
import signals.UpdateLayoutSignal;
import view.PlayerView;
import model.vo.PlayerId;
import view.ApplicationView;
import view.PlayerViewFactory;
import model.PlayerViewsModel;
import model.PlayerModel;
import signals.AddPlayerSignal;
class AddPlayerCommand extends mmvc.impl.Command {
    @inject
    public var mySignal:AddPlayerSignal;
    @inject
    public var playersModel:PlayerModel;
    @inject
    public var playerViewsModel:PlayerViewsModel;
    @inject
    public var viewFactory:PlayerViewFactory;
    @inject
    public var appView:ApplicationView;
    @inject public var updateLayoutSignal:UpdateLayoutSignal;

   override public function execute():Void {
       var id:PlayerId = playersModel.addPlayer();
       var view:PlayerView = viewFactory.getView();
       playerViewsModel.addView(id, view);
       view.setPlayerId(id);
       appView.addChild(view);
       updateLayoutSignal.dispatch();
    }
}