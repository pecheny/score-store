package model;
import constants.ButtonName;
import constants.ErrorConsts;
import msignal.Signal;
import view.ViewBase;
using Lambda;
class ButtonsModel {
    public static var KEY_EXISTS:String = "Key exists";
    public static var VALUE_EXISTS:String = "Value exists";
    public static var VALUE_NOT_EXISTS:String = "Value does not exist";

    var customViews:Map<ButtonName, ViewBase>;
    var activeButtons:Array<ViewBase>;
    var buttonHandlers:Map<ViewBase, Void -> Void>;

    public function new():Void {
        customViews = new Map<ButtonName, ViewBase>();
        buttonHandlers = new Map<ViewBase, Void -> Void>();
        activeButtons = new Array<ViewBase>();
    }


    public function registerButtonType(name:ButtonName, view:ViewBase, callback:Void -> Void):Void {
        if (customViews.exists(name)) {
            throw KEY_EXISTS;
        }
        if (customViews.has(view)) {
            throw VALUE_EXISTS;
        }
        customViews[name] = view;
        buttonHandlers[view] = callback;
    }

    public function enableButtons(button1:ButtonName, ?button2:Null<ButtonName>, ?button3:Null<ButtonName>):Void {
        resetButtons();
        enableButton(button1);
        if (button2 != null) {
            enableButton(button2);
        };
        if (button3 != null) {
            enableButton(button3);
        }
    }

    function enableButton(buttonName:ButtonName):Void {
        if (!customViews.exists(buttonName)) {
            throw ErrorConsts.ERROR_COMMON;
        }
        var button = customViews[buttonName];
        activeButtons.push(button);
    }

    public function hasButtonRegistred(value:Dynamic):Bool {
        if (Std.is(value, ButtonName)) {
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

    public function getCallback(button:ViewBase):Void -> Void {
        if (hasButtonRegistred(button)) {
            return buttonHandlers[button];
        }
        throw ErrorConsts.ERROR_COMMON;
    }


}