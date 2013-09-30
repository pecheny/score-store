package commands;

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
import commands.AddPlayerCommand;
using mockatoo.Mockatoo;

class AddPlayerCommandTest {
    var addPlayerCommand:AddPlayerCommand;
    var view:PlayerView;
    var playerViewsModel:PlayerViewsModel;
    var playerModel:PlayerModel;
    var appView:ApplicationView;
    var playerId:PlayerId;
    private var updateLayoutSignal:UpdateLayoutSignal;

    @Before
    public function setup():Void {
        addPlayerCommand = new AddPlayerCommand();
        playerModel = mock(PlayerModel);
        playerId = PlayerId.fromInt(1);
        playerViewsModel = mock(PlayerViewsModel);
        updateLayoutSignal = mock(UpdateLayoutSignal);
        view = mock(PlayerView);
        var factory:PlayerViewFactory = mock(PlayerViewFactory);
        factory.getView().returns(view);
        appView = mock(ApplicationView);
        addPlayerCommand.playersModel = playerModel;
        addPlayerCommand.playerViewsModel = playerViewsModel;
        addPlayerCommand.viewFactory = factory;
        addPlayerCommand.appView = appView;
        addPlayerCommand.updateLayoutSignal = updateLayoutSignal;
        addPlayerCommand.playerId = playerId;
    }

    @Test
    public function command_should_call_addPlayer():Void {
        addPlayerCommand.execute();
        playerModel.enablePlayer(playerId).verify(1);
    }

    @Test
    public function should_create_view_and_add_to_model():Void {
        addPlayerCommand.execute();
        playerViewsModel.addView(playerId, view).verify(1);
    }

    @Test
    public function should_add_view_to_stage():Void {
        addPlayerCommand.execute();
        appView.addChild(view).verify(1);
    }

    @Test
    public function should_set_playerId_to_view():Void {
        addPlayerCommand.execute();
        view.setPlayerId(playerId).verify(1);
    }

    @Test public function should_dispatch_update_layout():Void {
        addPlayerCommand.execute();
        updateLayoutSignal.dispatch().verify(1);
    }


}

