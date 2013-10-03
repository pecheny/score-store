package commands;

import massive.munit.Assert;
import signals.AddChildSignal;
import constants.LayerName;
import flash.display.DisplayObject;
import haxe.Timer;
import massive.munit.async.AsyncFactory;
import signals.UpdateLayoutSignal;
import model.vo.PlayerId;
import view.ApplicationView;
import view.PlayerView;
import factories.PlayerViewFactory;
import mockatoo.Mockatoo;
import model.PlayerViewsModel;
import mockatoo.Mockatoo.
* ;
import model.PlayerModel;
import commands.EnablePlayerCommand;
using mockatoo.Mockatoo;

class EnablePlayerCommandTest {
    var addPlayerCommand:EnablePlayerCommand;
    var playerView:PlayerView;
    var playerViewsModel:PlayerViewsModel;
    var playerModel:PlayerModel;
    var appView:ApplicationView;
    var playerId:PlayerId;
    private var updateLayoutSignal:UpdateLayoutSignal;

    var callsCounter:Int;
    var passedName:String;
    var passedChild:DisplayObject;

    var timer:Timer;

    @Before
    public function setup():Void {
        addPlayerCommand = new EnablePlayerCommand();
        playerModel = mock(PlayerModel);
        playerId = PlayerId.fromInt(1);
        playerViewsModel = mock(PlayerViewsModel);
        updateLayoutSignal = mock(UpdateLayoutSignal);
        playerView = mock(PlayerView);
        var factory:PlayerViewFactory = mock(PlayerViewFactory);
        factory.getView().returns(playerView);
        appView = mock(ApplicationView);
        addPlayerCommand.playersModel = playerModel;
        addPlayerCommand.playerViewsModel = playerViewsModel;
        addPlayerCommand.viewFactory = factory;
        addPlayerCommand.appView = appView;
        addPlayerCommand.updateLayoutSignal = updateLayoutSignal;
        addPlayerCommand.playerId = playerId;
        addPlayerCommand.addChildSignal = new AddChildSignal();

        callsCounter = 0;
        passedName = "";
        passedChild = null;
    }

    @Test
    public function command_should_call_addPlayer():Void {
        addPlayerCommand.execute();
        playerModel.enablePlayer(playerId).verify(1);
    }

    @Test
    public function should_create_view_and_add_to_model():Void {
        addPlayerCommand.execute();
        playerViewsModel.addPlayerView(playerId, playerView).verify(1);
    }


    @AsyncTest public function should_add_view_to_stage(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldAddViewToStageHandler, 300);
        timer = Timer.delay(handler, 200);
        addPlayerCommand.addChildSignal.add(function(name, child):Void {
            callsCounter++;
            passedChild = child;
            passedName = name;
        });
        addPlayerCommand.execute();

    }

    function shouldAddViewToStageHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(LayerName.MAIN, passedName);
        Assert.areEqual(playerView, passedChild);
    }

    @Test
    public function should_set_playerId_to_view():Void {
        addPlayerCommand.execute();
        playerView.setPlayerId(playerId).verify(1);
    }

    @Test public function should_dispatch_update_layout():Void {
        addPlayerCommand.execute();
        updateLayoutSignal.dispatch().verify(1);
    }

    @Test public function should_set_score_to_added_view():Void {
        playerModel.getScore(cast Matcher.any).returns(4);
        addPlayerCommand.execute();
        playerView.setText("4").verify(1);
    }


}

