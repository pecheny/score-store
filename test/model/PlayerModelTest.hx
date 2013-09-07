package model;

import massive.munit.util.Timer;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import model.PlayerModel;

class PlayerModelTest {
    var instance:PlayerModel;

    @Before
    public function setup():Void {
        instance = new PlayerModel();
    }


    @Test
    public function should_create_player():Void {
        var playerId:Int = instance.addPlayer();
        Assert.isTrue(instance.hasPLayer(playerId));
    }

    @Test
    public function created_player_should_have_zero_score():Void {
    }

    @Test
    public function should_add_score_for_player():Void {
    }

    @Test
    public function should_remove_score_from_player():Void {
    }

    @Test
    public function should_create_player_with_unique_id():Void {
    }

    @Test
    public function should_remove_player():Void {
    }

    @Test
    public function should_reuse_free_id():Void {
    }


}