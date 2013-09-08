package commands;
import model.PlayerModel;
import signals.RemovePlayerSignal;
class RemovePlayerCommand extends mmvc.impl.Command {


    @inject
    public var mySignal:RemovePlayerSignal;

    @inject
       public var playersModel:PlayerModel;

    override public function execute():Void {
        playersModel.removePlayer(mySignal.playerId);
    }

}