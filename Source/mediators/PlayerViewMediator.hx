package mediators;
import flash.text.TextFieldAutoSize;
import Type;
import flash.display.MovieClip;
import signals.ChangeScoreSignal;
import flash.display.Shape;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import flash.text.TextField;
import flash.display.Sprite;
import view.PlayerViewLayout;
import view.LabelFactory;
import flash.events.MouseEvent;
import view.PlayerView;
import signals.PlayerButtonSignal;
class PlayerViewMediator extends mmvc.impl.Mediator<PlayerView> {
    @inject public var playerButtonSignal:PlayerButtonSignal;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    @inject public var labelFactory:LabelFactory;
    @inject public var layout:PlayerViewLayout;

    var playerView:PlayerView;
    var layoutMc:Sprite;

    var plusTapZone:DisplayObject;
    var minusTapZone:DisplayObject;
    var scoreTapZone:DisplayObject;

    public function new() {
        super();
    }


    override public function onRegister() {
        super.onRegister();
        setupLayout();
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
    }

    public function setupLayout():Void {
        layoutMc = layout.getPlayerViewMovieClip();
        playerView = cast view;

        var bg:Sprite = cast layoutMc.getChildByName(PlayerViewStyle.NAME_BACKGROUND);
        playerView.initBounds(bg.width, bg.height, 25 * 2);

        var _score:TextField = cast layoutMc.getChildByName(PlayerViewStyle.NAME_SCORE);
        var scoreLabel:TextField = makeLabel(PlayerViewStyle.STYLE_SCORE, _score);
        scoreLabel.text = "25";
        playerView.setMainTextField(scoreLabel);


        var _name:TextField = cast layoutMc.getChildByName(PlayerViewStyle.NAME_NAME);
        var nameLabel:TextField = makeLabel(PlayerViewStyle.STYLE_NAME, _name);
        nameLabel.autoSize = TextFieldAutoSize.LEFT;
        nameLabel.text = "Player " + playerView.getPlayerId().toInt();
        playerView.addChild(nameLabel);

        var plusButton = makeGraphics(PlayerViewStyle.NAME_PLUS_VIEW);
        playerView.addChild(plusButton);

        var minusButton = makeGraphics(PlayerViewStyle.NAME_MINUS_VIEW);
        playerView.addChild(minusButton);


        plusTapZone = makeTapZone(PlayerViewStyle.NAME_PLUS_HITAREA);
        playerView.addChild(plusTapZone);

        minusTapZone = makeTapZone(PlayerViewStyle.NAME_MINUS_HITAREA);
        playerView.addChild(minusTapZone);

        scoreTapZone = makeTapZone(PlayerViewStyle.NAME_SCORE_HITAREA);
        playerView.addChild(scoreTapZone);

    }

    public function makeGraphics(sourceName:String):DisplayObject {
        var sprite:Sprite = cast layoutMc.getChildByName(sourceName);
        sprite.mouseEnabled = false;
        return sprite;
    }

    public function makeTapZone(hitAreaName:String):DisplayObject {
        var hitArea:Sprite = cast layoutMc.getChildByName(hitAreaName);
        hitArea.alpha = 0;
        hitArea.mouseChildren = false;
        hitArea.name = hitAreaName;
        return hitArea;
    }

    function makeLabel(style:LabelStyle, transformSource:DisplayObject):TextField {
        var label:TextField = labelFactory.getLabelFromStyle(style);
        label.width = transformSource.width;
        label.height = transformSource.height;
        label.transform.matrix = transformSource.transform.matrix.clone();
        return label;
    }


    override public function onRemove():Void {
        super.onRemove();
    }

    private function mouseHandler(e:MouseEvent):Void {
        var target:Sprite = cast e.target;
        if (target.name == plusTapZone.name) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), 1);
        }
        else if (target.name == minusTapZone.name) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), -1);
        }
        else if (target.name == scoreTapZone.name) {
            playerButtonSignal.dispatch(view.getPlayerId(), e);
        }
    }
}