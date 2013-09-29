package mediators;
import signals.LeaveScoreInputModeSignal;
import signals.StageResizedSignal;
import signals.CenterViewwVerticallySignal;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import flash.display.DisplayObject;
import constants.PlayerViewStyle;
import constants.AssetNames;
import flash.text.TextField;
import flash.display.Sprite;
import model.AssetsModel;
import signals.ChangeScoreSignal;
import factories.LabelFactory;
import view.ScoreInputView;
using mediators.AssetsMixin;

class ScoreInputViewMediator extends mmvc.impl.Mediator<ScoreInputView> {

    @inject public var labelFactory:LabelFactory;
    @inject public var changeScoreSignal:ChangeScoreSignal;
    @inject public var assetsModel:AssetsModel;
    @inject public var centerViewwVerticallySignal:CenterViewwVerticallySignal;
    @inject public var stageResizedSignal:StageResizedSignal;
    @inject public var leaveScoreInputModeSignal:LeaveScoreInputModeSignal;

    var scoreInputView:ScoreInputView;
    var scoreValue:Int = 0;
    var assets:Sprite;

    var valueLabel:TextField;


    override public function onRegister():Void {
        scoreInputView = cast view;
        assets = assetsModel.getScoreInputMovieClip();
        var _bg = assets.getChildByName(AssetNames.BACKGROUND);
        scoreInputView.initBounds(_bg.width, _bg.height, PlayerViewStyle.CORNER_RADIUS);
        createViews();
        createTapZones();
        centerViewwVerticallySignal.dispatch(scoreInputView);
        stageResizedSignal.add(stageResizedHandler);
    }

    override public function preRemove():Void {
        stageResizedSignal.remove(stageResizedHandler);
        unmapTapZones();
    }

    private function createViews():Void {
        for (i in 0...10) {
            var numberLabel:TextField = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_SCORE_INPUT_DIGIT);
            numberLabel.copyTransformFrom(assets.getChildByName(AssetNames.SCORE_NUMBER_PREFIX + i));
            numberLabel.text = cast i;
            scoreInputView.addChild(numberLabel);
        }
        valueLabel = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_SCORE_INPUT_VALUE);
        valueLabel.copyTransformFrom(assets.getChildByName(AssetNames.SCORE_VALUE));
        scoreInputView.addChild(valueLabel);

        scoreInputView.addChild(assets.makeGraphics(AssetNames.SCORE_PLUS));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.SCORE_MINUS));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.SCORE_CANCEL));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.SCORE_BACKSPACE));
    }

    private function createTapZones():Void {
        var tapZone:DisplayObject;
        for (i in 0...10) {
            tapZone = assets.makeTapZone(AssetNames.SCORE_NUMBER_HITAREA_PREFIX + i);
            tapZone.addEventListener(MouseEvent.CLICK, digitClickHandler);
            scoreInputView.addChild(tapZone);
        }

        tapZone = assets.makeTapZone(AssetNames.SCORE_BACKSPACE_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, backspaceClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.SCORE_CANCEL_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, cancelClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.SCORE_MINUS_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.SCORE_PLUS_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.addChild(tapZone);


    }

    private function unmapTapZones():Void {
        for (i in 0...10) {
            scoreInputView.getChildByName(AssetNames.SCORE_NUMBER_HITAREA_PREFIX + i).removeEventListener(MouseEvent.CLICK, digitClickHandler);
        }

        scoreInputView.getChildByName(AssetNames.SCORE_BACKSPACE_HITAREA).removeEventListener(MouseEvent.CLICK, backspaceClickHandler);
        scoreInputView.getChildByName(AssetNames.SCORE_CANCEL_HITAREA).removeEventListener(MouseEvent.CLICK, cancelClickHandler);
        scoreInputView.getChildByName(AssetNames.SCORE_MINUS_HITAREA).removeEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.getChildByName(AssetNames.SCORE_PLUS_HITAREA).removeEventListener(MouseEvent.CLICK, actionClickHandler);
    }

    private function digitClickHandler(e:MouseEvent):Void {
        var target:Sprite = cast e.target;
        var val:Int = cast target.name.substr(AssetNames.SCORE_NUMBER_HITAREA_PREFIX.length, 1);

        if (scoreValue == 0) {
            setScoreValue(val);
        } else if (scoreValue < 10) {
            setScoreValue(scoreValue * 10 + val);
        }
    }

    private function backspaceClickHandler(e:MouseEvent):Void {
        var val = getScoreValue();
        val -= (val % 10);
        val = Math.floor(val / 10);
        setScoreValue(val);
    }

    private function cancelClickHandler(e:MouseEvent):Void {
        leaveScoreInputModeSignal.dispatch();
    }

    private function stageResizedHandler():Void {
        centerViewwVerticallySignal.dispatch(scoreInputView);
    }

    private function actionClickHandler(e:MouseEvent):Void {
        var target:Sprite = cast e.target;
        var sign:Int = 0;
        switch (target.name) {
            case AssetNames.SCORE_MINUS_HITAREA:
                sign = -1;
            case AssetNames.SCORE_PLUS_HITAREA:
                sign = 1;
        }

        changeScoreSignal.dispatch(scoreInputView.id, getScoreValue() * sign);
        leaveScoreInputModeSignal.dispatch();
    }

    public function setScoreValue(value:Int):Void {
        if (value < 100) {
            scoreValue = value;
            valueLabel.text = cast value;
        }
    }

    public function getScoreValue():Int {
        return scoreValue;
    }

}