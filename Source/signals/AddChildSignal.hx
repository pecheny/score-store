package signals;
import flash.display.DisplayObject;
import msignal.Signal.Signal2;
class AddChildSignal extends Signal2<String, DisplayObject> {
    public function new() {
        super(String, DisplayObject);
    }
}