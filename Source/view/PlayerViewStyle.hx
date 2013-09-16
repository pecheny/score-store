package view;
typedef LabelStyle = {
size:Int,
spacing:Float,
color:UInt,
align:String
}
class PlayerViewStyle {

    public static var GRID_STEP:Int = 20;

    public static var NAME_NAME:String = "_name";
    public static var NAME_SCORE:String = "_score";
    public static var NAME_BACKGROUND:String = "_background";
    public static var NAME_PLUS_VIEW:String = "_plus_view";
    public static var NAME_PLUS_HITAREA:String = "_plus_hitArea";
    public static var NAME_MINUS_VIEW:String = "_minus_view";
    public static var NAME_MINUS_HITAREA:String = "_minus_hitArea";
    public static var NAME_SCORE_HITAREA:String = "_score_hitArea";

    public static var STYLE_SCORE:LabelStyle = {
    var val:LabelStyle = {
    size : 92,
    spacing : 0,
    color:0xffffff,
    align:"right"};
    val;
    };

    public static var STYLE_NAME:LabelStyle = {
    var val:LabelStyle = {
    size : 32,
    spacing : - 3,
    color:0xffffff,
    align:"left"};
    val;
    };

}