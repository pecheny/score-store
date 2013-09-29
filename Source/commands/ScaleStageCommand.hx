package commands;
import flash.Lib;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import view.ApplicationView;
class ScaleStageCommand extends mmvc.impl.Command {


    @inject public var appView:ApplicationView;

    var root:DisplayObject;

    override public function execute():Void {
        root = appView.getRootContainer();
        var scale = appView.calculateScale();
        root.scaleX = scale;
        root.scaleY = scale;
        root.x = PlayerViewStyle.GRID_STEP * scale;
    }



}