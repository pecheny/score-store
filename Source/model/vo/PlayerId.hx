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
        return instances[s];
    }

    @:to public inline function toInt():Int {return value;}

    @:to public inline function toString():String {return "" + value;}

}