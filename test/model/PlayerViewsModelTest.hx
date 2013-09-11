package model;

import model.vo.PlayerId;
import view.PlayerView;
import org.hamcrest.MatcherAssert;
import massive.munit.Assert;
using org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;

class PlayerViewsModelTest {
    var playerViewsModel:PlayerViewsModel;

    @Before
    public function setup():Void {
        playerViewsModel = new PlayerViewsModel();
    }


    @Test
    public function should_add_players_view():Void {
        var view = mock(PlayerView);
        playerViewsModel.addView(PlayerId.fromInt(1), view);
        Assert.isTrue(playerViewsModel.hasView(PlayerId.fromInt(1)));
    }

    @Test
    public function shouldnt_add_players_view_with_existing_id():Void {
        var view = mock(PlayerView);
        playerViewsModel.addView(PlayerId.fromInt(1), view);
        var msg:String = "";
        try {
            playerViewsModel.addView(PlayerId.fromInt(1), view);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "PlayerViewsModel already has player with given id: 1");
    }

    @Test
    public function should_remove_view():Void {
        var view = mock(PlayerView);
        playerViewsModel.addView(PlayerId.fromInt(1), view);
        Assert.isTrue(playerViewsModel.hasView(PlayerId.fromInt(1)));
        var removedView = playerViewsModel.removeView(PlayerId.fromInt(1));
        Assert.isTrue(!playerViewsModel.hasView(PlayerId.fromInt(1)));
        Assert.areEqual(view, removedView);
    }

    @Test
    public function should_return_view():Void {
        var view = mock(PlayerView);
        playerViewsModel.addView(PlayerId.fromInt(1), view);
        Assert.areEqual(view, playerViewsModel.getView(PlayerId.fromInt(1)));
    }

    @Test
    public function shouldnt_return_not_existing_view():Void {
        var msg:String = "";
        try {
            playerViewsModel.getView(PlayerId.fromInt(1));
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "PlayerViewsModel doesn't have player with given id: 1");
    }

}