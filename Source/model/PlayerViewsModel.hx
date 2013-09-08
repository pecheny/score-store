package model;
import view.PlayerView;
class PlayerViewsModel {

    private var views:Map<Int, PlayerView>;

    public function new():Void {
        views = new Map<Int, PlayerView>();
    }

    public function addView(id:Int, view:PlayerView):Void {
        if (hasView(id)) {
            throw "PlayerViewsModel already has player with given id: " + id;
        }
        views[id] = view;
    }

    public function removeView(id:Int):PlayerView {
        if (!hasView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = views[id];
        views.remove(id);
        return view;
    }

    public function getView(id:Int):PlayerView {
        if (!hasView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = views[id];
        return view;
    }

    public function hasView(id:Int):Bool {
        return views.exists(id);
    }

}