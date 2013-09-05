#include <hxcpp.h>

#ifndef INCLUDED_Main
#include <Main.h>
#endif
#ifndef INCLUDED_flash_display_DisplayObject
#include <flash/display/DisplayObject.h>
#endif
#ifndef INCLUDED_flash_display_DisplayObjectContainer
#include <flash/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_flash_display_IBitmapDrawable
#include <flash/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_flash_display_InteractiveObject
#include <flash/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_flash_display_MovieClip
#include <flash/display/MovieClip.h>
#endif
#ifndef INCLUDED_flash_display_Sprite
#include <flash/display/Sprite.h>
#endif
#ifndef INCLUDED_flash_events_EventDispatcher
#include <flash/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_flash_events_IEventDispatcher
#include <flash/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_flash_text_Font
#include <flash/text/Font.h>
#endif
#ifndef INCLUDED_flash_text_TextField
#include <flash/text/TextField.h>
#endif
#ifndef INCLUDED_flash_text_TextFormat
#include <flash/text/TextFormat.h>
#endif
#ifndef INCLUDED_flash_utils_ByteArray
#include <flash/utils/ByteArray.h>
#endif
#ifndef INCLUDED_flash_utils_IDataInput
#include <flash/utils/IDataInput.h>
#endif
#ifndef INCLUDED_flash_utils_IDataOutput
#include <flash/utils/IDataOutput.h>
#endif
#ifndef INCLUDED_format_SWF
#include <format/SWF.h>
#endif
#ifndef INCLUDED_format_display_MovieClip
#include <format/display/MovieClip.h>
#endif
#ifndef INCLUDED_format_swf_MovieClip
#include <format/swf/MovieClip.h>
#endif
#ifndef INCLUDED_haxe_io_Bytes
#include <haxe/io/Bytes.h>
#endif
#ifndef INCLUDED_openfl_Assets
#include <openfl/Assets.h>
#endif
#ifndef INCLUDED_openfl_utils_IMemoryRange
#include <openfl/utils/IMemoryRange.h>
#endif

Void Main_obj::__construct()
{
HX_STACK_PUSH("Main::new","Main.hx",15);
{
	HX_STACK_LINE(17)
	super::__construct();
	HX_STACK_LINE(18)
	::format::SWF swf = ::format::SWF_obj::__new(::openfl::Assets_obj::getBytes(HX_CSTRING("assets/CounterAssets.swf")));		HX_STACK_VAR(swf,"swf");
	HX_STACK_LINE(19)
	::flash::display::Sprite testButton = swf->createMovieClip(HX_CSTRING("PlayerUnitView"));		HX_STACK_VAR(testButton,"testButton");
	HX_STACK_LINE(20)
	this->addChild(testButton);
	HX_STACK_LINE(22)
	::flash::text::Font fontAsset = ::openfl::Assets_obj::getFont(HX_CSTRING("assets/DroidSans-Bold.ttf"));		HX_STACK_VAR(fontAsset,"fontAsset");
	HX_STACK_LINE(23)
	::flash::text::TextFormat mTFormat = ::flash::text::TextFormat_obj::__new(fontAsset->fontName,20.0,null(),null(),null(),null(),null(),null(),null(),null(),null(),null(),null());		HX_STACK_VAR(mTFormat,"mTFormat");
	HX_STACK_LINE(24)
	::flash::text::TextField name = testButton->getChildByName(HX_CSTRING("_name"));		HX_STACK_VAR(name,"name");
	HX_STACK_LINE(25)
	name->set_text(HX_CSTRING("Name"));
	HX_STACK_LINE(26)
	name->set_textColor((int)16777215);
	HX_STACK_LINE(27)
	name->set_defaultTextFormat(mTFormat);
	HX_STACK_LINE(28)
	name->set_embedFonts(true);
	HX_STACK_LINE(30)
	::flash::text::TextField mTF = ::flash::text::TextField_obj::__new();		HX_STACK_VAR(mTF,"mTF");
	HX_STACK_LINE(31)
	mTF->set_defaultTextFormat(mTFormat);
	HX_STACK_LINE(32)
	mTF->set_embedFonts(true);
	HX_STACK_LINE(33)
	mTF->set_text(HX_CSTRING("Hola mundo"));
	HX_STACK_LINE(34)
	mTF->set_width((int)200);
	HX_STACK_LINE(35)
	this->addChild(mTF);
}
;
	return null();
}

Main_obj::~Main_obj() { }

Dynamic Main_obj::__CreateEmpty() { return  new Main_obj; }
hx::ObjectPtr< Main_obj > Main_obj::__new()
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}

Dynamic Main_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< Main_obj > result = new Main_obj();
	result->__construct();
	return result;}


Main_obj::Main_obj()
{
}

void Main_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(Main);
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void Main_obj::__Visit(HX_VISIT_PARAMS)
{
	super::__Visit(HX_VISIT_ARG);
}

Dynamic Main_obj::__Field(const ::String &inName,bool inCallProp)
{
	return super::__Field(inName,inCallProp);
}

Dynamic Main_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void Main_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(Main_obj::__mClass,"__mClass");
};

Class Main_obj::__mClass;

void Main_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("Main"), hx::TCanCast< Main_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void Main_obj::__boot()
{
}

