package mediators;
import constants.PlayerViewStyle;
import signals.StageResizedSignal;
import view.ApplicationView;
import view.ModalBackgroundView;
class ModalBackgroundViewMediator extends mmvc.impl.Mediator<ModalBackgroundView> {
    @inject public var applicationView:ApplicationView;
    @inject public var stageResizedSignal:StageResizedSignal;
    var modalBackgroundView:ModalBackgroundView;

    override public function onRegister():Void {
        modalBackgroundView = cast view;
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
        modalBackgroundView.graphics.clear();
        modalBackgroundView.graphics.beginFill(0xc0c0c0, 0.75);
        modalBackgroundView.graphics.drawRect(-PlayerViewStyle.GRID_STEP, 0, applicationView.getStageWidth() / applicationView.calculateScale(), applicationView.getStageHeight() / applicationView.calculateScale());
        modalBackgroundView.graphics.endFill();
    }
}