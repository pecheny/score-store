package model;
import flash.display.Sprite;
import format.SWF;
class AssetsModel {
    public var swf(default, null):SWF;

    public function new(mc:SWF):Void {
        swf = mc;
    }

    public function getPlayerViewMovieClip():Sprite {
        return swf.createMovieClip("PlayerUnitView");
    }

    public function getPlayerEditMovieClip():Sprite {
        return swf.createMovieClip("PlayerEditMode");
    }


}