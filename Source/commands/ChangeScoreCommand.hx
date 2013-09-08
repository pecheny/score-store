package commands;
import signals.ChangeScoreSignal;
class ChangeScoreCommand extends mmvc.impl.Command {


    @inject
    public var mySignal:ChangeScoreSignal;

    override public function execute():Void {

    }

}