package view;
import constants.PlayerViewStyle;
import constants.PlayerViewStyle;
import flash.display.DisplayObject;
import flash.display.DisplayObjectContainer;


class ApplicationView implements mmvc.api.IViewContainer {
    public var viewAdded:Dynamic -> Void;
    public var viewRemoved:Dynamic -> Void;

    private var container:DisplayObjectContainer;
    var layers:Map<String, ViewBase>;


    public function new(container:DisplayObjectContainer) {
        this.container = container;
        layers = new Map<String, ViewBase>();
    }


//    public function addChild(child:DisplayObject):DisplayObject {
//        if (Std.is(child, ViewBase)) {
//            var view:ViewBase = cast child;
//            view.viewAdded = viewAdded;
//            view.viewRemoved = viewRemoved;
//        }
//        container.addChild(child);
//        viewAdded(child);
//        return child;
//    }
//
//    public function addChildAt(child:DisplayObject, index:Int):DisplayObject {
//            if (Std.is(child, ViewBase)) {
//                var view:ViewBase = cast child;
//                view.viewAdded = viewAdded;
//                view.viewRemoved = viewRemoved;
//            }
//            container.addChildAt(child, index);
//            viewAdded(child);
//            return child;
//        }
//
//    public function removeChild(child:DisplayObject):DisplayObject {
//        viewRemoved(child);
//        container.removeChild(child);
//        return child;
//    }

    public function addLayer(name:String, layer:ViewBase):Void {
        if (layers.exists(name)) {
            throw "Layer " + name + " already exists";
        }
        if (layer == null) {
            throw "Layer can't be null";
        }
        layers[name] = layer;
        layer.viewAdded = viewAdded;
        layer.viewRemoved = viewRemoved;
        container.addChild(layer);
        viewAdded(layer);
    }

    function hasLayer(name:String):Bool {
        return layers.exists(name);
    }

    public function addToLayer(layerName:String, child:DisplayObject):Void {
        if (hasLayer(layerName)) {
            layers[layerName].addChild(child);
        } else {
            throw "Layer " + layerName + " does not exist";
        }
    }

    public function removeChild(child:DisplayObject):Void {
        for (layer in layers.iterator()) {
            if (layer.contains(child)) {
                layer.removeChild(child);
                return;
            }
        }
        throw "Can't remove " + child + " which is not a child of the current display list";
    }

    public function setScale(scale:Float):Void {
        container.scaleX = scale;
        container.scaleY = scale;
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
        return container.stage.stageHeight;
    }

    public function getRootContainer():DisplayObjectContainer {
        return container;
    }

    public function calculateScale():Float {
        var xRatio = getStageWidth() / (PlayerViewStyle.UNIT_WIDTH + PlayerViewStyle.GRID_STEP * 2);
        return xRatio;
    }


}