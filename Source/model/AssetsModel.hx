package model;
import constants.PlayerColor;
import constants.AssetNames;
import model.vo.PlayerId;
import flash.display.Sprite;
import format.SWF;
class AssetsModel {
    public var swf(default, null):SWF;

    public function new(mc:SWF):Void {
        swf = mc;
    }

    public function getPlayerViewMovieClip():Sprite {
        return swf.createMovieClip("PlayerUnitView");
    }

    public function getPlayerEditMovieClip():Sprite {
        return swf.createMovieClip("PlayerEditMode");
    }

    public function getScoreInputMovieClip():Sprite {
        return swf.createMovieClip("ScoreInputView");
    }

    public function getPlayersChooserMovieClip():Sprite {
        return swf.createMovieClip("PlayersChooser");
    }

    public function getNewGameConfirmation():Sprite {
        return swf.createMovieClip("NewGameConfirmation");
    }

    public function getAvatar(id:PlayerId):Sprite {
        return swf.createMovieClip(AssetNames.AVATAR_CLASS_PREFIX + PlayerColor.getPlayerColor(id));
    }

}