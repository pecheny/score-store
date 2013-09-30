package model;
import model.vo.PlayerId;
import model.vo.PlayerId;
import model.vo.PlayerId;
class PlayerModel {
    private var scores:Map<PlayerId, Int>;
    private var activePlayers:Array<PlayerId>;

    public function new() {
        scores = new Map<PlayerId, Int>();
        activePlayers = new Array<PlayerId>();
    }

    public function enablePlayer(id:PlayerId):Void {
        if (hasPLayer(id)) {
            throw "Player " + id + " has beed enabled already";
        }
        activePlayers.push(id);
        if (!scores.exists(id)) {
            scores[id] = 0;
        }
    }


    public function disablePlayer(id:PlayerId):Void {
        if (!hasPLayer(id)) {
            throw "There is no player with given id: " + id;
        }
        activePlayers.remove(id);
    }

    public function changeScore(playerId:PlayerId, deltaScore:Int):Void {
        if (hasPLayer(playerId)) {
            scores[playerId] += deltaScore;
            return;
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getScore(playerId:PlayerId):Int {
        if (hasPLayer(playerId)) {
            return scores[playerId];
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getPlayers():Array<PlayerId> {
        return activePlayers.copy();
    }

    public function hasPLayer(playerId:PlayerId):Bool {
        return Lambda.has(activePlayers, playerId);
    }

}