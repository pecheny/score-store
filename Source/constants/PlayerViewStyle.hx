package constants;
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

    public static var NAME_EDITOR_DELETE:String = "_delete";
    public static var NAME_EDITOR_NAME:String = "_name";
    public static var NAME_EDITOR_AVATAR:String = "_avatar";

    public static var NAME_EDITOR_DELETE_HITAREA:String = "_delete_hitArea";
    public static var NAME_EDITOR_NAME_HITAREA:String = "_name_hitArea";
    public static var NAME_EDITOR_AVATAR_HITAREA:String = "_avatar_hitArea";


    public static var CORNER_RADIUS:Float = 50;
    public static var UNIT_HEIGHT:Float = 140;
    public static var UNIT_WIDTH:Float = 500;


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
    spacing : 0,
    color:0xffffff,
    align:"left"};
    val;
    };

    public static var STYLE_SCORE_INPUT_DIGIT:LabelStyle = {
    var val:LabelStyle = {
    size : 82,
    spacing : 0,
    color:0xffffff,
    align:"left"};
    val;
    };

    public static var STYLE_SCORE_INPUT_VALUE:LabelStyle = {
    var val:LabelStyle = {
    size : 82,
    spacing : 0,
    color:0xffffff,
    align:"center"};
    val;
    };

    public static var STYLE_NAME_EDITOR:LabelStyle = {
    var val:LabelStyle = Reflect.copy(STYLE_NAME);
    val.color = 0;
    val;
    };

}