package commands;

import massive.munit.async.AsyncFactory;
import massive.munit.Assert;
import signals.RemoveChildSignal;
import flash.display.DisplayObject;
import haxe.Timer;
import mockatoo.Mockatoo.Matcher;
import view.ApplicationView;
import model.PlayerViewsModel;
import view.PlayerView;
import model.vo.PlayerId;
import mockatoo.Mockatoo.
* ;
import model.PlayerModel;
using mockatoo.Mockatoo;

class RemovePlayerCommandTest {


    var removePlayerCommand:RemovePlayerCommand;
    var view:PlayerView;
    var playerViewsModel:PlayerViewsModel;
    var playerModel:PlayerModel;
    var appView:ApplicationView;

    var callsCounter:Int;
    var passedChild:DisplayObject;
    var timer:Timer;

    @Before
    public function setup():Void {
        removePlayerCommand = new RemovePlayerCommand();
        removePlayerCommand.playerId = PlayerId.fromInt(1);
        view = mock(PlayerView);
        playerModel = mock(PlayerModel);
        playerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.getView(cast Matcher.any).returns(view);
        appView = mock(ApplicationView);
        removePlayerCommand.playersModel = playerModel;
        removePlayerCommand.playerViewsModel = playerViewsModel;
        removePlayerCommand.appView = appView;
        removePlayerCommand.removeChildSignal = new RemoveChildSignal();

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
        playerViewsModel.removeView(PlayerId.fromInt(1)).verify(1);
    }
}

