package view;
import model.vo.PlayerId;
class PlayerEditorView extends ViewBase {
    public var id(default, null):PlayerId;

    function new() {
        super();
    }

    static public inline function fromPlayerId(id:PlayerId):PlayerEditorView {
        var pev:PlayerEditorView = new PlayerEditorView();
        pev.id = id;
        return pev;
    }
}