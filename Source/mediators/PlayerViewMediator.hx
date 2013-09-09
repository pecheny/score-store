package mediators;
import view.ApplicationView;
class PlayerViewMediator extends mmvc.impl.Mediator<ApplicationView> {
    public function new() {
        super();
    }


    override function onRegister() {
        trace("player's mediator");
        super.onRegister();
    }


    override public function onRemove():Void {
        super.onRemove();
    }
}