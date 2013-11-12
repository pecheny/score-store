package mediators;
import signals.ShowModalWindowSignal;
import model.PlayerModel;
import constants.AssetNames;
import factories.PlayerViewFactory;
import flash.text.TextFieldAutoSize;
import signals.ChangeScoreSignal;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import flash.text.TextField;
import flash.display.Sprite;
import model.AssetsModel;
import factories.LabelFactory;
import flash.events.MouseEvent;
import view.PlayerView;

using mediators.AssetsMixin;

class PlayerViewMediator extends mmvc.impl.Mediator<PlayerView> {
    @inject public var playerViewFactory:PlayerViewFactory;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    @inject public var labelFactory:LabelFactory;
    @inject public var playerModel:PlayerModel;
    @inject public var showModalWindowSignal:ShowModalWindowSignal;
    @inject public var assetsModel:AssetsModel;


    var playerView:PlayerView;
    var layoutMc:Sprite;

    var tapZones:Map<String, DisplayObject>;


    override public function onRegister() {
        tapZones = new Map<String, DisplayObject>();
        playerView = cast view;
        setupLayout();
        playerView.addEventListener(MouseEvent.CLICK, mouseHandler);
    }

    override public function preRemove():Void {
        playerView.removeEventListener(MouseEvent.CLICK, mouseHandler);
        unmapTapZones();
        playerView.clearChildren();
    }


    public function setupLayout():Void {
        layoutMc = assetsModel.getPlayerViewMovieClip();

        var bg:Sprite = cast layoutMc.getChildByName(AssetNames.BACKGROUND);
        playerView.initBounds(bg.width, bg.height, PlayerViewStyle.CORNER_RADIUS);

        createViews();
        createAvatar();
        createTapZone(AssetNames.PLUS_HITAREA);
        createTapZone(AssetNames.MINUS_HITAREA);
        createTapZone(AssetNames.SCORE_HITAREA);
    }

    private function createAvatar():Void {
        var layoutSource = layoutMc.makeGraphics(AssetNames.AVATAR);
        var avatar = assetsModel.getAvatar(playerView.getPlayerId());
        avatar.mouseEnabled = false;
        avatar.transform.matrix = layoutSource.transform.matrix;
        playerView.addChild(avatar);
    }

    private function createViews():Void {
        var _score:TextField = cast layoutMc.getChildByName(AssetNames.SCORE);
        var scoreLabel:TextField = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_SCORE);
        scoreLabel.copyTransformFrom(_score);
        playerView.setMainTextField(scoreLabel);
        playerView.setScore(playerModel.getScore(playerView.getPlayerId()));


        var _name:TextField = cast layoutMc.getChildByName(AssetNames.NAME);
        var nameLabel:TextField = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_NAME);
        nameLabel.copyTransformFrom(_name);
        nameLabel.autoSize = TextFieldAutoSize.LEFT;
        nameLabel.text = "Player " + playerView.getPlayerId().toInt();
        playerView.addChild(nameLabel);

        var plusButton = layoutMc.makeGraphics(AssetNames.PLUS_VIEW);
        playerView.addChild(plusButton);

        var minusButton = layoutMc.makeGraphics(AssetNames.MINUS_VIEW);
        playerView.addChild(minusButton);
    }

    private function createTapZone(name:String):Void {
        var tapZone = layoutMc.makeTapZone(name);
        tapZones[name] = tapZone;
        tapZone.addEventListener(MouseEvent.MOUSE_DOWN, tapZoneMouseDownHandler);
        playerView.addChild(tapZone);
    }

    private function unmapTapZones():Void {
        for (tapZone in tapZones.iterator()) {
            tapZone.removeEventListener(MouseEvent.MOUSE_DOWN, tapZoneMouseDownHandler);
        }
    }

    private function tapZoneMouseDownHandler(e:MouseEvent):Void {
        e.stopImmediatePropagation();
    }


    private function mouseHandler(e:MouseEvent):Void {
        e.stopImmediatePropagation();
        var target:Sprite = cast e.target;
        if (target.name == AssetNames.PLUS_HITAREA) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), 1);
        }
        else if (target.name == AssetNames.MINUS_HITAREA) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), -1);
        }
        else if (target.name == AssetNames.SCORE_HITAREA) {
            showModalWindowSignal.dispatch(playerViewFactory.getScoreInput(playerView.getPlayerId()));
        }
    }
}