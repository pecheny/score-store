package mediators;
import signals.CloseModalWindowSignal;
import signals.StageResizedSignal;
import signals.CenterViewVerticallySignal;
import flash.text.TextField;
import factories.LabelFactory;
import flash.events.MouseEvent;
import flash.display.Sprite;
import model.AssetsModel;
import view.PlayerSwitcherView;
import view.ViewBase;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import view.PlayersChooserView;
import factories.PlayerViewFactory;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class PlayersChooserViewMediatorTest {
    var playersChooserViewMediator:PlayersChooserViewMediator;
    var playerViewFactory:PlayerViewFactory;
    var playersChooserView:PlayersChooserView;
    var switchers:Map<String, ViewBase>;
    var assetsModel:AssetsModel;
    var closeModalWindowSignal:CloseModalWindowSignal;
    var timer:Timer;
    var sprite:Sprite;

    @Before public function startup() {
        switchers = new Map<String, ViewBase>();
        playersChooserView = mock(PlayersChooserView);
        playerViewFactory = mock(PlayerViewFactory);
        var switcher = mock(PlayerSwitcherView);
        playerViewFactory.getPlayerSwitcher(cast Matcher.any).returns(switcher);


        assetsModel = mock(AssetsModel);
        sprite = new Sprite();
        var asset:Sprite = mock(Sprite);
        asset.getChildByName(cast Matcher.any).returns(sprite);
        assetsModel.getPlayersChooserMovieClip().returns(asset);

        closeModalWindowSignal = mock(CloseModalWindowSignal);

        var labelFactory:LabelFactory = mock(LabelFactory);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(new TextField());

        playersChooserViewMediator = new PlayersChooserViewMediator();
        playersChooserViewMediator.playerViewFactory = playerViewFactory;
        playersChooserViewMediator.closeModalWindowSignal = closeModalWindowSignal;
        playersChooserViewMediator.assetsModel = assetsModel;
        playersChooserViewMediator.centerViewwVerticallySignal = new CenterViewVerticallySignal();
        playersChooserViewMediator.labelFactory = labelFactory;
        playersChooserViewMediator.stageResizedSignal = new StageResizedSignal();
        playersChooserViewMediator.view = playersChooserView;

    }

    @Test public function should_add_views():Void {
        playersChooserViewMediator.onRegister();
        playersChooserView.addChild(cast Matcher.any).verify(10); // 8 switchers, ok view and hitarea
    }

    @AsyncTest public function should_dispatch_ok_signal(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchOkSignalHandler, 300);
        timer = Timer.delay(handler, 200);
        playersChooserViewMediator.onRegister();
        sprite.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchOkSignalHandler():Void {
        closeModalWindowSignal.dispatch().verify(1);
    }


}