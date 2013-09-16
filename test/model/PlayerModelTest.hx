package model;

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
    public function should_create_player():Void {
        var playerId:PlayerId = playerModel.addPlayer();
        Assert.isTrue(playerModel.hasPLayer(playerId));
    }

    @Test
    public function should_add_score_for_player():Void {
        var playerId:PlayerId = playerModel.addPlayer();
        playerModel.changeScore(playerId, 1);
        Assert.areEqual(1, playerModel.getScore(playerId));
    }

    @Test
    public function should_remove_score_from_player():Void {
        var playerId:PlayerId = playerModel.addPlayer();
        playerModel.changeScore(playerId, 5);
        playerModel.changeScore(playerId, -2);
        Assert.areEqual(3, playerModel.getScore(playerId));
    }

    @Test
    public function created_player_should_have_zero_score():Void {
        var playerId:PlayerId = playerModel.addPlayer();
        Assert.areEqual(0, playerModel.getScore(playerId));

        playerModel.changeScore(playerId, 1);
        playerModel.removePlayer(playerId);
        playerId = playerModel.addPlayer();
        Assert.areEqual(0, playerModel.getScore(playerId));
    }


    @Test
    public function should_remove_player():Void {
        var playerId:PlayerId = playerModel.addPlayer();
        playerModel.removePlayer(playerId);
        Assert.isFalse(playerModel.hasPLayer(playerId));
    }

    @Test
    public function should_reuse_free_id():Void {
        var player1Id:PlayerId = playerModel.addPlayer();
        var player2Id:PlayerId = playerModel.addPlayer();
        playerModel.removePlayer(player1Id);
        var player3Id:PlayerId = playerModel.addPlayer();
        Assert.areEqual(player1Id, player3Id);
    }

    @Test
    public function should_return_players():Void {
        for (i in 1...14) {
            playerModel.addPlayer();
        }
        assertThat(playerModel.getPlayers(), arrayWithSize(equalTo(13)));

        playerModel.removePlayer(PlayerId.fromInt(1));
        playerModel.removePlayer(PlayerId.fromInt(5));
        playerModel.removePlayer(PlayerId.fromInt(6));
        playerModel.removePlayer(PlayerId.fromInt(13));
        var playerIds:Array<PlayerId> = playerModel.getPlayers();
        assertThat(playerIds, arrayWithSize(equalTo(9)));
        assertThat(playerIds, arrayContainingInAnyOrder(PlayerId.fromInt(2), PlayerId.fromInt(3), PlayerId.fromInt(4), PlayerId.fromInt(7), PlayerId.fromInt(8), PlayerId.fromInt(9), PlayerId.fromInt(10), PlayerId.fromInt(11), PlayerId.fromInt(12)));
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
            playerModel.removePlayer(PlayerId.fromInt(1));
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "There is no player with given id: 1");
    }

    @Test
    public function should_throw_exception_on_reaching_players_limit():Void {
        var msg:String = "";
        try {
            for (i in 1...PlayerId.MAX_PLAYERS + 1) {
                playerModel.addPlayer();
            }
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, "Players limit reached");
    }


}