package mediators;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import massive.munit.Assert;
import flash.display.DisplayObject;
import flash.text.TextField;
import factories.LabelFactory;
import model.AssetsModel;
import constants.AssetNames;
import flash.display.Sprite;
import signals.ChangeScoreSignal;
import view.ScoreInputView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class ScoreInputViewMediatorTest {
    var scoreInputViewMediator:ScoreInputViewMediator;
    var scoreInputView:ScoreInputView;
    var changeScoreSignal:ChangeScoreSignal;
    var assetsModel:AssetsModel;
    var assetMocks:Map<String, DisplayObject>;
    var labelFactory:LabelFactory;
    var factoryTextField:TextField;
    var mockTextField:TextField;
    var timer:Timer;
    var passedId:PlayerId;
    var passedScore:Int;
    var callsCounter:Int = 0;


    @Before public function startup() {
        factoryTextField = new TextField();
        mockTextField = new TextField();

        scoreInputView = mock(ScoreInputView);
        changeScoreSignal = new ChangeScoreSignal();
        labelFactory = mock(LabelFactory);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(factoryTextField);
        assetsModel = mock(AssetsModel);
        assetsModel.getScoreInputMovieClip().returns(createAssetMock());

        scoreInputViewMediator = new ScoreInputViewMediator();
        scoreInputViewMediator.changeScoreSignal = changeScoreSignal;
        scoreInputViewMediator.labelFactory = labelFactory;
        scoreInputViewMediator.view = scoreInputView;

        passedId = null;
        passedScore = 0;
        callsCounter = 0;
    }

    @Test public function should_show_value():Void {
        scoreInputViewMediator.setScoreValue(25);
        Assert.areEqual(factoryTextField.text, "25");
    }

    @AsyncTest public function should_set_value_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldSetValueOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldSetValueOnClickHandler():Void {
        Assert.areEqual(scoreInputViewMediator.getScoreValue(), 2);
    }

    @AsyncTest public function should_set_doubledigit_value_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldSetDoubledigitValueOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_NUMBER_0_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldSetDoubledigitValueOnClickHandler():Void {
        Assert.areEqual(scoreInputViewMediator.getScoreValue(), 20);
    }

    @AsyncTest public function should_dispatch_change_score_on_plus(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchChangeScoreOnPlusHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        changeScoreSignal.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_NUMBER_0_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_PLUS_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchChangeScoreOnPlusHandler():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(2));
        Assert.areEqual(passedScore, 20);
    }

    @AsyncTest public function should_dispatch_change_score_on_minus(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchChangeScoreOnMinusHandler, 300);
        timer = Timer.delay(handler, 200);

        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchChangeScoreOnPlusHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        changeScoreSignal.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_NUMBER_0_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_MINUS_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));

    }

    function shouldDispatchChangeScoreOnMinusHandler():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(2));
        Assert.areEqual(passedScore, -20);
    }

    @AsyncTest public function should_remove_last_digit_on_bspace(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRemoveLastDigitOnBspaceHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_NUMBER_0_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_BACKSPACE_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldRemoveLastDigitOnBspaceHandler():Void {
        Assert.areEqual(scoreInputViewMediator.getScoreValue(), 2);
    }

    @AsyncTest public function should_change_1digit_value_to_zero_on_bspace(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldChange1digitValueToZeroOnBspaceHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.NAME_SCORE_NUMBER_2_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.NAME_SCORE_BACKSPACE_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));

    }

    function shouldChange1digitValueToZeroOnBspaceHandler():Void {
        Assert.areEqual(scoreInputViewMediator.getScoreValue(), 0);
    }


    private function createAssetMock():Sprite {
        var dummySprite = new Sprite();
        assetMocks = new Map<String, DisplayObject>();
        var asset:Sprite = mock(Sprite);
        var names:Array<String> = [AssetNames.NAME_SCORE_NUMBER_1, AssetNames.NAME_SCORE_NUMBER_2, AssetNames.NAME_SCORE_NUMBER_3, AssetNames.NAME_SCORE_NUMBER_4, AssetNames.NAME_SCORE_NUMBER_5, AssetNames.NAME_SCORE_NUMBER_6, AssetNames.NAME_SCORE_NUMBER_7, AssetNames.NAME_SCORE_NUMBER_8, AssetNames.NAME_SCORE_NUMBER_9, AssetNames.NAME_SCORE_NUMBER_0,
        AssetNames.NAME_SCORE_MINUS, AssetNames.NAME_SCORE_PLUS, AssetNames.NAME_SCORE_CANCEL, AssetNames.NAME_SCORE_BACKSPACE, AssetNames.NAME_SCORE_VALUE,
        AssetNames.NAME_SCORE_NUMBER_1_HITAREA, AssetNames.NAME_SCORE_NUMBER_2_HITAREA, AssetNames.NAME_SCORE_NUMBER_3_HITAREA, AssetNames.NAME_SCORE_NUMBER_4_HITAREA, AssetNames.NAME_SCORE_NUMBER_5_HITAREA, AssetNames.NAME_SCORE_NUMBER_6_HITAREA, AssetNames.NAME_SCORE_NUMBER_7_HITAREA, AssetNames.NAME_SCORE_NUMBER_8_HITAREA, AssetNames.NAME_SCORE_NUMBER_9_HITAREA, AssetNames.NAME_SCORE_NUMBER_0_HITAREA,
        AssetNames.NAME_SCORE_PLUS_HITAREA, AssetNames.NAME_SCORE_MINUS_HITAREA, AssetNames.NAME_SCORE_BACKSPACE_HITAREA ];

        for (name in names.iterator()) {
            if (name.indexOf("_number") > -1 || name.indexOf("_value") > -1) {
                asset.getChildByName(name).returns(mockTextField);
                assetMocks[name] = cast mockTextField;
            } else if (name.indexOf("_hitArea") > -1) {
                var assetMock = mock(Sprite);
                asset.getChildByName(name).returns(assetMock);
                assetMocks[name] = cast assetMock;
            } else {
                asset.getChildByName(name).returns(dummySprite);
                assetMocks[name] = cast dummySprite;
            }
        }
        return asset;
    }
//
}