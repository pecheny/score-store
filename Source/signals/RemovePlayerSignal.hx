package signals;
import model.vo.PlayerId;
import msignal.Signal.Signal1;
import msignal.Signal.Signal;
class RemovePlayerSignal extends Signal1<PlayerId> {
    public function new() {
        super(PlayerId);
    }
}