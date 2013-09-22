package mediators;
import flash.Lib;
import signals.StageResizedSignal;
import flash.events.Event;
import view.ApplicationView;
class ApplicationViewMediator extends mmvc.impl.Mediator<ApplicationView> {

    @inject public var resizeSignal:StageResizedSignal;

    public function new() {
        super();
    }


    override function onRegister() {
        super.onRegister();
        Lib.current.stage.addEventListener(Event.RESIZE, stageResizedHandler);
    }

    private function stageResizedHandler(e:Event):Void {
        resizeSignal.dispatch();
    }

    override public function onRemove():Void {
        super.onRemove();
    }
}