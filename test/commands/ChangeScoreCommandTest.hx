package commands;

import mockatoo.Mockatoo.Matcher;
import view.PlayerView;
import model.PlayerViewsModel;
import model.vo.PlayerId;
import mockatoo.Mockatoo.
* ;
import model.PlayerModel;
import signals.ChangeScoreSignal;
using mockatoo.Mockatoo;

class ChangeScoreCommandTest {
    var changeScoreCommand:ChangeScoreCommand;
    var view:PlayerView;
    var playerModel:PlayerModel;
    var playerViewsModel:PlayerViewsModel;

    @Before
    public function setup():Void {
        changeScoreCommand = new ChangeScoreCommand();
        view = mock(PlayerView);
        playerModel = mock(PlayerModel);
        playerModel.getScore(cast Matcher.any).returns(2);
        playerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.getPlayerView(cast Matcher.any).returns(view);
        changeScoreCommand.playerId = PlayerId.fromInt(1);
        changeScoreCommand.deltaScore = 2;
        changeScoreCommand.playersModel = playerModel;
        changeScoreCommand.playerViewsModel = playerViewsModel;
    }

    @Test
    public function command_should_call_changeScore():Void {
        changeScoreCommand.execute();
        playerModel.changeScore(PlayerId.fromInt(1), 2).verify(1);
    }

    @Test
      public function command_should_update_view():Void {
          changeScoreCommand.execute();
          view.setScore(2).verify(1);
      }

}