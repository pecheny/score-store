import massive.munit.TestSuite;

import commands.AddPlayerCommandTest;
import commands.ChangeScoreCommandTest;
import commands.RemovePlayerCommandTest;
import model.PlayerModelTest;

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
		add(model.PlayerModelTest);
	}
}
