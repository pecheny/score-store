package signals;
import msignal.Signal.Signal1;
import model.vo.PlayerId;
class EnterScoreInputModeSignal extends Signal1<PlayerId> {
    public function new() {
        super(PlayerId);
    }
}