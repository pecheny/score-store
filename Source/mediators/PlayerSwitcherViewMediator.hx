package mediators;
import model.PlayerModel;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import signals.EnablePlayerSignal;
import signals.DisablePlayerSignal;
import view.PlayerSwitcherView;
class PlayerSwitcherViewMediator extends mmvc.impl.Mediator<PlayerSwitcherView> {
    @inject public var addPlayerSignal:EnablePlayerSignal;
    @inject public var removePlayerSignal:DisablePlayerSignal;
    @inject public var playerModel:PlayerModel;
    var playerId:PlayerId;
    var playerSwitcherView:PlayerSwitcherView;
    public var enabled(default, null):Bool;

    override public function onRegister():Void {
        playerSwitcherView = cast view;
        playerId = playerSwitcherView.playerId;
        playerSwitcherView.mouseChildren = false;
        playerSwitcherView.backgroundAlpha = 0;
        playerSwitcherView.initBounds(100, 110, 0);
        playerSwitcherView.addEventListener(MouseEvent.CLICK, clickHandler);
        if (playerModel.hasPLayer(playerId)) {
            turnOn();
        } else {
            turnOff();
        }
    }

    override public function preRemove():Void {

        playerSwitcherView.removeEventListener(MouseEvent.CLICK, clickHandler);
        playerSwitcherView.clearChildren();
    }

    public function turnOn():Void {
        enabled = true;
        playerSwitcherView.alpha = 1;
    }

    public function turnOff():Void {
        enabled = false;
        playerSwitcherView.alpha = 0.1;
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