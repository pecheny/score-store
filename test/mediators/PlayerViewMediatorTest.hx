package mediators;
import model.PlayerModel;
import constants.AssetNames;
import factories.PlayerViewFactory;
import signals.ChangeScoreSignal;
import flash.display.DisplayObject;
import model.AssetsModel;
import flash.display.MovieClip;
import org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo;
import factories.LabelFactory;
import flash.text.TextField;
import massive.munit.async.AsyncFactory;
import massive.munit.Assert;
import flash.events.MouseEvent;
import model.vo.PlayerId;
import view.PlayerView;
import massive.munit.util.Timer;
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;
using org.hamcrest.MatcherAssert;

class PlayerViewMediatorTest  {
    public var playerViewMediator:PlayerViewMediator;
    var playerView:PlayerView;
    var passedId:PlayerId;
    var passedScore:Int;
    var callsCounter:Int = 0;
    var timer:Timer;
    var changeScore:ChangeScoreSignal;
    var label:TextField;
    var mc:MovieClip;
    var playerViewFactory:PlayerViewFactory;

    @Before
    public function startup():Void {
        label = new TextField();
        label.text = "foobar";
        var labelFactory:LabelFactory = mock(LabelFactory);
        labelFactory.getLabel(cast Matcher.any, cast Matcher.any, cast Matcher.any, cast Matcher.any).returns(label);
        labelFactory.getLabelFromStyle(cast Matcher.any).returns(label);
        mc = new MovieClipMocked(label);
        var layout:AssetsModel = mock(AssetsModel);
        layout.getPlayerViewMovieClip().returns(mc);

        playerViewFactory = mock (PlayerViewFactory);

        var playerModel:PlayerModel = mock(PlayerModel);
        playerModel.hasPLayer(cast Matcher.any).returns(false);
        playerModel.getScore(cast Matcher.any).returns(0);


        playerViewMediator = new PlayerViewMediator();
        playerViewMediator.layout = layout;
        playerViewMediator.labelFactory = labelFactory;
        playerViewMediator.changeScoreSignal = changeScore = new ChangeScoreSignal();
        playerViewMediator.playerViewFactory = playerViewFactory;
        playerViewMediator.playerModel = playerModel;

        callsCounter = 0;
        passedId = null;
        passedScore = 0;
    }

    @AsyncTest
    public function should_handle_mouse_and_dispatch_signal(asyncFactory:AsyncFactory):Void {
        playerView = new PlayerView();
        playerView.setPlayerId(PlayerId.fromInt(2));
        playerViewMediator.view = playerView;

        playerViewMediator.onRegister();
        changeScore.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        var handler:Dynamic = asyncFactory.createHandler(this, mouseHandleTestComplete, 300);
        timer = Timer.delay(handler, 200);

        mc.name = AssetNames.PLUS_HITAREA;
        mc.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    private function mouseHandleTestComplete():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(2));
        Assert.areEqual(passedScore, 1);
    }

    @AsyncTest
    public function should_unregister_handler(asyncFactory:AsyncFactory):Void {
        playerView = new PlayerView();
        playerView.setPlayerId(PlayerId.fromInt(2));
        playerViewMediator.view = playerView;

        playerViewMediator.onRegister();
        playerViewMediator.preRemove();

        changeScore.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        var handler:Dynamic = asyncFactory.createHandler(this, mouseHandleRemovedTestComplete, 300);
        timer = Timer.delay(handler, 200);

        mc.name = AssetNames.PLUS_HITAREA;
        mc.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    private function mouseHandleRemovedTestComplete():Void {
        Assert.areEqual(callsCounter, 0);
        Assert.isNull(passedId);
        Assert.areEqual(passedScore, 0);
    }




    @Test
    public function should_set_textfield():Void {
        mockPlayerView();
        playerViewMediator.onRegister();
        playerView.setMainTextField(label).verify(1);
    }

    function mockPlayerView():Void {
        playerView = mock(PlayerView);
        playerView.getPlayerId().returns(PlayerId.fromInt(2));
        playerViewMediator.view = playerView;
    }

}

// Mockatoo can't mock MovieClip
class MovieClipMocked extends MovieClip {
    var label:TextField;

    public function new(label:TextField):Void {
        this.label = label;
        super();
    }

    override public function getChildByName(s:String):DisplayObject {
        if (s == AssetNames.SCORE || s == AssetNames.NAME) {
            return label;
        }
        return this;
    }
}