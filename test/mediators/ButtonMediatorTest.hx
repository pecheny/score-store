package mediators;
import massive.munit.Assert;
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
    var buttonMediator:ButtonMediator;
    var button:Button;
    var buttonsModel:ButtonsModel;
    var callsCounter:Int;
    var timer:Timer;

    @Before
    public function startup():Void {
        button = new Button(new Sprite());
        buttonsModel = mock(ButtonsModel);
        buttonsModel.getCallback(button).returns(function(){callsCounter++;});
        buttonMediator = new ButtonMediator();
        buttonMediator.buttonsModel = buttonsModel;
        buttonMediator.view = button;
        callsCounter = 0;
    }

    @AsyncTest public function should_run_callback_signal_on_click(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRunCallbackOnClickHandler, 300);
        timer = Timer.delay(handler, 200);
        buttonMediator.onRegister();
        button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldRunCallbackOnClickHandler():Void {
        Assert.areEqual(1, callsCounter);
    }

    @AsyncTest public function shouldnt_run_callback_signal_on_click_after_remove(asyncFactory:AsyncFactory):Void {
            var handler:Dynamic = asyncFactory.createHandler(this, shouldntRunCallbackOnClickHandler, 300);
            timer = Timer.delay(handler, 200);
            buttonMediator.onRegister();
            buttonMediator.preRemove();
            button.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
        }

        function shouldntRunCallbackOnClickHandler():Void {
            Assert.areEqual(0, callsCounter);
        }




}