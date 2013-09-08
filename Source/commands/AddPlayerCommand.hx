package commands;
import model.PlayerModel;
import signals.AddPlayerSignal;
class AddPlayerCommand extends mmvc.impl.Command {


    @inject
    public var mySignal:AddPlayerSignal;

    @inject
    public var playersModel:PlayerModel;

   override public function execute():Void {
        playersModel.addPlayer();
    }

}