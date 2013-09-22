package view;
import flash.display.DisplayObject;
class Button extends ViewBase {
    var icon:DisplayObject;

    public function new(icon:DisplayObject) {
        super();
        this.icon = icon;
        addChild(icon);
        mouseChildren = false;
    }

    override public function initBounds(w:Float, h:Float, r:Float):Void {
        icon.x = w / 2 - icon.width / 2;
        super.initBounds(w, h, r);
    }


}