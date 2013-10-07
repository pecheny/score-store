package commands;
import flash.system.System;
class ExitCommand extends mmvc.impl.Command {

    override public function execute():Void {
    #if mobile
        System.exit(0);
    #end
    }

}