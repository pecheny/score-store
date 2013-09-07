package model;
class PlayerModel {
    static inline var MAX_PLAYERS:Int = 100;
    private var scores:Array<Int>;
    private var activePlayers:Array<Int>;

    public function new() {
        scores = new Array<Int>();
        activePlayers = new Array<Int>();
    }

    public function addPlayer():Int {
        var newId:Int = getFreeId();
        activePlayers.push(newId);
        scores[newId] = 0;
        return newId;
    }

    private function getFreeId():Int {
        if (activePlayers.length <= MAX_PLAYERS) {
            for (i in 1...MAX_PLAYERS) {
                if (!Lambda.has(activePlayers, i)) {
                    return i;
                }
            }
        }
        throw "Players limit reached";
        return -1;
    }

    public function removePlayer(id:Int):Void {
        if (!hasPLayer(id)) {
            throw "There is no player with given id: " + id;
        }
        activePlayers.remove(id);
        scores[id] = 0;
    }

    public function addScore(playerId:Int, deltaScore:Int):Void {
        if (hasPLayer(playerId)) {
            scores[playerId] += deltaScore;
            return;
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getScore(playerId:Int):Int {
        if (hasPLayer(playerId)) {
            return scores[playerId];
        }
        throw "There is no player with given id: " + playerId;
    }

    public function getPlayers():Array<Int> {
        return activePlayers.copy();
    }

    public function hasPLayer(playerId:Int):Bool {
        return Lambda.has(activePlayers, playerId);
    }

}