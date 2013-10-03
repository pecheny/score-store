package model;

import constants.ButtonName;
import mockatoo.Mockatoo;
import constants.ErrorConsts;
import massive.munit.Assert;
import org.hamcrest.MatchersBase;
import view.ViewBase;
import org.hamcrest.MatcherAssert;
using org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo.* ;
using mockatoo.Mockatoo;

class ButtonsModelTest extends MatchersBase {
    var buttonsModel:ButtonsModel;

    @Before
    public function setup():Void {
        buttonsModel = new ButtonsModel();
    }

    @Test public function should_register_and_check_button_by_name():Void {
        var button:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name = ButtonName.Exit;
        Assert.isFalse(buttonsModel.hasButtonRegistred(name));
        buttonsModel.registerButtonType(name, button, callback);
        Assert.isTrue(buttonsModel.hasButtonRegistred(name));
    }

    @Test public function should_register_and_check_button_by_view():Void {
        var button:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name = ButtonName.Exit;
        Assert.isFalse(buttonsModel.hasButtonRegistred(button));
        buttonsModel.registerButtonType(name, button, callback);
        Assert.isTrue(buttonsModel.hasButtonRegistred(button));
    }

    @Test public function should_throw_on_check_button_by_wrong_type():Void {
        var button:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name = ButtonName.Exit;
        buttonsModel.registerButtonType(name, button, callback);
        var msg:String = "";
        try {
            buttonsModel.hasButtonRegistred(callback);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ErrorConsts.ERROR_COMMON);
    }

    @Test public function should_enable_one_registered_button():Void {
        var button:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name = ButtonName.Exit;
        buttonsModel.registerButtonType(name, button, callback);
        buttonsModel.enableButtons(name);
        var activeButtons = buttonsModel.getActiveButtons();
        Assert.isNotNull(activeButtons);
        assertThat(activeButtons, arrayWithSize(1));
        assertThat(activeButtons, hasItemInArray(button));
    }

    @Test public function should_enable_registered_buttons():Void {
        var button1:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name1 = ButtonName.Exit;
        var button2:ViewBase = mock(ViewBase);
        var name2 = ButtonName.AddPlayer;

        buttonsModel.registerButtonType(name1, button1, callback);
        buttonsModel.registerButtonType(name2, button2, callback);
        buttonsModel.enableButtons(name1, name2);
        var activeButtons = buttonsModel.getActiveButtons();
        assertThat(activeButtons, arrayWithSize(2));
        assertThat(activeButtons, hasItemInArray(button1));
        assertThat(activeButtons, hasItemInArray(button2));
    }

    @Test public function should_throw_on_enable_buttons_wasnt_registered():Void {
        var msg:String = "";
        try {
            buttonsModel.enableButtons(ButtonName.AddPlayer);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ErrorConsts.ERROR_COMMON);
    }

    @Test public function should_reset_buttons():Void {
        var button1:ViewBase = mock(ViewBase);
        var callback = function(){};
        var name1 = ButtonName.Exit;
        var button2:ViewBase = mock(ViewBase);
        var name2 = ButtonName.AddPlayer;

        buttonsModel.registerButtonType(name1, button1, callback);
        buttonsModel.registerButtonType(name2, button2, callback);
        buttonsModel.enableButtons(name1, name2);

        buttonsModel.resetButtons();
        var activeButtons = buttonsModel.getActiveButtons();
        assertThat(activeButtons, emptyArray());
    }

    @Test public function should_return_signal_by_button():Void {
        var button1:ViewBase = mock(ViewBase);
        var callback1 = function(){};
        var callback = function(){};
        var name1 = ButtonName.Exit;
        var button2:ViewBase = mock(ViewBase);
        var name2 = ButtonName.AddPlayer;

        buttonsModel.registerButtonType(name1, button1, callback1);
        buttonsModel.registerButtonType(name2, button2, callback);

        Assert.areEqual(buttonsModel.getCallback(button1), callback1);
        Assert.areEqual(buttonsModel.getCallback(button2), callback);
    }


}