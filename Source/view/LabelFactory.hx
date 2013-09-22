package view;
import constants.PlayerViewStyle;
import constants.PlayerViewStyle.LabelStyle;
import flash.text.TextFormatAlign;
import flash.text.TextFormat;
import openfl.Assets;
import flash.text.Font;
import flash.text.TextField;
class LabelFactory {
    public function new() {
    }

    public function getLabel(fontSize:Int, fontColor:UInt, align:String, letterSpacing:Float):TextField {
        var fontAsset:Font = Assets.getFont("assets/DroidSans-Bold.ttf");
        var mTFormat:TextFormat = new TextFormat(fontAsset.fontName, fontSize);
        mTFormat.color = fontColor;
        mTFormat.align =
            #if flash
                    getAlignValue(align);
                    #else
                    align;
            #end
        mTFormat.leftMargin = 0;
        mTFormat.rightMargin = 0;
        mTFormat.indent = 0;
        mTFormat.blockIndent = 0;
        mTFormat.letterSpacing = letterSpacing;
        var mTF:TextField = new TextField();
        mTF.defaultTextFormat = mTFormat;
        mTF.embedFonts = true;
        mTF.selectable = false;
        return mTF;
    }

    public function getLabelFromStyle(style:LabelStyle):TextField {
        return getLabel(style.size, style.color, style.align, style.spacing);
    }

#if (flash)
    public function getAlignValue(string:String):TextFormatAlign {
        switch(string){
            case "left" :
                return TextFormatAlign.LEFT;
            case "right" :
                return TextFormatAlign.RIGHT;
            case "center" :
                return TextFormatAlign.CENTER;
            case "justify" :
                return TextFormatAlign.JUSTIFY;
        }
        throw string + "can't be interpreted as align value";
        return null;
    }
#end
}