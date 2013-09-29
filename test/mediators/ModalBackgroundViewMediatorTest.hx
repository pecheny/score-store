package mediators;
import haxe.Timer;
import signals.StageResizedSignal;
import massive.munit.async.AsyncFactory;
import massive.munit.Assert;
import view.ApplicationView;
import view.ModalBackgroundView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class ModalBackgroundViewMediatorTest {
    var modalBackgroundViewMediator:ModalBackgroundViewMediator;
    var modalBackgroundView:ModalBackgroundView;
    var applicationView:ApplicationView;
    var stageResizedSignal:StageResizedSignal;
    var timer:Timer;

    @Before public function startup() {
        modalBackgroundViewMediator = new ModalBackgroundViewMediator();
        stageResizedSignal = new StageResizedSignal();
        modalBackgroundView = new ModalBackgroundView();
        applicationView = mock(ApplicationView);
        applicationView.getStageHeight().returns(800);
        applicationView.getStageWidth().returns(400);
        applicationView.calculateScale().returns(1);

        modalBackgroundViewMediator.stageResizedSignal = stageResizedSignal;
        modalBackgroundViewMediator.applicationView = applicationView;
        modalBackgroundViewMediator.view = modalBackgroundView;
    }

    @Test public function should_fill_background_according_to_stage_size():Void {

        modalBackgroundViewMediator.onRegister();
        Assert.areEqual(800, modalBackgroundView.height);
        Assert.areEqual(400, modalBackgroundView.width);
    }

    @AsyncTest public function should_fill_background_according_to_stage_size_onResize(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldFillBackgroundAccordingToStageSizeOnresizeHandler, 300);
        timer = Timer.delay(handler, 200);
        modalBackgroundViewMediator.onRegister();
        applicationView = mock(ApplicationView);
        applicationView.calculateScale().returns(1);
        applicationView.getStageHeight().returns(560);
        applicationView.getStageWidth().returns(430);
        modalBackgroundViewMediator.applicationView = applicationView;
        stageResizedSignal.dispatch();

    }

    function shouldFillBackgroundAccordingToStageSizeOnresizeHandler():Void {
        Assert.areEqual(560, modalBackgroundView.height);
        Assert.areEqual(430, modalBackgroundView.width);
    }

}