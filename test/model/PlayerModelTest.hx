package model;

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
        var playerId:Int = playerModel.addPlayer();
        Assert.isTrue(playerModel.hasPLayer(playerId));
    }

    @Test
    public function should_add_score_for_player():Void {
        var playerId:Int = playerModel.addPlayer();
        playerModel.addScore(playerId, 1);
        Assert.areEqual(1, playerModel.getScore(playerId));
    }

    @Test
    public function should_remove_score_from_player():Void {
        var playerId:Int = playerModel.addPlayer();
        playerModel.addScore(playerId, 5);
        playerModel.addScore(playerId, -2);
        Assert.areEqual(3, playerModel.getScore(playerId));
    }

    @Test
    public function created_player_should_have_zero_score():Void {
        var playerId:Int = playerModel.addPlayer();
        Assert.areEqual(0, playerModel.getScore(playerId));

        playerModel.addScore(playerId, 1);
        playerModel.removePlayer(playerId);
        playerId = playerModel.addPlayer();
        Assert.areEqual(0, playerModel.getScore(playerId));
    }


    @Test
    public function should_remove_player():Void {
        var playerId:Int = playerModel.addPlayer();
        playerModel.removePlayer(playerId);
        Assert.isFalse(playerModel.hasPLayer(playerId));
    }

    @Test
    public function should_reuse_free_id():Void {
        var player1Id:Int = playerModel.addPlayer();
        var player2Id:Int = playerModel.addPlayer();
        playerModel.removePlayer(player1Id);
        var player3Id:Int = playerModel.addPlayer();
        Assert.areEqual(player1Id, player3Id);
    }

    @Test
    public function should_return_players():Void {
        for (i in 1...14) {
            playerModel.addPlayer();
        }
        assertThat(playerModel.getPlayers(), arrayWithSize(equalTo(13)));

        playerModel.removePlayer(1);
        playerModel.removePlayer(5);
        playerModel.removePlayer(6);
        playerModel.removePlayer(13);
        var playerIds:Array<Int> = playerModel.getPlayers();
        assertThat(playerIds, arrayWithSize(equalTo(9)));
        assertThat(playerIds, arrayContainingInAnyOrder(2, 3, 4, 7, 8, 9, 10, 11, 12));
    }
}