package commands;

import mockatoo.Mockatoo.*;
import model.PlayerModel;
import commands.AddPlayerCommand;
using mockatoo.Mockatoo;

class AddPlayerCommandTest {
    var addPlayerCommand:AddPlayerCommand;

    @Before
    public function setup():Void {
        addPlayerCommand = new AddPlayerCommand();
    }

    @Test
    public function command_should_call_addPlayer():Void {
        var playerModel = mock(PlayerModel);
        addPlayerCommand.playersModel = playerModel;
        addPlayerCommand.execute();
        playerModel.addPlayer().verify(1);
    }
}