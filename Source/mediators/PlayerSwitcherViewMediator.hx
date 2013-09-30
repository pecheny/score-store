package mediators;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import signals.AddPlayerSignal;
import signals.RemovePlayerSignal;
import view.PlayerSwitcherView;
class PlayerSwitcherViewMediator extends mmvc.impl.Mediator<PlayerSwitcherView> {
    @inject public var addPlayerSignal:AddPlayerSignal;
    @inject public var removePlayerSignal:RemovePlayerSignal;
    var playerId:PlayerId;
    var playerSwitcherView:PlayerSwitcherView;
    var enabled:Bool;

    override public function onRegister():Void {
        playerSwitcherView = cast view;
        playerId = playerSwitcherView.playerId;
        playerSwitcherView.mouseChildren = false;
        playerSwitcherView.addEventListener(MouseEvent.CLICK, clickHandler);
    }

    override public function preRemove():Void {
        playerSwitcherView.removeEventListener(MouseEvent.CLICK, clickHandler);
        playerSwitcherView.clearChildren();
    }

    public function turnOn():Void {
        enabled = true;
    }

    public function turnOff():Void {
        enabled = false;

    }

    public function switchState():Void {
        if (enabled) {
            turnOff();
            removePlayerSignal.dispatch(playerId);
        } else {
            turnOn();
            addPlayerSignal.dispatch(playerId);
        }
    }

    private function clickHandler(e:MouseEvent):Void {
        switchState();
    }
}