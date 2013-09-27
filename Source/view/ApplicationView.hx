package view;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;


class ApplicationView implements mmvc.api.IViewContainer {
    public var viewAdded:Dynamic -> Void;
    public var viewRemoved:Dynamic -> Void;

    private var container:DisplayObjectContainer;


    public function new(container:DisplayObjectContainer) {
        this.container = container;
    }


    public function addChild(child:DisplayObject):DisplayObject {
        if (Std.is(child, ViewBase)) {
            var view:ViewBase = cast child;
            view.viewAdded = viewAdded;
            view.viewRemoved = viewRemoved;
        }
        container.addChild(child);
        viewAdded(child);
        return child;
    }

    public function removeChild(child:DisplayObject):DisplayObject {
        viewRemoved(child);
        container.removeChild(child);
        return child;
    }

    public function isAdded(view:Dynamic):Bool {
        var parent:DisplayObjectContainer = null;
        while (view.parent != null) {
            parent = view.parent;
        }
        return (parent != null) && (parent == container);
    }

    public function getStageWidth():Float {
        return container.stage.stageWidth;
    }

    public function getStageHeight():Float {
        trace(container.stage.stageHeight);
        return container.stage.stageHeight;
    }

    public function getRootContainer():DisplayObjectContainer {
        return container;
    }


}