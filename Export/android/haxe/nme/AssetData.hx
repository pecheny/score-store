package nme;


import openfl.Assets;


class AssetData {
	
	
	public static var library:Map <String, LibraryType>;
	public static var path:Map <String, String>;
	public static var type:Map <String, AssetType>;
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			path = new Map<String, String> ();
			type = new Map<String, AssetType> ();
			library = new Map<String, LibraryType> ();
			
			path.set ("assets/CounterAssets.fla", "assets_counterassets_fla");
			type.set ("assets/CounterAssets.fla", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/CounterAssets.swc", "assets_counterassets_swc");
			type.set ("assets/CounterAssets.swc", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/CounterAssets.swf", "assets_counterassets_swf");
			type.set ("assets/CounterAssets.swf", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/Droid-Sans.zip", "assets_droid_sans_zip");
			type.set ("assets/Droid-Sans.zip", Reflect.field (AssetType, "binary".toUpperCase ()));
			path.set ("assets/DroidSans-Bold.ttf", "assets_droidsans_bold_ttf");
			type.set ("assets/DroidSans-Bold.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("assets/DroidSans.ttf", "assets_droidsans_ttf");
			type.set ("assets/DroidSans.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}