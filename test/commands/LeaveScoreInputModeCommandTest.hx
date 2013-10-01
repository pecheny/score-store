package commands;
import flash.display.DisplayObject;
import massive.munit.Assert;
import massive.munit.async.AsyncFactory;
import haxe.Timer;
import signals.RemoveChildSignal;
import view.ScoreInputView;
import view.ApplicationView;
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;
class LeaveScoreInputModeCommandTest {
    var leaveScoreInputModeCommand:LeaveScoreInputModeCommand;
    var applicationView:ApplicationView;
    var scoreInputView:ScoreInputView;


    var passedChild:DisplayObject;
    var timer:Timer;

    @Before public function startup() {
        leaveScoreInputModeCommand = new LeaveScoreInputModeCommand();
        applicationView = mock(ApplicationView);
        scoreInputView = new ScoreInputView();
        leaveScoreInputModeCommand.applicationView = applicationView;
        leaveScoreInputModeCommand.scoreInputView = scoreInputView;
        leaveScoreInputModeCommand.removeChildSignal = new RemoveChildSignal();
        passedChild = null;
    }


    @AsyncTest public function should_remove_ui_instance_to_appView(asyncFactory:AsyncFactory):Void {
        var handler:Dynamic = asyncFactory.createHandler(this, shouldRemoveUiInstanceToAppviewHandler, 300);
        timer = Timer.delay(handler, 200);
        leaveScoreInputModeCommand.removeChildSignal.add(function(child):Void {
            passedChild = child;
        });
        leaveScoreInputModeCommand.execute();

    }

    function shouldRemoveUiInstanceToAppviewHandler():Void {
        Assert.areEqual(scoreInputView, passedChild);
    }
}

