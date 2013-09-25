package mediators;
import flash.display.Sprite;
import mockatoo.Mockatoo.Matcher;
import flash.events.MouseEvent;
import haxe.Timer;
import massive.munit.async.AsyncFactory;
import msignal.Signal.Signal0;
import model.ButtonsModel;
import view.Button;
import mediators.ButtonMediator;
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;

class ButtonMediatorTest  {
    public var buttonMediator:ButtonMediator;
    public var button:Button;
    public var buttonsModel:ButtonsModel;
    public var signal:Signal0;
    var timer:Timer;

    @Before
    public function startup():Void {
        signal = mock(Signal0);
        button = new Button(new Sprite());
        buttonsModel = mock(ButtonsModel);
        buttonsModel.getSignal(button).returns(signal);

        buttonMediator = new ButtonMediator();
        buttonMediator.buttonsModel = buttonsModel;
        buttonMediator.view = button;
    }

    @AsyncTest public function should_dispatch_signal_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchSignalOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        buttonMediator.onRegister();
        button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchSignalOnClickHandler():Void {
        signal.dispatch().verify(1);
    }

    @AsyncTest public function should_unregister_signal_on_click(asyncFactory:AsyncFactory):Void {
            var handler:Dynamic = asyncFactory.createHandler(this, shouldUnregisterSignalOnClickHandler, 300);
            timer = Timer.delay(handler, 200);
            buttonMediator.onRegister();
            buttonMediator.preRemove();
            button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        function shouldUnregisterSignalOnClickHandler():Void {
            signal.dispatch().verify(0);
        }




}