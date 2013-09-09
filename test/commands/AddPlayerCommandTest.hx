package commands;

import view.ApplicationView;
import view.PlayerView;
import model.PlayerViewFactory;
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

    @Before
    public function setup():Void {
        addPlayerCommand = new AddPlayerCommand();

        playerModel = mock(PlayerModel);
        playerModel.addPlayer().returns(1);
        playerViewsModel = mock(PlayerViewsModel);
        view = mock(PlayerView);
        var factory:PlayerViewFactory = mock(PlayerViewFactory);
        factory.getView().returns(view);
        appView = mock(ApplicationView);

        addPlayerCommand.playersModel = playerModel;
        addPlayerCommand.playerViewsModel = playerViewsModel;
        addPlayerCommand.viewFactory = factory;
        addPlayerCommand.appView = appView;
    }

    @Test
    public function command_should_call_addPlayer():Void {
        addPlayerCommand.execute();
        playerModel.addPlayer().verify(1);
    }

    @Test
    public function should_create_view_and_add_to_model():Void {
        addPlayerCommand.execute();
        playerViewsModel.addView(1, view).verify(1);
    }

    @Test
    public function should_add_view_to_stage():Void {
        addPlayerCommand.execute();
        appView.addChild(view).verify(1);
    }
}