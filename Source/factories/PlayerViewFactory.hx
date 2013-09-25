package factories;
import model.vo.PlayerId;
import view.PlayerEditorView;
import view.PlayerView;
class PlayerViewFactory {
    public function new():Void {

    }

    public function getView():PlayerView {
        return new PlayerView();
    }

    public function getEditorView(id:PlayerId):PlayerEditorView {
        return PlayerEditorView.fromPlayerId(id);
    }
}