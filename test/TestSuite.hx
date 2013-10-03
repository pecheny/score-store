import massive.munit.TestSuite;

import commands.CenterViewVerticallyCommandTest;
import commands.ChangeScoreCommandTest;
import commands.DisablePlayerCommandTest;
import commands.EnablePlayerCommandTest;
import commands.EnterPlayersChooseCommandTest;
import commands.EnterScoreInputModeCommandTest;
import commands.LayoutViewsCommandTest;
import commands.LeavePlayersChooseCommandTest;
import commands.LeaveScoreInputModeCommandTest;
import commands.StartNewGameCommandTest;
import mediators.ApplicationViewMediatorTest;
import mediators.ButtonMediatorTest;
import mediators.ModalBackgroundViewMediatorTest;
import mediators.PlayerEditorViewMediatorTest;
import mediators.PlayersChooserViewMediatorTest;
import mediators.PlayerSwitcherViewMediatorTest;
import mediators.PlayerViewMediatorTest;
import mediators.ScoreInputViewMediatorTest;
import mediators.ScrollContainerMediatorTest;
import mediators.ScrollerBackgroundViewMediatorTest;
import model.ButtonsModelTest;
import model.PlayerModelTest;
import model.PlayerViewsModelTest;
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

		add(commands.CenterViewVerticallyCommandTest);
		add(commands.ChangeScoreCommandTest);
		add(commands.DisablePlayerCommandTest);
		add(commands.EnablePlayerCommandTest);
		add(commands.EnterPlayersChooseCommandTest);
		add(commands.EnterScoreInputModeCommandTest);
		add(commands.LayoutViewsCommandTest);
		add(commands.LeavePlayersChooseCommandTest);
		add(commands.LeaveScoreInputModeCommandTest);
		add(commands.StartNewGameCommandTest);
		add(mediators.ApplicationViewMediatorTest);
		add(mediators.ButtonMediatorTest);
		add(mediators.ModalBackgroundViewMediatorTest);
		add(mediators.PlayerEditorViewMediatorTest);
		add(mediators.PlayersChooserViewMediatorTest);
		add(mediators.PlayerSwitcherViewMediatorTest);
		add(mediators.PlayerViewMediatorTest);
		add(mediators.ScoreInputViewMediatorTest);
		add(mediators.ScrollContainerMediatorTest);
		add(mediators.ScrollerBackgroundViewMediatorTest);
		add(model.ButtonsModelTest);
		add(model.PlayerModelTest);
		add(model.PlayerViewsModelTest);
		add(view.PlayerViewFactoryTest);
		add(view.PlayerViewTest);
		add(view.ViewBaseTest);
	}
}
