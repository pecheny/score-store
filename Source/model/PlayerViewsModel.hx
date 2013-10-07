package model;
import view.ApplicationView;
import constants.PlayerViewStyle;
import Lambda;
import flash.display.DisplayObject;
import model.vo.PlayerId;
import view.PlayerView;
class PlayerViewsModel {

    private var playerViews:Map<PlayerId, PlayerView>;
    private var customViews:Map<String, DisplayObject>;
    @inject public var applicationView:ApplicationView;

    public function new():Void {
        playerViews = new Map<PlayerId, PlayerView>();
        customViews = new Map<String, DisplayObject>();
    }

    public function addPlayerView(id:PlayerId, view:PlayerView):Void {
        if (hasPlayerView(id)) {
            throw "PlayerViewsModel already has player with given id: " + id;
        }
        playerViews[id] = view;
    }

    public function removePlayerView(id:PlayerId):PlayerView {
        if (!hasPlayerView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = playerViews[id];
        playerViews.remove(id);
        return view;
    }

    public function getPlayerView(id:PlayerId):PlayerView {
        if (!hasPlayerView(id)) {
            throw "PlayerViewsModel doesn't have player with given id: " + id;
        }
        var view = playerViews[id];
        return view;
    }

    public function hasPlayerView(id:PlayerId):Bool {
        return playerViews.exists(id);
    }


    public function addCustomView(id:String, view:DisplayObject):Void {
        if (hasCustomView(id)) {
            throw "PlayerViewsModel already has custom with given id: " + id;
        }
        customViews[id] = view;
    }

    public function removeCustomView(id:String):DisplayObject {
        if (!hasCustomView(id)) {
            throw "PlayerViewsModel doesn't have custom with given id: " + id;
        }
        var view = customViews[id];
        customViews.remove(id);
        return view;
    }

    public function getCustomView(id:String):DisplayObject {
        if (!hasCustomView(id)) {
            throw "PlayerViewsModel doesn't have custom with given id: " + id;
        }
        var view = customViews[id];
        return view;
    }

    public function hasCustomView(id:String):Bool {
        return customViews.exists(id);
    }

    public function calculateContainerHeight():Float {
        var numUnits = Lambda.count(playerViews) + 1;
        var unitsHeight = numUnits * (PlayerViewStyle.UNIT_HEIGHT + PlayerViewStyle.GRID_STEP) + PlayerViewStyle.GRID_STEP;
        var stageHeight = applicationView.getStageHeight() / applicationView.calculateScale();
        var height = Math.max(unitsHeight, stageHeight);
        return height;
    }

}