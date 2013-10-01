package mediators;
import model.PlayerModel;
import model.vo.PlayerId;
import flash.events.MouseEvent;
import signals.AddPlayerSignal;
import signals.RemovePlayerSignal;
import view.PlayerSwitcherView;
class PlayerSwitcherViewMediator extends mmvc.impl.Mediator<PlayerSwitcherView> {
    @inject public var addPlayerSignal:AddPlayerSignal;
    @inject public var removePlayerSignal:RemovePlayerSignal;
    @inject public var playerModel:PlayerModel;
    var playerId:PlayerId;
    var playerSwitcherView:PlayerSwitcherView;
    public var enabled(default, null):Bool;

    override public function onRegister():Void {
        playerSwitcherView = cast view;
        playerId = playerSwitcherView.playerId;
        playerSwitcherView.mouseChildren = false;
//        playerSwitcherView.backgroundColor = 0xffffff;
        playerSwitcherView.initBounds(100, 100, 1);
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
        playerSwitcherView.alpha = 0.5;
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