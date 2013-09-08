package commands;

import mockatoo.Mockatoo;
import mockatoo.Mockatoo.*;
import signals.RemovePlayerSignal;
import model.PlayerModel;
using mockatoo.Mockatoo;

class RemovePlayerCommandTest {
    var instance:RemovePlayerCommand;

    public function new() {

    }


    @Before
     public function setup():Void {
         instance = new RemovePlayerCommand();
     }


     @Test
     public function command_should_call_addPlayer():Void {
         var playerModel = mock(PlayerModel);
//         var signal = mock(RemovePlayerSignal);
//         signal.playerId.returns(1);
//
//         instance.playersModel = playerModel;
//         instance.mySignal = signal;
//         instance.execute();
//         playerModel.removePlayer(1).verify(1);
     }
}