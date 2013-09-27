package view;
import model.vo.PlayerId;
class ScoreInputView extends ViewBase {
    public var id(default, null):PlayerId;

    function new() {
        super();
    }

    static public inline function fromPlayerId(id:PlayerId):ScoreInputView {
        var pev:ScoreInputView = new ScoreInputView();
        pev.id = id;
        return pev;
    }
}