package view;
import view.PlayerView;
class PlayerViewFactory {
    public function new():Void {

    }

    public function getView():PlayerView {
        return new PlayerView();
    }
}