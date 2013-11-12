package mediators;
import signals.ShowModalWindowSignal;
import signals.CloseModalWindowSignal;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.StageResizedSignal;
import signals.RemoveChildSignal;
import signals.AddChildSignal;
import view.ApplicationView;
import flash.display.Sprite;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class ApplicationViewMediatorTest {
    var applicationViewMediator:ApplicationViewMediator;
    var applicationView:ApplicationView;
    var addChildSignal:AddChildSignal;
    var removeChildSignal:RemoveChildSignal;
    var timer:Timer;
    var child:Sprite;

    @Before public function startup() {
        var rootContainer = mock(Sprite);
        child = new Sprite();
        applicationView = mock(ApplicationView);
        addChildSignal = new AddChildSignal();
        removeChildSignal = new RemoveChildSignal();
        var stageResizedSignal:StageResizedSignal = mock(StageResizedSignal);


        applicationViewMediator = new ApplicationViewMediator();
        applicationViewMediator.contextView = applicationView;
        applicationViewMediator.resizeSignal = stageResizedSignal;
        applicationViewMediator.addChildSignal = addChildSignal;
        applicationViewMediator.removeChildSignal = removeChildSignal;
        applicationViewMediator.showModalWindowSignal = new ShowModalWindowSignal();
        applicationViewMediator.closeModalWindowSignal = new CloseModalWindowSignal();
    }

    @AsyncTest public function should_call_addChild(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldCallAddchildHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationViewMediator.onRegister();
        addChildSignal.dispatch("name", child);
    }

    function shouldCallAddchildHandler():Void {
        applicationView.addToLayer("name", child).verify(1);
    }

    @AsyncTest public function should_call_removeChild(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldCallRemovechildHandler, 300);
        timer = Timer.delay(handler, 200);
        applicationViewMediator.onRegister();
        removeChildSignal.dispatch(child);
    }

    function shouldCallRemovechildHandler():Void {
        applicationView.removeChild(child).verify(1);
    }
}