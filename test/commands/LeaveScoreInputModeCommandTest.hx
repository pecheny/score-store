package commands;
import view.ScoreInputView;
import view.ApplicationView;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;
class LeaveScoreInputModeCommandTest {
    var leaveScoreInputModeCommand:LeaveScoreInputModeCommand;
    var applicationView:ApplicationView;
    var scoreInputView:ScoreInputView;

    @Before public function startup() {
        leaveScoreInputModeCommand = new LeaveScoreInputModeCommand();
        applicationView = mock(ApplicationView);
        scoreInputView = new ScoreInputView();
        leaveScoreInputModeCommand.applicationView = applicationView;
        leaveScoreInputModeCommand.scoreInputView = scoreInputView;
    }

    @Test public function should_remove_ui_instance_to_appView():Void {
        leaveScoreInputModeCommand.execute();
        applicationView.removeChild(scoreInputView).verify(1);
    }
}