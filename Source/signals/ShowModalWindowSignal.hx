package signals;
import msignal.Signal.Signal1;
import flash.display.DisplayObject;
class ShowModalWindowSignal extends Signal1<DisplayObject> {
    public function new() {
        super(DisplayObject);
    }
}