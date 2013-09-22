package mediators;
import signals.ChangeScoreSignal;
import constants.PlayerViewStyle;
import flash.display.DisplayObject;
import view.AssetsModel;
import flash.display.MovieClip;
import org.hamcrest.MatchersBase;
import org.hamcrest.MatcherAssert;
import org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo;
import view.LabelFactory;
import flash.text.TextField;
import massive.munit.async.AsyncFactory;
import massive.munit.Assert;
import flash.events.Event;
import flash.events.MouseEvent;
import model.vo.PlayerId;
import signals.PlayerButtonSignal;
import view.PlayerView;
import massive.munit.util.Timer;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
using org.hamcrest.MatcherAssert;

class PlayerViewMediatorTest extends MatchersBase {
    public var playerViewMediator:PlayerViewMediator;
    var view:PlayerView;
    var passedId:PlayerId;
    var passedScore:Int;
    var callsCounter:Int = 0;
    var timer:Timer;
    var signal:ChangeScoreSignal;
    var label:TextField;
    var mc:MovieClip;

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
        signal = new ChangeScoreSignal();
        playerViewMediator = new PlayerViewMediator();
        playerViewMediator.layout = layout;
        playerViewMediator.labelFactory = labelFactory;
        playerViewMediator.changeScoreSignal = signal;
    }

    @AsyncTest
    public function should_handle_mouse_and_dispatch_signal(asyncFactory:AsyncFactory):Void {
        view = new PlayerView();
        view.setPlayerId(PlayerId.fromInt(2));
        playerViewMediator.view = view;

        playerViewMediator.onRegister();
        signal.add(function(id:PlayerId, delta:Int) {
            callsCounter++;
            passedId = id;
            passedScore = delta;
        });
        var handler:Dynamic = asyncFactory.createHandler(this, mouseHandleTestComplete, 300);
        timer = Timer.delay(handler, 200);

        mc.name = PlayerViewStyle.NAME_PLUS_HITAREA;
        mc.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    private function mouseHandleTestComplete():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(2));
        Assert.areEqual(passedScore, 1);
    }

    @Test
    public function should_set_textfield():Void {
        view = mock(PlayerView);
        view.getPlayerId().returns(PlayerId.fromInt(2));
        playerViewMediator.view = view;

        playerViewMediator.onRegister();
        view.setMainTextField(label).verify(1);
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
        if (s == PlayerViewStyle.NAME_SCORE || s == PlayerViewStyle.NAME_NAME) {
            return label;
        }
        return this;
    }
}