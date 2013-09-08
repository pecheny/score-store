package signals;
import msignal.Signal.Signal2;
class ChangeScoreSignal extends Signal2<Int, Int> {

    public var playerId:Int;
    public var deltaScore:Int;

    public function new() {
        super(Int, Int);
    }

    override public function dispatch(playerId:Int, deltaScore:Int) {
        this.playerId = playerId;
        this.deltaScore = deltaScore;
        super.dispatch(playerId, deltaScore);
    }

}