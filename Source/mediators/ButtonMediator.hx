package mediators;
import model.ButtonsModel;
import flash.events.MouseEvent;
import view.Button;
class ButtonMediator extends mmvc.impl.Mediator<Button> {

    @inject public var buttonsModel:ButtonsModel;

    override public function onRegister():Void {
        view.addEventListener(MouseEvent.CLICK, mouseHandler);
    }

    override public function preRemove():Void {
        view.removeEventListener(MouseEvent.CLICK, mouseHandler);
    }


    function mouseHandler(e:MouseEvent) {
    trace("Boo");
        var signal = buttonsModel.getSignal(view);
        signal.dispatch();
    }

}