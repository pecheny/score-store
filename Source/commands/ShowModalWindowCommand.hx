package commands;
import constants.CustomViewName;
import factories.PlayerViewFactory;
import flash.display.DisplayObject;
import model.PlayerViewsModel;
import signals.AddChildSignal;
import constants.LayerName;
class ShowModalWindowCommand extends mmvc.impl.Command {


    @inject public var window:DisplayObject;
    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var playerViewFactory:PlayerViewFactory;
    @inject public var addChildSignal:AddChildSignal;

    override public function execute():Void {
        var modalBackgroundView = playerViewFactory.grtModalBackground();
        addView(CustomViewName.BACKGROUND, modalBackgroundView);
        addView(CustomViewName.WINDOW, window);
    }

    private function addView(name:String, child:DisplayObject):Void {
        playerViewsModel.addCustomView(name, child);
                addChildSignal.dispatch(LayerName.TOP, child);
    }

}