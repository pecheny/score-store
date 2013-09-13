package view;
import flash.text.TextFormatAlign;
import flash.text.TextFormat;
import openfl.Assets;
import flash.text.Font;
import flash.text.TextField;
class LabelFactory {
    public function new() {
    }

    public function getLabel(fontSize:Int, fontColor:UInt, align:TextFormatAlign, letterSpacing:Float):TextField {
        var fontAsset:Font = Assets.getFont("assets/DroidSans-Bold.ttf");
        var mTFormat:TextFormat = new TextFormat(fontAsset.fontName, fontSize);
        mTFormat.color = fontColor;
        mTFormat.align = align;
        mTFormat.leftMargin = 0;
        mTFormat.rightMargin = 0;
        mTFormat.indent = 0;
        mTFormat.blockIndent = 0;
        mTFormat.letterSpacing = letterSpacing;
        var mTF:TextField = new TextField();
        mTF.defaultTextFormat = mTFormat;
        mTF.embedFonts = true;
        return mTF;
    }
}