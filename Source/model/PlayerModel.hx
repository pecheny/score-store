package model;
import model.vo.PlayerId;
import model.vo.PlayerId;
import model.vo.PlayerId;
class PlayerModel {
    private var scores:Array<Int>;
    private var activePlayers:Array<Int>;

    public function new() {
        scores = new Array<Int>();
        activePlayers = new Array<Int>();
    }

    public function addPlayer():PlayerId {
        var newId:Int = getFreeId();
        activePlayers.push(newId);
        scores[newId] = 0;
        return PlayerId.fromInt(newId);
    }

    private function getFreeId():Int {
        if (activePlayers.length <= PlayerId.MAX_PLAYERS) {
            for (i in 1...PlayerId.MAX_PLAYERS) {
                if (!Lambda.has(activePlayers, i)) {
                    return i;
                }
            }
        }
        throw "Players limit reached";
        return -1;
    }

    public function removePlayer(id:PlayerId):Void {
        if (!hasPLayer(id)) {
            throw "There is no player with given id: " + id;
        }
        activePlayers.remove(id.toInt());
        scores[id.toInt()] = 0;
    }

    public function changeScore(playerId:PlayerId, deltaScore:Int):Void {
        if (hasPLayer(playerId)) {
            scores[playerId.toInt()] += deltaScore;
            return;
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getScore(playerId:PlayerId):Int {
        if (hasPLayer(playerId)) {
            return scores[playerId.toInt()];
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getPlayers():Array<PlayerId> {
        var val:Array<PlayerId> = new Array<PlayerId>();
        for (id in activePlayers.iterator()) {
            val.push(PlayerId.fromInt(id));
        }
         return val;
    }

    public function hasPLayer(playerId:PlayerId):Bool {
        return Lambda.has(activePlayers, playerId.toInt());
    }

}