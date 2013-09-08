package commands;

import mockatoo.Mockatoo.* ;
import signals.RemovePlayerSignal;
import model.PlayerModel;
using mockatoo.Mockatoo;

class RemovePlayerCommandTest {
    var removePlayerCommand:RemovePlayerCommand;

    @Before
    public function setup():Void {
        removePlayerCommand = new RemovePlayerCommand();
    }

    @Test
    public function command_should_call_removePlayer():Void {
        var playerModel = mock(PlayerModel);
        var signal = new RemovePlayerSignal();
        signal.playerId = 1;
        removePlayerCommand.playersModel = playerModel;
        removePlayerCommand.mySignal = signal;
        removePlayerCommand.execute();
        playerModel.removePlayer(1).verify(1);
    }
}