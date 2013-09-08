package commands;
import model.PlayerModel;
import signals.ChangeScoreSignal;
class ChangeScoreCommand extends mmvc.impl.Command {
    @inject
    public var mySignal:ChangeScoreSignal;
    @inject
    public var playersModel:PlayerModel;

    override public function execute():Void {
        playersModel.changeScore(mySignal.playerId, mySignal.deltaScore);
    }

}