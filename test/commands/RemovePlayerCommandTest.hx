package commands;

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
    }

    @Test
    public function command_should_call_removePlayer():Void {
        removePlayerCommand.execute();
        playerModel.removePlayer(PlayerId.fromInt(1)).verify(1);
    }

    @Test
    public function command_should_call_removeChild():Void {
        removePlayerCommand.execute();
        appView.removeChild(view).verify(1);
    }

    @Test
    public function command_should_remove_view_from_model():Void {
        removePlayerCommand.execute();
        playerViewsModel.removeView(PlayerId.fromInt(1)).verify(1);
    }
}