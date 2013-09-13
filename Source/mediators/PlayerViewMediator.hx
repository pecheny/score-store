package mediators;
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

    public function new() {
        super();
    }


    override public function onRegister() {
        super.onRegister();
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
        setupLayout();
    }

    public function setupLayout():Void {
        var layoutMc:Sprite = layout.movieClip;
        var playerView:PlayerView = cast view;

        var bg:Sprite = cast layoutMc.getChildByName("_background");
        playerView.initBackground(bg.width, bg.height, 25 * 2);

        var _score:TextField = cast layoutMc.getChildByName("_score");
        var scoreLabel:TextField = makeLabel(PlayerViewStyle.SCORE, _score);
        scoreLabel.text = "25";
        playerView.setMainTextField(scoreLabel);


        var _name:TextField = cast layoutMc.getChildByName("_name");
        var nameLabel:TextField = makeLabel(PlayerViewStyle.NAME, _name);
        nameLabel.text = "Name";
        playerView.addChild(nameLabel);
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