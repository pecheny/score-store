/*
 * Created by IntelliJ IDEA.
 * User: shoo
 * Date: 9/7/13
 * Time: 12:21 PM
 */
package model;
import flash.Vector;
class PlayerModel {

    public function new() {}

    public function addPlayer():Int {
        return 0;
    }

    public function removePlayer(id:Int):Void {}

    public function addScore(playerId:Int, deltaScore:Int):Void {}

    public function getScore(playerId:Int):Int {
        return 0;
    }

    public function getPlayers():Vector<Int> {
        return null;
    }

    public function hasPLayer(playerId:Int):Bool {
        return false;
    }

}