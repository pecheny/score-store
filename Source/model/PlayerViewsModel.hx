package model;
import model.vo.PlayerId;
import view.PlayerView;
class PlayerViewsModel {

    private var views:Map<PlayerId, PlayerView>;

    public function new():Void {
        views = new Map<PlayerId, PlayerView>();
    }

    public function addView(id:PlayerId, view:PlayerView):Void {
        if (hasView(id)) {
            throw "PlayerViewsModel already has player with given id: " + id;
        }
        views[id] = view;
    }

    public function removeView(id:PlayerId):PlayerView {
        if (!hasView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = views[id];
        views.remove(id);
        return view;
    }

    public function getView(id:PlayerId):PlayerView {
        if (!hasView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = views[id];
        return view;
    }

    public function hasView(id:PlayerId):Bool {
        return views.exists(id);
    }

}