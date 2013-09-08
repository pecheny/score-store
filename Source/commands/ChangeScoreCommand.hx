package commands;
import signals.ChangeScoreSignal;
class ChangeScoreCommand extends mmvc.impl.Command {


    @inject
    public var mySignal:ChangeScoreSignal;

    public function new() {
        super();
    }

    override public function execute():Void {

    }

}