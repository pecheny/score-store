package model;
import constants.ErrorConsts;
import msignal.Signal;
import view.ViewBase;
using Lambda;
class ButtonsModel {
    public static var KEY_EXISTS:String = "Key exists";
    public static var VALUE_EXISTS:String = "Value exists";
    public static var VALUE_NOT_EXISTS:String = "Value does not exist";

    var customViews:Map<String, ViewBase>;
    var activeButtons:Array<ViewBase>;
    var buttonSignals:Map<ViewBase, Signal0>;

    public function new():Void {
        customViews = new Map<String, ViewBase>();
        buttonSignals = new Map<ViewBase, Signal0>();
        activeButtons = new Array<ViewBase>();
    }


    public function registerButtonType(name:String, view:ViewBase, signal:Signal0):Void {
        if (customViews.exists(name)) {
            throw KEY_EXISTS;
        }
        if (customViews.has(view)) {
            throw VALUE_EXISTS;
        }
        customViews[name] = view;
        buttonSignals[view] = signal;
    }

    public function enableButtons(button1:String, ?button2:Null<String>, ?button3:Null<String>):Void {
        resetButtons();
        enableButton(button1);
        if (button2 != null) {
            enableButton(button2);
        };
        if (button3 != null) {
            enableButton(button3);
        }
    }

    function enableButton(buttonName:String):Void {
        if (!customViews.exists(buttonName)) {
            throw ErrorConsts.ERROR_COMMON;
        }
        var button = customViews[buttonName];
        activeButtons.push(button);
    }

    public function hasButtonRegistred(value:Dynamic):Bool {
        if (Std.is(value, String)) {
            return customViews.exists(value);
        }
        else if (Std.is(value, ViewBase)) {
            return customViews.has(value);
        } else {
            throw ErrorConsts.ERROR_COMMON;
        }
    }

    public function resetButtons():Void {
        activeButtons = new Array<ViewBase>();
    }

    public function getActiveButtons():Array<ViewBase> {
        return activeButtons.copy();
    }

    public function getSignal(button:ViewBase):Signal0 {
        if (hasButtonRegistred(button)) {
            return buttonSignals[button];
        }
        throw ErrorConsts.ERROR_COMMON;
    }


}