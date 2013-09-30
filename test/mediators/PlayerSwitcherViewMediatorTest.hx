package mediators;
import massive.munit.Assert;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.RemovePlayerSignal;
import signals.AddPlayerSignal;
import view.PlayerSwitcherView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class PlayerSwitcherViewMediatorTest {
    var playerSwitcherViewMediator:PlayerSwitcherViewMediator;
    var playerSwitcherView:PlayerSwitcherView;
    var addPlayerSignal:AddPlayerSignal;
    var removePlayerSignal:RemovePlayerSignal;
    var timer:Timer;
    var callsCounter:Int;
    var passedId:PlayerId;

    @Before public function startup() {
        addPlayerSignal = new AddPlayerSignal();
        removePlayerSignal = new RemovePlayerSignal();
        playerSwitcherView = new PlayerSwitcherView();
        playerSwitcherView.playerId = PlayerId.fromInt(1);
        playerSwitcherViewMediator = new PlayerSwitcherViewMediator();
        playerSwitcherViewMediator.removePlayerSignal = removePlayerSignal;
        playerSwitcherViewMediator.addPlayerSignal = addPlayerSignal;
        playerSwitcherViewMediator.view = playerSwitcherView;

        callsCounter = 0;
        passedId = null;
    }

    @AsyncTest public function should_dispatch_enable_signal(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchEnableSignalHandler, 300);
        timer = Timer.delay(handler, 200);
        addPlayerSignal.add(function(id:PlayerId):Void {
            callsCounter++;
            passedId = id;
        });
        playerSwitcherViewMediator.onRegister();
        playerSwitcherViewMediator.turnOff();
        playerSwitcherView.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchEnableSignalHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(PlayerId.fromInt(1), passedId);
    }

    @AsyncTest public function should_dispatch_disable_signal(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldDispatchDisableSignalHandler, 300);
        timer = Timer.delay(handler, 200);
        removePlayerSignal.add(function(id:PlayerId):Void {
            callsCounter++;
            passedId = id;
        });
        playerSwitcherViewMediator.onRegister();
        playerSwitcherViewMediator.turnOn();
        playerSwitcherView.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
    }

    function shouldDispatchDisableSignalHandler():Void {
        Assert.areEqual(1, callsCounter);
        Assert.areEqual(PlayerId.fromInt(1), passedId);
    }
}