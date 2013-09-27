package mediators;
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
    var scoreInputView:ScoreInputView;
    var scoreValue:Int = 0;
    var assets:Sprite;

    var valueLabel:TextField;


    override public function onRegister():Void {
        scoreInputView = cast view;
        assets = assetsModel.getScoreInputMovieClip();
        createViews();
        createTapZones();
    }

    override public function preRemove():Void {
        unmapTapZones();
    }

    private function createViews():Void {
        for (i in 0...11) {
            var numberLabel:TextField = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_NAME);
            numberLabel.copyTransformFrom(assets.getChildByName(AssetNames.NAME_SCORE_NUMBER_PREFIX + i));
            scoreInputView.addChild(numberLabel);
        }
        valueLabel = labelFactory.getLabelFromStyle(PlayerViewStyle.STYLE_NAME);
        valueLabel.copyTransformFrom(assets.getChildByName(AssetNames.NAME_SCORE_VALUE));
        scoreInputView.addChild(valueLabel);

        scoreInputView.addChild(assets.makeGraphics(AssetNames.NAME_SCORE_PLUS));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.NAME_SCORE_MINUS));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.NAME_SCORE_CANCEL));
        scoreInputView.addChild(assets.makeGraphics(AssetNames.NAME_SCORE_BACKSPACE));
    }

    private function createTapZones():Void {
        var tapZone:DisplayObject;
        for (i in 0...11) {
            tapZone = assets.makeTapZone(AssetNames.NAME_SCORE_NUMBER_HITAREA_PREFIX + i);
            tapZone.addEventListener(MouseEvent.CLICK, digitClickHandler);
            scoreInputView.addChild(tapZone);
        }

        tapZone = assets.makeTapZone(AssetNames.NAME_SCORE_BACKSPACE_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, backspaceClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.NAME_SCORE_CANCEL_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, cancelClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.NAME_SCORE_MINUS_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.addChild(tapZone);

        tapZone = assets.makeTapZone(AssetNames.NAME_SCORE_PLUS_HITAREA);
        tapZone.addEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.addChild(tapZone);


    }

    private function unmapTapZones():Void {
        for (i in 0...11) {
            scoreInputView.getChildByName(AssetNames.NAME_SCORE_NUMBER_HITAREA_PREFIX + i).removeEventListener(MouseEvent.CLICK, digitClickHandler);
        }

        scoreInputView.getChildByName(AssetNames.NAME_SCORE_BACKSPACE_HITAREA).removeEventListener(MouseEvent.CLICK, backspaceClickHandler);
        scoreInputView.getChildByName(AssetNames.NAME_SCORE_CANCEL_HITAREA).removeEventListener(MouseEvent.CLICK, cancelClickHandler);
        scoreInputView.getChildByName(AssetNames.NAME_SCORE_MINUS_HITAREA).removeEventListener(MouseEvent.CLICK, actionClickHandler);
        scoreInputView.getChildByName(AssetNames.NAME_SCORE_PLUS_HITAREA).removeEventListener(MouseEvent.CLICK, actionClickHandler);
    }

    private function digitClickHandler(e:MouseEvent):Void {
        var target:Sprite = cast e.target;
        var val:Int = cast target.name.substr(AssetNames.NAME_SCORE_NUMBER_HITAREA_PREFIX.length, 1);

        if (scoreValue == 0 ) {
        setScoreValue(val);
        } else if (scoreValue < 10) {
            setScoreValue(scoreValue* 10 + val);
        }
    }

    private function backspaceClickHandler(e:MouseEvent):Void {
    trace("b1 " + getScoreValue() );
        var val = getScoreValue();
        val -= (val % 10);
        trace("b2 " + getScoreValue() );
        trace("b3 " + val / 10 + " " + Math.floor(val / 10) );
        val = Math.floor(val / 10);
        trace("b4 " + val);
        setScoreValue(val);
        trace("b5 " + getScoreValue());
    }

    private function cancelClickHandler(e:MouseEvent):Void {

    }

    private function actionClickHandler(e:MouseEvent):Void {
        trace("click");
        var target:Sprite = cast e.target;
        var sign:Int = 0;
        switch (target.name) {
            case AssetNames.NAME_SCORE_MINUS_HITAREA:
                sign = -1;
            case AssetNames.NAME_SCORE_PLUS_HITAREA:
                sign = 1;
        }

        changeScoreSignal.dispatch(scoreInputView.id, getScoreValue() * sign);
    }

    public function setScoreValue(value:Int):Void {
        if (value < 100)   {
            scoreValue = value;
            valueLabel.text = cast value;
        }
    }

    public function getScoreValue():Int {
        return scoreValue;
    }

}