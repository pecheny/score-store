package commands;
import model.vo.PlayerId;
import signals.ChangeScoreSignal;
class MouseHandleCommand extends mmvc.impl.Command {
    @inject
    public var playerId:PlayerId;
    @inject
    public var changeScoreSignal:ChangeScoreSignal;

    override public function execute():Void {
        changeScoreSignal.dispatch(playerId, 2);
    }

}