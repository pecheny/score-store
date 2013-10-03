package signals;
import model.vo.PlayerId;
import msignal.Signal.Signal1;
class EnablePlayerSignal extends Signal1<PlayerId> {

    public function new():Void {
        super(PlayerId);
    }
}