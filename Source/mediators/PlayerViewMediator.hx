package mediators;
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
//        view.setMainTextField();
        view.addEventListener(MouseEvent.CLICK, mouseHandler);

       setupLayout();

    }

    public function setupLayout():Void {
        var layoutMc:Sprite = layout.movieClip;
        var playerView:PlayerView = cast view;

        var bg:Sprite = cast layoutMc.getChildByName("_background");
        playerView.initBackground(bg.width, bg.height, 25*2);

        var _score:TextField = cast layoutMc.getChildByName("_score");
        var scoreLabel:TextField = labelFactory.getLabel(
            PlayerViewStyle.SCORE_SIZE,
            PlayerViewStyle.SCORE_COLOR,
            cast PlayerViewStyle.SCORE_ALIGN,
            PlayerViewStyle.SCORE_SPACING
        );
        scoreLabel.width = _score.width;
        scoreLabel.height = _score.height;
//        scoreLabel.x = _score.x;
//        scoreLabel.y = _score.y;
//        trace("w/h", scoreLabel.width, scoreLabel.height, scoreLabel.x, scoreLabel.y);
        scoreLabel.transform.matrix = _score.transform.matrix.clone();
        scoreLabel.text = "25";
//        scoreLabel.x = _score.x;
//        scoreLabel.y = _score.y;
        playerView.setMainTextField(scoreLabel);
        
        
        var _name:TextField = cast layoutMc.getChildByName("_name");
                var nameLabel:TextField = labelFactory.getLabel(
                    PlayerViewStyle.NAME_SIZE,
                    PlayerViewStyle.NAME_COLOR,
                    PlayerViewStyle.NAME_ALIGN,
                    PlayerViewStyle.NAME_SPACING
                );
                nameLabel.width = _name.width;
                nameLabel.height = _name.height;
                nameLabel.transform.matrix = _name.transform.matrix.clone();
                nameLabel.text = "Name";
        //        nameLabel.x = _score.x;
        //        nameLabel.y = _score.y;
                playerView.addChild(nameLabel);
    }


    override public function onRemove():Void {
        super.onRemove();
    }

    private function mouseHandler(e:MouseEvent):Void {
        playerButtonSignal.dispatch(view.getPlayerId(), e);
    }
}