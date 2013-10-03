package signals;
import view.ViewBase;
import msignal.Signal.Signal1;
class CenterViewVerticallySignal extends Signal1<ViewBase> {
    public function new() {
        super(ViewBase);
    }
}