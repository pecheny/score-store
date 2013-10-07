package mediators;
import signals.CloseModalWindowSignal;
import signals.ShowModalWindowSignal;
import flash.events.KeyboardEvent;
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
    @inject public var showModalWindowSignal:ShowModalWindowSignal;
    @inject public var closeModalWindowSignal:CloseModalWindowSignal;
    var applicationView:ApplicationView;
    var modalWindow:Bool;


    override public function onRegister() {
        applicationView = cast contextView;
        Lib.current.stage.addEventListener(Event.RESIZE, stageResizedHandler);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, keyboardUpHandler);
        addChildSignal.add(addChildHandler);
        removeChildSignal.add(removeChildHandler);

        showModalWindowSignal.add(function(w:DisplayObject) {modalWindow = true;});
        closeModalWindowSignal.add(function() {modalWindow = false;});
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

    private function keyboardUpHandler(e:KeyboardEvent):Void {
        if (e.keyCode == 27) {
            e.stopImmediatePropagation();
            if(modalWindow) {
            closeModalWindowSignal.dispatch();
            }
        }
    }
}