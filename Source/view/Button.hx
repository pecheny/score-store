package view;
import flash.display.DisplayObject;
class Button extends ViewBase {
    public function new(icon:DisplayObject) {
        addChild(icon);
        mouseChildren = false;
    }
}