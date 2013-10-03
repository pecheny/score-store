package mediators;
import signals.CloseModalWindowSignal;
import signals.StageResizedSignal;
import view.ViewBase;
import signals.CenterViewVerticallySignal;
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
    var centerViewwVerticallySignal:CenterViewVerticallySignal;
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
    var targetViewBase:ViewBase;
    var stageResizedSignal:StageResizedSignal;


    @Before public function startup() {
        factoryTextField = new TextField();
        mockTextField = new TextField();

        scoreInputView = new ScoreInputView();
        scoreInputView.id = PlayerId.fromInt(2);
        changeScoreSignal = new ChangeScoreSignal();
        labelFactory = mock(LabelFactory);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(factoryTextField);
        assetsModel = mock(AssetsModel);
        assetsModel.getScoreInputMovieClip().returns(createAssetMock());
        centerViewwVerticallySignal = new CenterViewVerticallySignal();
        stageResizedSignal = new StageResizedSignal();

        scoreInputViewMediator = new ScoreInputViewMediator();
        scoreInputViewMediator.changeScoreSignal = changeScoreSignal;
        scoreInputViewMediator.labelFactory = labelFactory;
        scoreInputViewMediator.view = scoreInputView;
        scoreInputViewMediator.assetsModel = assetsModel;
        scoreInputViewMediator.centerViewwVerticallySignal = centerViewwVerticallySignal;
        scoreInputViewMediator.stageResizedSignal = stageResizedSignal;
        scoreInputViewMediator.closeModalWindowSignal = new CloseModalWindowSignal();

        passedId = null;
        passedScore = 0;
        callsCounter = 0;
    }

    @Test public function should_show_value():Void {
        scoreInputViewMediator.onRegister();
        scoreInputViewMediator.setScoreValue(25);
        Assert.areEqual("25", factoryTextField.text);
    }

    @AsyncTest public function should_set_value_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldSetValueOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldSetValueOnClickHandler():Void {
        Assert.areEqual(2, scoreInputViewMediator.getScoreValue());
    }

    @AsyncTest public function should_set_doubledigit_value_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldSetDoubledigitValueOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldSetDoubledigitValueOnClickHandler():Void {
        Assert.areEqual(20, scoreInputViewMediator.getScoreValue());
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
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_PLUS_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchChangeScoreOnPlusHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(PlayerId.fromInt(2), passedId);
        Assert.areEqual(20, passedScore);
    }

    @AsyncTest public function should_dispatch_change_score_on_minus(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchChangeScoreOnMinusHandler, 300);
        timer = Timer.delay(handler, 200);

        scoreInputViewMediator.onRegister();
        changeScoreSignal.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_MINUS_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchChangeScoreOnMinusHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(PlayerId.fromInt(2), passedId);
        Assert.areEqual(-20, passedScore);
    }

    @AsyncTest public function should_remove_last_digit_on_bspace(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRemoveLastDigitOnBspaceHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 0].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_BACKSPACE_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldRemoveLastDigitOnBspaceHandler():Void {
        Assert.areEqual(2, scoreInputViewMediator.getScoreValue());
    }

    @AsyncTest public function should_change_1digit_value_to_zero_on_bspace(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldChange1digitValueToZeroOnBspaceHandler, 300);
        timer = Timer.delay(handler, 200);
        scoreInputViewMediator.onRegister();
        assetMocks[AssetNames.SCORE_NUMBER_HITAREA_PREFIX + 2].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        assetMocks[AssetNames.SCORE_BACKSPACE_HITAREA].dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldChange1digitValueToZeroOnBspaceHandler():Void {
        Assert.areEqual(0, scoreInputViewMediator.getScoreValue());
    }

    @AsyncTest public function should_unmap_all_handlers(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldUnmapAllHandlersHandler, 300);
        timer = Timer.delay(handler, 200);
        changeScoreSignal.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        scoreInputViewMediator.onRegister();
        scoreInputViewMediator.preRemove();
        for (dispatcher in assetMocks.iterator()) {
            dispatcher.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }
    }

    function shouldUnmapAllHandlersHandler():Void {
        Assert.areEqual(0, callsCounter);
        Assert.areEqual(null, passedId);
        Assert.areEqual(0, passedScore);
        Assert.areEqual(0, scoreInputViewMediator.getScoreValue());
    }

    @AsyncTest public function should_dispatch_center_signal(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchCenterSignalHandler, 300);
        timer = Timer.delay(handler, 200);

        centerViewwVerticallySignal.add(function(target:ViewBase) {
            targetViewBase = target;
        });
        scoreInputViewMediator.onRegister();
    }

    function shouldDispatchCenterSignalHandler():Void {
        Assert.areEqual(scoreInputView, targetViewBase);
    }


    private function createAssetMock():Sprite {
        var dummySprite = new Sprite();
        assetMocks = new Map<String, DisplayObject>();
        var asset:Sprite = mock(Sprite);
        var names:Array<String> = [AssetNames.BACKGROUND, AssetNames.SCORE_MINUS, AssetNames.SCORE_PLUS, AssetNames.SCORE_CANCEL, AssetNames.SCORE_BACKSPACE,
        AssetNames.SCORE_PLUS_HITAREA, AssetNames.SCORE_MINUS_HITAREA, AssetNames.SCORE_BACKSPACE_HITAREA, AssetNames.SCORE_CANCEL_HITAREA ];

        for (i in 0...10) {
            storeAssetMock(asset, AssetNames.SCORE_NUMBER_PREFIX + i, mockTextField);
            storeAssetMock(asset, AssetNames.SCORE_NUMBER_HITAREA_PREFIX + i, new Sprite());
        }

        storeAssetMock(asset, AssetNames.SCORE_VALUE, mockTextField);
        for (name in names.iterator()) {
            if (name.indexOf("_hitArea") > -1) {
                storeAssetMock(asset, name, new Sprite());
            } else {
                storeAssetMock(asset, name, new Sprite());
            }
        }
        return asset;
    }

    private function storeAssetMock(asset:Sprite, name:String, mmock:DisplayObject):Void {
        asset.getChildByName(name).returns(mmock);
        assetMocks[name] = mmock;
    }
}