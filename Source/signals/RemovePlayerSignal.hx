package signals;
import msignal.Slot;
import msignal.Signal.Signal1;
import msignal.Signal.Signal;
class RemovePlayerSignal extends Signal1<Int> {
    public var playerId:Int;

    public function new() {
        super(Int);
    }


}