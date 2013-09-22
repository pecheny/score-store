package view;
import format.SWF;
import flash.display.MovieClip;
class PlayerViewLayout {
    private var swf(default, null):SWF;

    public function new(mc:SWF):Void {
        swf = mc;
    }

    public function getPlayerViewMovieClip():MovieClip {
        return swf.createMovieClip("PlayerUnitView");
    }


}