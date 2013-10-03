package commands;
import constants.CustomViewName;
import model.PlayerViewsModel;
import signals.RemoveChildSignal;
class CloseModalWindowCommand extends mmvc.impl.Command {


    @inject public var playerViewsModel:PlayerViewsModel;
    @inject public var removeChildSignal:RemoveChildSignal;

    override public function execute():Void {
        removeView(CustomViewName.WINDOW);
        removeView(CustomViewName.BACKGROUND);
    }

    private function removeView(name:String):Void {
        var view = playerViewsModel.getCustomView(name);
        removeChildSignal.dispatch(view);
        playerViewsModel.removeCustomView(name);

    }

}