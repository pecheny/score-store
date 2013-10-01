package mediators;
import flash.display.DisplayObject;
import signals.RemoveChildSignal;
import signals.AddChildSignal;
import flash.Lib;
import signals.StageResizedSignal;
import flash.events.Event;
import view.ApplicationView;
class ApplicationViewMediator extends mmvc.impl.Mediator<ApplicationView> {

    @inject public var resizeSignal:StageResizedSignal;
    @inject public var addChildSignal:AddChildSignal;
    @inject public var removeChildSignal:RemoveChildSignal;
    var applicationView:ApplicationView;


    override public function onRegister() {
        applicationView = cast contextView;
        Lib.current.stage.addEventListener(Event.RESIZE, stageResizedHandler);
        addChildSignal.add(addChildHandler);
        removeChildSignal.add(removeChildHandler);
    }

    override public function preRemove():Void {
        addChildSignal.remove(addChildHandler);
        removeChildSignal.remove(removeChildHandler);
        Lib.current.stage.removeEventListener(Event.RESIZE, stageResizedHandler);
    }


    private function stageResizedHandler(e:Event):Void {
        resizeSignal.dispatch();
    }


    private function addChildHandler(layerName:String, child:DisplayObject):Void {
        applicationView.addToLayer(layerName, child);
    }

    private function removeChildHandler(child:DisplayObject):Void {
        applicationView.removeChild(child);
    }
}