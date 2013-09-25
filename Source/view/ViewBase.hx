package view;
import flash.display.DisplayObject;
import flash.display.Sprite;
class ViewBase extends Sprite {
    public var isAddedFlag:Bool;
    public var backgroundColor:UInt = 0;

    public var viewAdded:Dynamic -> Void;
    public var viewRemoved:Dynamic -> Void;

    public function getHeight():Float {
        return this.height;
    }

    public function initBounds(w:Float, h:Float, r:Float):Void {
        graphics.clear();
        graphics.beginFill(backgroundColor, 0.75);
        graphics.drawRoundRect(0, 0, w, h, r, r);
        graphics.endFill();
    }


    override public function addChild(child:DisplayObject):DisplayObject {
        if (Std.is(child, ViewBase)) {
            var view:ViewBase = cast child;
            view.viewAdded = viewAdded;
            view.viewRemoved = viewRemoved;
            view.isAddedFlag = true;
        }
        super.addChild(child);
        if (viewAdded != null) {
            viewAdded(child);
        }
        return child;
    }

    override public function removeChild(child:DisplayObject):DisplayObject {
        super.removeChild(child);
        if (Std.is(child, ViewBase)) {
            var view:ViewBase = cast child;
            view.viewAdded = viewAdded;
            view.viewRemoved = viewRemoved;
            view.isAddedFlag = true;
        }
        if (viewRemoved != null) {
            viewRemoved(child);
        }
        return child;
    }

    override public function removeChildAt(i:Int):DisplayObject {
        var child = getChildAt(i);
        return removeChild(child);
    }


}