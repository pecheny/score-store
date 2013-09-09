package commands;
import view.ApplicationView;
import model.PlayerViewFactory;
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
    @Inject
    public var viewFactory:PlayerViewFactory;
    @Inject
    public var appView:ApplicationView;

   override public function execute():Void {
       var id:Int = playersModel.addPlayer();
       var view = viewFactory.getView();
       playerViewsModel.addView(id, view);
       appView.addChild(view);
    }
}