package commands;
import org.hamcrest.MatchersBase;
import flash.display.DisplayObject;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.RemoveChildSignal;
import view.ModalBackgroundView;
import view.PlayersChooserView;
import view.ApplicationView;
import mockatoo.Mockatoo;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class LeavePlayersChooseCommandTest extends MatchersBase {
    var leavePlayersChooseCommand:LeavePlayersChooseCommand;
    var applicationView:ApplicationView;
    var playersChooserView:PlayersChooserView;
    var modalBackgroundView:ModalBackgroundView;
    var timer:Timer;


    var passedChilds:Array<DisplayObject>;


    @Before public function startup() {
        modalBackgroundView = mock(ModalBackgroundView);
        playersChooserView = mock(PlayersChooserView);
        applicationView = mock(ApplicationView);
        leavePlayersChooseCommand = new LeavePlayersChooseCommand();
        leavePlayersChooseCommand.applicationView = applicationView;
        leavePlayersChooseCommand.playersChooserView = playersChooserView;
        leavePlayersChooseCommand.modalBackgroundView = modalBackgroundView;
        leavePlayersChooseCommand.removeChildSignal = new RemoveChildSignal();


        passedChilds = new Array<DisplayObject>();
    }


    @AsyncTest public function should_remove_modal_background_and_chooser(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRemoveModalBackgroundHandler, 300);
        timer = Timer.delay(handler, 200);
        leavePlayersChooseCommand.removeChildSignal.add(function(child):Void {
            passedChilds.push(child);
        });
        leavePlayersChooseCommand.execute();

    }

    function shouldRemoveModalBackgroundHandler():Void {
        assertThat(passedChilds, hasItemInArray(playersChooserView));
        assertThat(passedChilds, hasItemInArray(modalBackgroundView));
    }
}

