package commands;
import view.PlayerView;
import model.PlayerViewsModel;
import model.vo.PlayerId;
import model.PlayerModel;
import signals.ChangeScoreSignal;
class ChangeScoreCommand extends mmvc.impl.Command {
    @inject
    public var mySignal:ChangeScoreSignal;
    @inject
    public var playersModel:PlayerModel;
    @inject
    public var playerViewsModel:PlayerViewsModel;
    @inject
    public var playerId:PlayerId;
    @inject
    public var deltaScore:Int;

    override public function execute():Void {
        playersModel.changeScore(playerId, deltaScore);
        var pview:PlayerView = playerViewsModel.getView(playerId);
        var score:Int = playersModel.getScore(playerId);
        pview.setText("" + score);
    }

}