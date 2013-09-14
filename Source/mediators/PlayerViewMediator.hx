package mediators;
import signals.ChangeScoreSignal;
import flash.display.Shape;
import flash.display.DisplayObject;
import view.PlayerViewStyle;
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
        layoutMc = layout.movieClip;
        playerView = cast view;

        var bg:Sprite = cast layoutMc.getChildByName("_background");
        playerView.initBackground(bg.width, bg.height, 25 * 2);

        var _score:TextField = cast layoutMc.getChildByName("_score");
        var scoreLabel:TextField = makeLabel(PlayerViewStyle.SCORE, _score);
        scoreLabel.text = "25";
        playerView.setMainTextField(scoreLabel);


        var _name:TextField = cast layoutMc.getChildByName("_name");
        var nameLabel:TextField = makeLabel(PlayerViewStyle.NAME, _name);
        nameLabel.text = "Player " + playerView.getPlayerId().toInt();
        playerView.addChild(nameLabel);

        var plusButton = makeGraphics("_plus_view");
        playerView.addChild(plusButton);

        var minusButton = makeGraphics("_minus_view");
        playerView.addChild(minusButton);


        plusTapZone = makeTapZone("_plus_hitArea");
        playerView.addChild(plusTapZone);

        minusTapZone = makeTapZone("_minus_hitArea");
        playerView.addChild(minusTapZone);

        scoreTapZone = makeTapZone("_score_hitArea");
        playerView.addChild(scoreTapZone);

    }

    public function makeGraphics(sourceName:String):DisplayObject {
        var _plus_view:Sprite = cast layoutMc.getChildByName(sourceName);
        var _plus_shape:Shape = cast _plus_view.getChildAt(0);
        var button = new Sprite();
        button.graphics.copyFrom(_plus_shape.graphics);
        button.transform.matrix = _plus_view.transform.matrix.clone();
        button.mouseEnabled = false;
        return button;
    }

    public function makeTapZone(hitAreaName:String):DisplayObject {
        var _hitArea:Sprite = cast layoutMc.getChildByName(hitAreaName);
        var _hitArea_shape:Shape = cast _hitArea.getChildAt(0);
        var hitArea = new Sprite();
        hitArea.graphics.copyFrom(_hitArea_shape.graphics);
        var matrix = _hitArea.transform.matrix.clone();
        hitArea.transform.matrix = matrix;
        hitArea.alpha = 0;
        hitArea.mouseChildren = false;
        return hitArea;
    }

    function makeLabel(style:LabelStyle, transformSource:DisplayObject):TextField {
        var label:TextField = labelFactory.gelLabelFromStyle(style);
        label.width = transformSource.width;
        label.height = transformSource.height;
        label.transform.matrix = transformSource.transform.matrix.clone();
        return label;
    }


    override public function onRemove():Void {
        super.onRemove();
    }

    private function mouseHandler(e:MouseEvent):Void {
        if (e.target == plusTapZone) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), 1);
        }
        else if (e.target == minusTapZone) {
            changeScoreSignal.dispatch(playerView.getPlayerId(), -1);
        }
        else if (e.target == scoreTapZone) {
            playerButtonSignal.dispatch(view.getPlayerId(), e);
        }
    }
}