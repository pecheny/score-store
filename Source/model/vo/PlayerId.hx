package model.vo;
class PlayerId {
    public static inline var MAX_PLAYERS:Int = 24;
    var value:Int;
    static var instances:Array<PlayerId> = {
    var array = new Array<PlayerId>();
        for (i in 1...MAX_PLAYERS + 1) {
            array[i] = new PlayerId(i);
        }
    array;
    };
    function new(a:Int) { value = a;}

    @:from static public inline function fromInt(s:Int) {
        if (s < 1 || s > MAX_PLAYERS) {
            throw "PlayerId should be in range 1.." + MAX_PLAYERS + " when got " + s;
        }
        return instances[s];
    }

    @:to public inline function toInt():Int {return value;}

    @:to public inline function toString():String {return "" + value;}

}