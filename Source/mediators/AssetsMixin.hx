package mediators;
import flash.display.DisplayObject;
import flash.display.Sprite;
class AssetsMixin {

    public static function makeGraphics<DisplayObjectContainer>(layoutMc:flash.display.Sprite, sourceName:String):DisplayObject {
        var sprite:Sprite = cast layoutMc.getChildByName(sourceName);
        sprite.mouseEnabled = false;
        return sprite;
    }

    public static function makeTapZone<DisplayObjectContainer>(layoutMc:flash.display.Sprite, hitAreaName:String):DisplayObject {
        var hitArea:Sprite = cast layoutMc.getChildByName(hitAreaName);
        hitArea.alpha = 0;
        hitArea.mouseChildren = false;
        hitArea.name = hitAreaName;
        return hitArea;
    }

    public static function copyTransformFrom<TextField>(label:flash.text.TextField, transformSource:DisplayObject):Void {
        label.width = transformSource.width;
        label.height = transformSource.height;
        label.transform.matrix = transformSource.transform.matrix.clone();
    }
}