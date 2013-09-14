package commands;
import view.ApplicationView;
class ScaleStageCommand extends mmvc.impl.Command {


    @inject public var appView:ApplicationView;


    override public function execute():Void {
        var stage = appView.rootContainer.stage;
        var root = appView.rootContainer;
        var xRatio = stage.stageWidth / root.width;
        var yRatio = stage.stageHeight / root.height;
        var ratio = (xRatio < yRatio) ? xRatio : yRatio;
        root.width *= ratio;
        root.height *= ratio;
    }

}