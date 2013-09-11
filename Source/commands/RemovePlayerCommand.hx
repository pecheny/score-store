package commands;
import model.vo.PlayerId;
import model.PlayerModel;
import signals.RemovePlayerSignal;
class RemovePlayerCommand extends mmvc.impl.Command {
    @inject
    public var mySignal:RemovePlayerSignal;
    @inject
    public var playersModel:PlayerModel;
    @inject
    public var playerId:PlayerId;

    override public function execute():Void {
        playersModel.removePlayer(playerId);
    }

}