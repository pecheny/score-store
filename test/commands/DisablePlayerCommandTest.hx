package commands;

import signals.UpdateLayoutSignal;
import massive.munit.async.AsyncFactory;
import massive.munit.Assert;
import signals.RemoveChildSignal;
import flash.display.DisplayObject;
import haxe.Timer;
import mockatoo.Mockatoo.Matcher;
import model.PlayerViewsModel;
import view.PlayerView;
import model.vo.PlayerId;
import mockatoo.Mockatoo.* ;
import model.PlayerModel;
using mockatoo.Mockatoo;

class DisablePlayerCommandTest {


    var removePlayerCommand:DisablePlayerCommand;
    var view:PlayerView;
    var playerViewsModel:PlayerViewsModel;
    var playerModel:PlayerModel;

    var callsCounter:Int;
    var passedChild:DisplayObject;
    var timer:Timer;

    @Before
    public function setup():Void {
        removePlayerCommand = new DisablePlayerCommand();
        removePlayerCommand.playerId = PlayerId.fromInt(1);
        view = mock(PlayerView);
        playerModel = mock(PlayerModel);
        playerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.getPlayerView(cast Matcher.any).returns(view);
        removePlayerCommand.playersModel = playerModel;
        removePlayerCommand.playerViewsModel = playerViewsModel;
        removePlayerCommand.removeChildSignal = new RemoveChildSignal();
        removePlayerCommand.updateLayoutSignal = new UpdateLayoutSignal();

        callsCounter = 0;
        passedChild = null;
    }

    @Test
    public function command_should_call_removePlayer():Void {
        removePlayerCommand.execute();
        playerModel.disablePlayer(PlayerId.fromInt(1)).verify(1);
    }

    @AsyncTest public function command_should_call_removeChild(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, commandShouldCallRemovechildHandler, 300);
        timer = Timer.delay(handler, 200);
        removePlayerCommand.removeChildSignal.add(function(child):Void {
            callsCounter++;
            passedChild = child;
        });
        removePlayerCommand.execute();
    }

    function commandShouldCallRemovechildHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(view, passedChild);
    }

    @Test
    public function command_should_remove_view_from_model():Void {
        removePlayerCommand.execute();
        playerViewsModel.removePlayerView(PlayerId.fromInt(1)).verify(1);
    }
}

