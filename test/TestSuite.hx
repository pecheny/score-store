import massive.munit.TestSuite;

import commands.AddPlayerCommandTest;
import commands.ChangeScoreCommandTest;
import commands.RemovePlayerCommandTest;
import mediators.PlayerViewMediatorTest;
import model.PlayerModelTest;
import model.PlayerViewFactoryTest;
import model.PlayerViewsModelTest;
import signals.AddPlayerSignalTest;
import signals.ChangeScoreSignalTest;
import signals.RemovePlayerSignalTest;
import view.PlayerViewTest;

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
		add(commands.RemovePlayerCommandTest);
		add(mediators.PlayerViewMediatorTest);
		add(model.PlayerModelTest);
		add(model.PlayerViewFactoryTest);
		add(model.PlayerViewsModelTest);
		add(signals.AddPlayerSignalTest);
		add(signals.ChangeScoreSignalTest);
		add(signals.RemovePlayerSignalTest);
		add(view.PlayerViewTest);
	}
}
