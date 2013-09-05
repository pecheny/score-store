package nme;


import openfl.Assets;


class AssetData {

	
	public static var className = new #if haxe3 Map <String, #else Hash <#end Dynamic> ();
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();
	
	private static var initialized:Bool = false;
	
	
	public static function initialize ():Void {
		
		if (!initialized) {
			
			className.set ("assets/CounterAssets.fla", nme.NME_assets_counterassets_fla);
			type.set ("assets/CounterAssets.fla", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/CounterAssets.swc", nme.NME_assets_counterassets_swc);
			type.set ("assets/CounterAssets.swc", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/CounterAssets.swf", nme.NME_assets_counterassets_swf);
			type.set ("assets/CounterAssets.swf", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/Droid-Sans.zip", nme.NME_assets_droid_sans_zip);
			type.set ("assets/Droid-Sans.zip", Reflect.field (AssetType, "binary".toUpperCase ()));
			className.set ("assets/DroidSans-Bold.ttf", nme.NME_assets_droidsans_bold_ttf);
			type.set ("assets/DroidSans-Bold.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			className.set ("assets/DroidSans.ttf", nme.NME_assets_droidsans_ttf);
			type.set ("assets/DroidSans.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			
			
			initialized = true;
			
		}
		
	}
	
	
}


class NME_assets_counterassets_fla extends flash.utils.ByteArray { }
class NME_assets_counterassets_swc extends flash.utils.ByteArray { }
class NME_assets_counterassets_swf extends flash.utils.ByteArray { }
class NME_assets_droid_sans_zip extends flash.utils.ByteArray { }
class NME_assets_droidsans_bold_ttf extends flash.text.Font { }
class NME_assets_droidsans_ttf extends flash.text.Font { }
