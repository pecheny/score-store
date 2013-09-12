package mediators;
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
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;
using org.hamcrest.MatcherAssert;

class PlayerViewMediatorTest extends MatchersBase {
    public var playerViewMediator:PlayerViewMediator;
    var view:PlayerView;
    var passedId:PlayerId;
    var passedEvent:Event;
    var callsCounter:Int = 0;
    var timer:Timer;
    var signal:PlayerButtonSignal;
    var label:TextField;

    @Before
    public function startup():Void {
        label = new TextField();
        label.text = "foobar";

        var labelFactory:LabelFactory = mock(LabelFactory);
        labelFactory.getLabel(cast Matcher.any, cast Matcher.any).returns(label);
        signal = new PlayerButtonSignal();
        playerViewMediator = new PlayerViewMediator();
        playerViewMediator.labelFactory = labelFactory;
        playerViewMediator.playerButtonSignal = signal;

    }

    @AsyncTest
    public function should_handle_mouse_and_dispatch_signal(asyncFactory:AsyncFactory):Void {
        view = new PlayerView();
        view.setPlayerId(PlayerId.fromInt(2));
        playerViewMediator.view = view;

        playerViewMediator.onRegister();
        signal.add(function(id:PlayerId, event:Event) {
            callsCounter++;
            passedId = id;
            passedEvent = event;
        });
        var handler:Dynamic = asyncFactory.createHandler(this, mouseHandleTestComplete, 300);
        timer = Timer.delay(handler, 200);
        view.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    private function mouseHandleTestComplete():Void {
        Assert.areEqual(callsCounter, 1);
        Assert.areEqual(passedId, PlayerId.fromInt(2));
        MatcherAssert.assertThat(passedEvent, instanceOf(MouseEvent));
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