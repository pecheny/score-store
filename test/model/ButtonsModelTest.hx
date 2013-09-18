package model;

import massive.munit.Assert;
import msignal.Signal.Signal0;
import org.hamcrest.MatchersBase;
import view.ViewBase;
import org.hamcrest.MatcherAssert;
using org.hamcrest.MatcherAssert;
import mockatoo.Mockatoo.
* ;
using mockatoo.Mockatoo;

class ButtonsModelTest extends MatchersBase {
    var buttonsModel:ButtonsModel;

    @Before
    public function setup():Void {
        buttonsModel = new ButtonsModel();
    }

    @Test public function should_register_and_check_button_by_name():Void {
        var button:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name = "Name";
        Assert.isFalse(buttonsModel.hasButtonRegistred(name));
        buttonsModel.registerButtonType(name, button, signal);
        Assert.isTrue(buttonsModel.hasButtonRegistred(name));
    }

    @Test public function should_register_and_check_button_by_view():Void {
        var button:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name = "Name";
        Assert.isFalse(buttonsModel.hasButtonRegistred(button));
        buttonsModel.registerButtonType(name, button, signal);
        Assert.isTrue(buttonsModel.hasButtonRegistred(button));
    }

    @Test public function should_throw_on_check_button_by_wrong_type():Void {
        var button:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name = "Name";
        buttonsModel.registerButtonType(name, button, signal);
        var msg:String = "";
        try {
            buttonsModel.hasButtonRegistred(signal);
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ErrorConsts.ERROR_COMMON);
    }

    @Test public function should_enable_one_registered_button():Void {
        var button:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name = "Name";
        buttonsModel.registerButtonType(name, button, signal);
        buttonsModel.enableButtons(name);
        var activeButtons = buttonsModel.getActiveButtons();
        Assert.isNotNull(activeButtons);
        assertThat(activeButtons, arrayWithSize(1));
        assertThat(activeButtons, hasItemInArray(button));
    }

    @Test public function should_enable_registered_buttons():Void {
        var button1:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name1 = "Name1";
        var button2:ViewBase = mock(ViewBase);
        var name2 = "Name2";

        buttonsModel.registerButtonType(name1, button1, signal);
        buttonsModel.registerButtonType(name2, button2, signal);
        buttonsModel.enableButtons(name1, name2);
        var activeButtons = buttonsModel.getActiveButtons();
        assertThat(activeButtons, arrayWithSize(2));
        assertThat(activeButtons, hasItemInArray(button1));
        assertThat(activeButtons, hasItemInArray(button2));
    }

    @Test public function should_throw_on_enable_buttons_wasnt_registered():Void {
        var msg:String = "";
        try {
            buttonsModel.enableButtons("NotRegisteredName");
        } catch (e:String) {
            msg = e;
        }
        Assert.areEqual(msg, ErrorConsts.ERROR_COMMON);
    }

    @Test public function should_reset_buttons():Void {
        var button1:ViewBase = mock(ViewBase);
        var signal = new Signal0();
        var name1 = "Name1";
        var button2:ViewBase = mock(ViewBase);
        var name2 = "Name2";

        buttonsModel.registerButtonType(name1, button1, signal);
        buttonsModel.registerButtonType(name2, button2, signal);
        buttonsModel.enableButtons(name1, name2);

        buttonsModel.resetButtons();
        var activeButtons = buttonsModel.getActiveButtons();
        assertThat(activeButtons, emptyArray());
    }

    @Test public function should_return_signal_by_button():Void {
        var button1:ViewBase = mock(ViewBase);
        var signal1 = new Signal0();
        var signal2 = new Signal0();
        var name1 = "Name1";
        var button2:ViewBase = mock(ViewBase);
        var name2 = "Name2";

        buttonsModel.registerButtonType(name1, button1, signal1);
        buttonsModel.registerButtonType(name2, button2, signal2);

        Assert.areEqual(buttonsModel.getSignal(button1), signal1);
        Assert.areEqual(buttonsModel.getSignal(button2), signal2);
    }


}