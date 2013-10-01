package commands;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import view.ApplicationView;
class ScaleStageCommand extends mmvc.impl.Command {


    @inject public var appView:ApplicationView;

    var root:DisplayObject;

    override public function execute():Void {
        var scale = appView.calculateScale();
        appView.setScale(scale);
        appView.getRootContainer().x = PlayerViewStyle.GRID_STEP * scale;
    }
}