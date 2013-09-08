package commands;
import signals.RemovePlayerSignal;
class RemovePlayerCommand extends mmvc.impl.Command {


    @inject
    public var mySignal:RemovePlayerSignal;

    public function new() {
        super();
    }

    override public function execute():Void {

    }

}