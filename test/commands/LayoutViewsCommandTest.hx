package commands;

import view.ApplicationView;
import view.ViewBase;
import model.ButtonBarContainerModel;
import constants.PlayerViewStyle;
import massive.munit.Assert;
import model.vo.PlayerId;
import view.PlayerView;
import mockatoo.Mockatoo;
import model.PlayerViewsModel;
import mockatoo.Mockatoo.* ;
import model.PlayerModel;
using mockatoo.Mockatoo;

class LayoutViewsCommandTest {
    var layoutViewsCommand:LayoutViewsCommand;
    var playerView:PlayerView;
    var playerViewsModel:PlayerViewsModel;
    var playerModel:PlayerModel;
    var buttonBarContainerModel:ButtonBarContainerModel;

    @Before
    public function setup():Void {
        layoutViewsCommand = new LayoutViewsCommand();
        playerView = new PlayerView();
        playerView.initBounds(100, 200, 0);

        playerModel = mock(PlayerModel);

        playerViewsModel = mock(PlayerViewsModel);
        playerViewsModel.getPlayerView(cast Matcher.any).returns(playerView);

        buttonBarContainerModel = mock(ButtonBarContainerModel);
        buttonBarContainerModel.butonBarContainer = mock(ViewBase);

        layoutViewsCommand.playersModel = playerModel;
        layoutViewsCommand.playerViewsModel = playerViewsModel;
        layoutViewsCommand.buttonBarContainerModel = buttonBarContainerModel;
        layoutViewsCommand.applicationView = mock(ApplicationView);
        layoutViewsCommand.applicationView = mock(ApplicationView);
        layoutViewsCommand.applicationView.getStageHeight().returns(800);
        layoutViewsCommand.applicationView.getScale().returns(1.67);

    }

    @Test
    public function should_set_y_to_top_view_according_to_grid_size():Void {
        var players:Array<PlayerId> = [PlayerId.fromInt(1)];
        playerModel.getPlayers().returns(players);
        layoutViewsCommand.execute();
        Assert.areEqual(playerView.y, PlayerViewStyle.GRID_STEP);
    }

    @Test
    public function should_set_y_to_third_view_according_to_grid_size():Void {
        var players:Array<PlayerId> = [PlayerId.fromInt(1), PlayerId.fromInt(3), PlayerId.fromInt(4)];//new Array<PlayerId>();
        playerModel.getPlayers().returns(players);
        layoutViewsCommand.execute();
        Assert.areEqual(playerView.y, 400 + 3 * PlayerViewStyle.GRID_STEP);
    }


}

