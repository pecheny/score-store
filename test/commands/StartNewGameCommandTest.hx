package commands;
import view.PlayerView;
import model.vo.PlayerId;
import model.PlayerViewsModel;
import model.PlayerModel;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class StartNewGameCommandTest {
    var startNewGameCommand:StartNewGameCommand;
    var playerModel:PlayerModel;
    var playerViewsModel:PlayerViewsModel;
    var playerView:PlayerView;

    @Before public function startup() {
        playerModel = mock(PlayerModel);
        playerModel.getScore(cast Matcher.any).returns(0);
        playerModel.getPlayers().returns([PlayerId.fromInt(1), PlayerId.fromInt(2), PlayerId.fromInt(4)]);

        playerView = mock(PlayerView);

        playerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.getPlayerView(cast Matcher.any).returns(playerView);

        startNewGameCommand = new StartNewGameCommand();
        startNewGameCommand.playerViewsModel = playerViewsModel;
        startNewGameCommand.playerModel = playerModel;
    }

    @Test public function should_reset_score_in_model():Void {
        startNewGameCommand.execute();
        playerModel.resetScores().verify(1);
    }

    @Test public function should_update_available_views():Void {
        startNewGameCommand.execute();
        playerView.setScore(0).verify(3);
    }
}