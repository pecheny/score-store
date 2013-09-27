package mediators;
import constants.AssetNames;
import flash.text.TextField;
import massive.munit.Assert;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import constants.PlayerViewStyle;
import flash.display.Sprite;
import view.PlayerEditorView;
import model.AssetsModel;
import factories.LabelFactory;
import signals.RemovePlayerSignal;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;

class PlayerEditorViewMediatorTest {
    var playerEditorViewMediator:PlayerEditorViewMediator;
    var assetsModel:AssetsModel;
    var labelFactory:LabelFactory;
    var removePlayerSignal:RemovePlayerSignal;
    var playerEditorView:PlayerEditorView;
    var sprite:Sprite;
    var timer:Timer;
    var callsCounter:Int;
    var passedId:PlayerId;

    @Before public function startup() {
        var tf = new TextField();
        sprite = new Sprite();
        assetsModel = mock(AssetsModel);
        labelFactory = mock(LabelFactory);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(tf);
        removePlayerSignal = new RemovePlayerSignal();
        playerEditorView = PlayerEditorView.fromPlayerId(PlayerId.fromInt(1));

        var pemc = mock(Sprite);
        pemc.getChildByName(AssetNames.EDITOR_NAME).returns(tf);
        pemc.getChildByName(AssetNames.EDITOR_DELETE_HITAREA).returns(sprite);
        pemc.getChildByName(AssetNames.EDITOR_DELETE).returns(sprite);
        assetsModel.getPlayerEditMovieClip().returns(pemc);

        playerEditorViewMediator = new PlayerEditorViewMediator();
        playerEditorViewMediator.assetsModel = assetsModel;
        playerEditorViewMediator.labelFactory = labelFactory;
        playerEditorViewMediator.removePlayerSignal = removePlayerSignal;
        playerEditorViewMediator.view = playerEditorView;

        passedId = null;
        callsCounter = 0;
    }

    @AsyncTest public function should_dispatch_delete_player(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchDeletePlayerHandler, 300);
        timer = Timer.delay(handler, 200);
        playerEditorViewMediator.onRegister();
        removePlayerSignal.add(function(id:PlayerId) {
            callsCounter++;
            passedId = id;
        });
        sprite.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchDeletePlayerHandler():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(1));
    }

    @AsyncTest public function should_unregister_dispatch_delete_player(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldUnregisterDispatchDeletePlayerHandler, 300);
        timer = Timer.delay(handler, 200);
        playerEditorViewMediator.onRegister();
        playerEditorViewMediator.preRemove();
        removePlayerSignal.add(function(id:PlayerId) {
            callsCounter++;
            passedId = id;
        });
        sprite.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldUnregisterDispatchDeletePlayerHandler():Void {
        Assert.areEqual(callsCounter, 0);
        Assert.areEqual(passedId, null);
    }
}




