package signals;
import flash.events.MouseEvent;
import msignal.Signal.Signal2;
class PlayerButtonSignal extends Signal2<PlayerId, MouseEvent> {
    public function new() {
        super(PlayerId, MouseEvent);
    }
}