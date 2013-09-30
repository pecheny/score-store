package mediators;
import signals.StageResizedSignal;
import signals.CenterViewwVerticallySignal;
import flash.text.TextField;
import factories.LabelFactory;
import flash.events.MouseEvent;
import flash.display.Sprite;
import model.AssetsModel;
import view.PlayerSwitcherView;
import view.ViewBase;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.PlayersChoosenSignal;
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
    var playersChoosenSignal:PlayersChoosenSignal;
    var switchers:Map<String, ViewBase>;
    var assetsModel:AssetsModel;
    var timer:Timer;
    var sprite:Sprite;

    @Before public function startup() {
        switchers = new Map<String, ViewBase>();
        playersChooserView = mock(PlayersChooserView);
        playerViewFactory = mock(PlayerViewFactory);
        var switcher = mock(PlayerSwitcherView);
        playerViewFactory.getPlayerSwitcher(cast Matcher.any).returns(switcher);

        playersChoosenSignal = mock(PlayersChoosenSignal);

        assetsModel = mock(AssetsModel);
        sprite = new Sprite();
        var asset:Sprite = mock(Sprite);
        asset.getChildByName(cast Matcher.any).returns(sprite);
        assetsModel.getPlayersChooserMovieClip().returns(asset);

        var labelFactory:LabelFactory = mock(LabelFactory);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(new TextField());

        playersChooserViewMediator = new PlayersChooserViewMediator();
        playersChooserViewMediator.playerViewFactory = playerViewFactory;
        playersChooserViewMediator.playersChoosenSignal = playersChoosenSignal;
        playersChooserViewMediator.assetsModel = assetsModel;
        playersChooserViewMediator.centerViewwVerticallySignal = new CenterViewwVerticallySignal();
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
        playersChoosenSignal.dispatch().verify(1);
    }


}