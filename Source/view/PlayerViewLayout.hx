package view;
import format.SWF;
import flash.display.MovieClip;
class PlayerViewLayout {
    private var swf:SWF;

    public function new(mc:SWF):Void {
        swf = mc;
    }

    public function getMovieClip():MovieClip {
        return swf.createMovieClip("PlayerUnitView");
    }
}