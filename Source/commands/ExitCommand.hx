package commands;
import flash.system.System;
class ExitCommand extends mmvc.impl.Command {

    override public function execute():Void {
        System.exit(0);
    }

}