package signals;
import flash.display.DisplayObject;
import msignal.Signal.Signal1;
class RemoveChildSignal extends Signal1<DisplayObject> {
    public function new() {
        super(DisplayObject);
    }
}