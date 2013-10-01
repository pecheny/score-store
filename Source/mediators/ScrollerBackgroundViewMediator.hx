package mediators;
import model.PlayerModel;
import view.ApplicationView;
import signals.StageResizedSignal;
import constants.PlayerViewStyle;
import view.ScrollerBackgroundView;
class ScrollerBackgroundViewMediator extends mmvc.impl.Mediator<ScrollerBackgroundViewMediator> {
    @inject public var applicationView:ApplicationView;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var playerModel:PlayerModel;
    var scrollerBackgroundView:ScrollerBackgroundView;

    override public function onRegister():Void {
        scrollerBackgroundView = cast view;
        fillBackground();
        stageResizedSignal.add(stageResizedHandler);
    }

    override public function preRemove():Void {
        stageResizedSignal.remove(stageResizedHandler);
    }

    function stageResizedHandler():Void {
        fillBackground();
    }

    private function fillBackground():Void {
        var numUnits = playerModel.getPlayers().length + 1;
        var unitsHeight = numUnits * (PlayerViewStyle.UNIT_HEIGHT + PlayerViewStyle.GRID_STEP) + PlayerViewStyle.GRID_STEP;
        var stageHeight = applicationView.getStageHeight() / applicationView.calculateScale();
        var height = Math.max(unitsHeight, stageHeight);

        scrollerBackgroundView.graphics.clear();
        scrollerBackgroundView.graphics.beginFill(0xffffff);
        scrollerBackgroundView.graphics.drawRect(-PlayerViewStyle.GRID_STEP, 0, applicationView.getStageWidth() / applicationView.calculateScale(), height);
        scrollerBackgroundView.graphics.endFill();
    }
}