package signals;
import view.ViewBase;
import msignal.Signal.Signal1;
class CenterViewwVerticallySignal extends Signal1<ViewBase> {
    public function new() {
        super(ViewBase);
    }
}