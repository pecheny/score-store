package model;

import model.vo.PlayerId;
import model.vo.PlayerId;
import org.hamcrest.MatchersBase;
import org.hamcrest.MatcherAssert;
import massive.munit.Assert;
import model.PlayerModel;
using org.hamcrest.MatcherAssert;

class PlayerModelTest extends MatchersBase {
    var playerModel:PlayerModel;

    @Before
    public function setup():Void {
        playerModel = new PlayerModel();
    }


    @Test
    public function should_enable_player():Void {
        var playerId:PlayerId = PlayerId.fromInt(1);
        playerModel.enablePlayer(playerId);
        Assert.isTrue(playerModel.hasPLayer(playerId));
    }

    @Test
    public function should_add_score_for_player():Void {
        var playerId:PlayerId = PlayerId.fromInt(1);
        playerModel.enablePlayer(playerId);
        playerModel.changeScore(playerId, 1);
        Assert.areEqual(1, playerModel.getScore(playerId));
    }

    @Test
    public function should_remove_score_from_player():Void {
        var playerId:PlayerId = PlayerId.fromInt(1);
        playerModel.enablePlayer(playerId);
        playerModel.changeScore(playerId, 5);
        playerModel.changeScore(playerId, -2);
        Assert.areEqual(3, playerModel.getScore(playerId));
    }

    @Test public function should_not_drop_players_score():Void {
        var playerId:PlayerId = PlayerId.fromInt(1);
        playerModel.enablePlayer(playerId);
        playerModel.changeScore(playerId, 4);
        playerModel.disablePlayer(playerId);
        playerModel.enablePlayer(playerId);
        Assert.areEqual(4, playerModel.getScore(playerId));
    }


    @Test
    public function should_disable_player():Void {
        var playerId:PlayerId = PlayerId.fromInt(1);
        playerModel.enablePlayer(playerId);
        playerModel.disablePlayer(playerId);
        Assert.isFalse(playerModel.hasPLayer(playerId));
    }


    @Test
    public function should_return_players():Void {
        for (i in 1...9) {
            var playerId:PlayerId = PlayerId.fromInt(i);
            playerModel.enablePlayer(playerId);
        }
        assertThat(playerModel.getPlayers(), arrayWithSize(equalTo(8)));

        playerModel.disablePlayer(PlayerId.fromInt(1));
        playerModel.disablePlayer(PlayerId.fromInt(5));
        playerModel.disablePlayer(PlayerId.fromInt(6));
        var playerIds:Array<PlayerId> = playerModel.getPlayers();
        assertThat(playerIds, arrayWithSize(equalTo(5)));
        assertThat(playerIds, arrayContainingInAnyOrder(PlayerId.fromInt(2), PlayerId.fromInt(3), PlayerId.fromInt(4), PlayerId.fromInt(7), PlayerId.fromInt(8)));
    }

    @Test
    public function should_throw_exception_on_getting_unexistent_score():Void {
        var msg:String = "";
        try {
            playerModel.getScore(PlayerId.fromInt(1));
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "There is no player with given id: 1");
    }

    @Test
    public function should_throw_exception_on_adding_unexistent_score():Void {
        var msg:String = "";
        try {
            playerModel.changeScore(PlayerId.fromInt(1), 1);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "There is no player with given id: 1");
    }

    @Test
    public function should_throw_exception_on_removing_unexistent_player():Void {
        var msg:String = "";
        try {
            playerModel.disablePlayer(PlayerId.fromInt(1));
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "There is no player with given id: 1");
    }

    @Test
    public function should_throw_exception_on_double_enable():Void {
        var msg:String = "";
        try {
            var playerId:PlayerId = PlayerId.fromInt(1);
            playerModel.enablePlayer(playerId);
            playerModel.enablePlayer(playerId);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "Player 1 has beed enabled already");
    }


}