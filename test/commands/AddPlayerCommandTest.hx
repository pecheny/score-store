package commands;

import mockatoo.Mockatoo;
import mockatoo.Mockatoo.*;
import model.PlayerModel;
import commands.AddPlayerCommand;

using mockatoo.Mockatoo;

class AddPlayerCommandTest {
    var instance:AddPlayerCommand;

    public function new() {

    }


    @Before
    public function setup():Void {
        instance = new AddPlayerCommand();
    }


    @Test
    public function command_should_call_addPlayer():Void {
        var playerModel = mock(PlayerModel);
        instance.playersModel = playerModel;
        instance.execute();
        playerModel.addPlayer().verify(1);
    }
}