package mediators;
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
    @inject public var labelFactory:LabelFactory;
    @inject public var layout:PlayerViewLayout;

    var playerView:PlayerView;
    var layoutMc:Sprite;

    public function new() {
        super();
    }


    override public function onRegister() {
        super.onRegister();
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
        setupLayout();
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

        var plusButton = makeButton("_plus_view", "_plus_hitArea");
        playerView.addChild(plusButton);

        var minusButton = makeButton("_minus_view", "_minus_hitArea");
        playerView.addChild(minusButton);

        var scoreButton = makeButton("_minus_view", "_score_hitArea");
        playerView.addChild(scoreButton);

    }

    public function makeButton(sourceName:String, hitAreaName:String):DisplayObject {
        var _plus_view:Sprite = cast layoutMc.getChildByName(sourceName);
        var _plus_shape:Shape = cast _plus_view.getChildAt(0);
        var button = new Sprite();
        button.graphics.copyFrom(_plus_shape.graphics);
        button.transform.matrix = _plus_view.transform.matrix.clone();


        var _hitArea:Sprite = cast layoutMc.getChildByName(hitAreaName);
        var _hitArea_shape:Shape = cast _hitArea.getChildAt(0);
        var hitArea = new Sprite();
        hitArea.graphics.copyFrom(_hitArea_shape.graphics);

        var invButtonMatrix = button.transform.concatenatedMatrix.clone();
        invButtonMatrix.invert();
        var matrix = _hitArea.transform.concatenatedMatrix.clone();
        matrix.concat(invButtonMatrix);
        hitArea.transform.matrix = matrix;
        hitArea.alpha = 0.1;

        button.addChild(hitArea);

        return button;
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
        playerButtonSignal.dispatch(view.getPlayerId(), e);
    }
}