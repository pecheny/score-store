package commands;
class EmptyCommand extends mmvc.impl.Command {

    override public function execute():Void {
        trace(signal);
    }

}