package commands;
import model.vo.PlayerId;
import signals.NewGameSignal;
import signals.ChangeScoreSignal;
import signals.EnablePlayerSignal;
class SetStateCommand extends mmvc.impl.Command {

    @inject public var enablePlayerSignal:EnablePlayerSignal;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    @inject public var newGameSignal:NewGameSignal;
    @inject public var state:String;


    override public function execute():Void {
        newGameSignal.dispatch();
        var players:Map<PlayerId, Int> = haxe.Unserializer.run(state);
        for (player in players.keys()) {
            enablePlayerSignal.dispatch(player);
            changeScoreSignal.dispatch(player, players[player]);
        }
    }
}