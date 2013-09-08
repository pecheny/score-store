package view;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;


class ApplicationView implements mmvc.api.IViewContainer {
    public var viewAdded:Dynamic -> Void;
    public var viewRemoved:Dynamic -> Void;
    public var rootContainer:DisplayObjectContainer;

    public function new(rootContainer:DisplayObjectContainer) {
        this.rootContainer = rootContainer;
    }

    public function addChild(child:DisplayObject):Void {
        rootContainer.addChild(child);
        viewAdded(child);
    }

    public function removeChild(child:DisplayObject):Void {
        rootContainer.removeChild(child);
        viewRemoved(child);
    }


    public function isAdded(view:Dynamic):Bool {
        return true;
    }


}