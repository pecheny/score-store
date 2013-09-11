package signals;
import model.vo.PlayerId;
import msignal.Signal.Signal2;
class ChangeScoreSignal extends Signal2<PlayerId, Int> {
    public function new() {
        super(PlayerId, Int);
    }
}