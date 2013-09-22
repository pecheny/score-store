package commands;
import flash.Lib;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import view.ApplicationView;
class ScaleStageCommand extends mmvc.impl.Command {


    @inject public var appView:ApplicationView;

    var root:DisplayObject;

    override public function execute():Void {
        root = Lib.current;

        var scale = grtScale();
        root.scaleX = scale;
        root.scaleY = scale;
        root.x = PlayerViewStyle.GRID_STEP * scale;
    }

    private function grtScale():Float {
        var stage = root.stage;
        var rootBoundBox = root.getBounds(root);
        var xRatio = stage.stageWidth / (rootBoundBox.width + PlayerViewStyle.GRID_STEP * 2);
        return xRatio;
//        var yRatio = stage.stageHeight / root.height;
//        var ratio = (xRatio < yRatio) ? xRatio : yRatio;
//        return ratio
    }

}