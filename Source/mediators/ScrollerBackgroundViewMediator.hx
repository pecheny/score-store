package mediators;
import model.PlayerViewsModel;
import signals.UpdateLayoutSignal;
import model.PlayerModel;
import view.ApplicationView;
import signals.StageResizedSignal;
import constants.PlayerViewStyle;
import view.ScrollerBackgroundView;
class ScrollerBackgroundViewMediator extends mmvc.impl.Mediator<ScrollerBackgroundViewMediator> {
    @inject public var applicationView:ApplicationView;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var playerModel:PlayerModel;
    @inject public var updateLayoutSignal:UpdateLayoutSignal;
    @inject public var playerViewsModel:PlayerViewsModel;
    var scrollerBackgroundView:ScrollerBackgroundView;

    override public function onRegister():Void {
        scrollerBackgroundView = cast view;
        fillBackground();
        stageResizedSignal.add(stageResizedHandler);
        updateLayoutSignal.add(stageResizedHandler);

    }

    override public function preRemove():Void {
        stageResizedSignal.remove(stageResizedHandler);
        updateLayoutSignal.remove(stageResizedHandler);
    }

    function stageResizedHandler():Void {
        fillBackground();
    }

//    function childAddedHandler(name:String, child:DisplayObject):Void {
//        fillBackground();
//    }
//
//    function childRemovedHandler(child:DisplayObject):Void {
//        fillBackground();
//    }

    private function fillBackground():Void {
        scrollerBackgroundView.graphics.clear();
        scrollerBackgroundView.graphics.beginFill(0xffffff);
        scrollerBackgroundView.graphics.drawRect(-PlayerViewStyle.GRID_STEP, 0, applicationView.getStageWidth() / applicationView.calculateScale(), playerViewsModel.calculateContainerHeight());
        scrollerBackgroundView.graphics.endFill();
    }
}