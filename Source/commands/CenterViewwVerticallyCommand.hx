package commands;
import view.ApplicationView;
import view.ViewBase;
class CenterViewwVerticallyCommand extends mmvc.impl.Command {

    @inject public var applicationView:ApplicationView;
    @inject public var viewBase:ViewBase;

    override public function execute():Void {
        viewBase.y = (applicationView.getStageHeight()/applicationView.calculateScale() - viewBase.getHeight()) / 2;
    }

}