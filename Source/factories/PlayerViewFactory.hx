package factories;
import view.ScoreInputView;
import view.ModalBackgroundView;
import view.ScrollerBackgroundView;
import view.PlayerSwitcherView;
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

    public function getPlayerSwitcher(id:PlayerId):PlayerSwitcherView {
        var switcher = new PlayerSwitcherView();
        switcher.playerId = id;
        return switcher;
    }

    public function getScrollerBackground():ScrollerBackgroundView {
        return new ScrollerBackgroundView();
    }

    public function grtModalBackground():ModalBackgroundView {
        return new ModalBackgroundView();
    }

    public function getScoreInput(id:PlayerId):ScoreInputView {
        var scoreInput = new ScoreInputView();
        scoreInput.id = id;
        return scoreInput;
    }

}