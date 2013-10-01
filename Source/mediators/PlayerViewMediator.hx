package mediators;
import model.PlayerModel;
import constants.AssetNames;
import signals.EnterScoreInputModeSignal;
import factories.PlayerViewFactory;
import view.PlayerEditorView;
import signals.EnterEditModeSignal;
import signals.EnterGameModeSignal;
import flash.text.TextFieldAutoSize;
import flash.display.MovieClip;
import signals.ChangeScoreSignal;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import flash.text.TextField;
import flash.display.Sprite;
import model.AssetsModel;
import factories.LabelFactory;
import flash.events.MouseEvent;
import view.PlayerView;
import signals.PlayerButtonSignal;

using mediators.AssetsMixin;

class PlayerViewMediator extends mmvc.impl.Mediator<PlayerView> {
    @inject public var playerViewFactory:PlayerViewFactory;
    @inject public var playerButtonSignal:PlayerButtonSignal;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    @inject public var labelFactory:LabelFactory;
    @inject public var layout:AssetsModel;
    @inject public var enterGameModeSignal:EnterGameModeSignal;
    @inject public var enterEditModeSignal:EnterEditModeSignal;
    @inject public var enterScoreInputModeSignal:EnterScoreInputModeSignal;
    @inject public var playerModel:PlayerModel;

    var playerView:PlayerView;
    var layoutMc:Sprite;

    var plusTapZone:DisplayObject;
    var minusTapZone:DisplayObject;
    var scoreTapZone:DisplayObject;

    var editView:PlayerEditorView;

    public function new() {
        super();
    }


    override public function onRegister() {
        super.onRegister();
        playerView = cast view;
        editView = playerViewFactory.getEditorView(playerView.getPlayerId());
        enterGameModeSignal.add(enterGameMode);
        enterEditModeSignal.add(enterEditMode);
        setupLayout();
        playerView.addEventListener(MouseEvent.CLICK, mouseHandler);
    }

    override public function preRemove():Void {
        enterGameModeSignal.remove(enterGameMode);
        enterEditModeSignal.remove(enterEditMode);
        playerView.removeEventListener(MouseEvent.CLICK, mouseHandler);
        playerView.clearChildren();
    }


    public function setupLayout():Void {
        layoutMc = layout.getPlayerViewMovieClip();

        var bg:Sprite = cast layoutMc.getChildByName(AssetNames.BACKGROUND);
        trace(bg.width, bg.height);
        playerView.initBounds(bg.width, bg.height, PlayerViewStyle.CORNER_RADIUS);

        var _score:TextField = cast layoutMc.getChildByName(AssetNames.SCORE);
        var scoreLabel:TextField = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_SCORE);
        scoreLabel.copyTransformFrom(_score);
        playerView.setMainTextField(scoreLabel);
        playerView.setText("" + playerModel.getScore(playerView.getPlayerId()));


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


        plusTapZone = layoutMc.makeTapZone(AssetNames.PLUS_HITAREA);
        playerView.addChild(plusTapZone);

        minusTapZone = layoutMc.makeTapZone(AssetNames.MINUS_HITAREA);
        playerView.addChild(minusTapZone);

        scoreTapZone = layoutMc.makeTapZone(AssetNames.SCORE_HITAREA);
        playerView.addChild(scoreTapZone);

    }

    private function enterGameMode():Void {
        if (playerView.contains(editView)) {
            playerView.removeChild(editView);
        }
    }

    private function enterEditMode():Void {
        playerView.addChild(editView);
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
            enterScoreInputModeSignal.dispatch(playerView.getPlayerId());
        }
    }
}