package view;
import flash.display.Sprite;
class ViewBase extends Sprite {

    public function getHeight():Float {
        return this.height;
    }

    public function initBounds(w:Float, h:Float, r:Float):Void {
            graphics.beginFill(0, 0.75);
            graphics.drawRoundRect(0, 0, w, h, r, r);
            graphics.endFill();
        }
}