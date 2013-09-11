package commands;

import model.vo.PlayerId;
import mockatoo.Mockatoo.* ;
import model.PlayerModel;
import signals.ChangeScoreSignal;
using mockatoo.Mockatoo;

class ChangeScoreCommandTest {
    var changeScoreCommand:ChangeScoreCommand;

    @Before
    public function setup():Void {
        changeScoreCommand = new ChangeScoreCommand();
    }

    @Test
    public function command_should_call_changeScore():Void {
        var playerModel = mock(PlayerModel);
        var signal = new ChangeScoreSignal();
        changeScoreCommand.playerId = PlayerId.fromInt(1);
        changeScoreCommand.deltaScore = 2;
        changeScoreCommand.playersModel = playerModel;
        changeScoreCommand.mySignal = signal;
        changeScoreCommand.execute();
        playerModel.changeScore(PlayerId.fromInt(1), 2).verify(1);
    }
}