package commands;
import signals.DumpStateSignal;
import view.PlayerView;
import model.PlayerViewsModel;
import model.vo.PlayerId;
import model.PlayerModel;
import signals.ChangeScoreSignal;
class ChangeScoreCommand extends mmvc.impl.Command {
    @inject    public var mySignal:ChangeScoreSignal;
    @inject    public var playersModel:PlayerModel;
    @inject    public var playerViewsModel:PlayerViewsModel;
    @inject    public var playerId:PlayerId;
    @inject    public var deltaScore:Int;
    @inject public var dumpStateSignal:DumpStateSignal;

    override public function execute():Void {
        playersModel.changeScore(playerId, deltaScore);
        var pview:PlayerView = playerViewsModel.getPlayerView(playerId);
        var score:Int = playersModel.getScore(playerId);
        pview.setScore(score);
        dumpStateSignal.dispatch();
    }

}