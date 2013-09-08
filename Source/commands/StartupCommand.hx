package commands;
import signals.AddPlayerSignal;
class StartupCommand extends mmvc.impl.Command {


    @inject
    public var addPlayerSignal:AddPlayerSignal;

    override public function execute():Void {
        addPlayerSignal.dispatch();
    }

}