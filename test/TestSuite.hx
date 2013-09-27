import massive.munit.TestSuite;

import commands.AddPlayerCommandTest;
import commands.CenterViewwVerticallyCommandTest;
import commands.ChangeScoreCommandTest;
import commands.EnterScoreInputModeCommandTest;
import commands.LayoutViewsCommandTest;
import commands.LeaveScoreInputModeCommandTest;
import commands.RemovePlayerCommandTest;
import mediators.ButtonMediatorTest;
import mediators.PlayerEditorViewMediatorTest;
import mediators.PlayerViewMediatorTest;
import mediators.ScoreInputViewMediatorTest;
import model.ButtonsModelTest;
import model.PlayerModelTest;
import model.PlayerViewsModelTest;
import signals.AddPlayerSignalTest;
import signals.ChangeScoreSignalTest;
import signals.RemovePlayerSignalTest;
import view.PlayerViewFactoryTest;
import view.PlayerViewTest;
import view.ViewBaseTest;

/**
 * Auto generated Test Suite for MassiveUnit.
 * Refer to munit command line tool for more information (haxelib run munit)
 */

class TestSuite extends massive.munit.TestSuite
{		

	public function new()
	{
		super();

		add(commands.AddPlayerCommandTest);
		add(commands.CenterViewwVerticallyCommandTest);
		add(commands.ChangeScoreCommandTest);
		add(commands.EnterScoreInputModeCommandTest);
		add(commands.LayoutViewsCommandTest);
		add(commands.LeaveScoreInputModeCommandTest);
		add(commands.RemovePlayerCommandTest);
		add(mediators.ButtonMediatorTest);
		add(mediators.PlayerEditorViewMediatorTest);
		add(mediators.PlayerViewMediatorTest);
		add(mediators.ScoreInputViewMediatorTest);
		add(model.ButtonsModelTest);
		add(model.PlayerModelTest);
		add(model.PlayerViewsModelTest);
		add(signals.AddPlayerSignalTest);
		add(signals.ChangeScoreSignalTest);
		add(signals.RemovePlayerSignalTest);
		add(view.PlayerViewFactoryTest);
		add(view.PlayerViewTest);
		add(view.ViewBaseTest);
	}
}
