package signals;
import msignal.Signal.Signal1;
class SetStateSignal extends Signal1<String> {
    public function new() {
        super(String);
    }
}