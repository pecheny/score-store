import massive.munit.TestSuite;

import commands.AddPlayerCommandTest;
import commands.ChangeScoreCommandTest;
import commands.LayoutViewsCommandTest;
import commands.RemovePlayerCommandTest;
import mediators.PlayerViewMediatorTest;
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
		add(commands.ChangeScoreCommandTest);
		add(commands.LayoutViewsCommandTest);
		add(commands.RemovePlayerCommandTest);
		add(mediators.PlayerViewMediatorTest);
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
