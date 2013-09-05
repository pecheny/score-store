#include <hxcpp.h>

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
#ifndef INCLUDED_format_display_FrameLabel
#include <format/display/FrameLabel.h>
#endif
#ifndef INCLUDED_format_display_MovieClip
#include <format/display/MovieClip.h>
#endif
namespace format{
namespace display{

Void MovieClip_obj::__construct()
{
HX_STACK_PUSH("MovieClip::new","format/display/MovieClip.hx",118);
{
	HX_STACK_LINE(118)
	super::__construct();
}
;
	return null();
}

MovieClip_obj::~MovieClip_obj() { }

Dynamic MovieClip_obj::__CreateEmpty() { return  new MovieClip_obj; }
hx::ObjectPtr< MovieClip_obj > MovieClip_obj::__new()
{  hx::ObjectPtr< MovieClip_obj > result = new MovieClip_obj();
	result->__construct();
	return result;}

Dynamic MovieClip_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< MovieClip_obj > result = new MovieClip_obj();
	result->__construct();
	return result;}

Void MovieClip_obj::unflatten( ){
{
		HX_STACK_PUSH("MovieClip::unflatten","format/display/MovieClip.hx",132);
		HX_STACK_THIS(this);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(MovieClip_obj,unflatten,(void))

Void MovieClip_obj::flatten( ){
{
		HX_STACK_PUSH("MovieClip::flatten","format/display/MovieClip.hx",125);
		HX_STACK_THIS(this);
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(MovieClip_obj,flatten,(void))


MovieClip_obj::MovieClip_obj()
{
}

void MovieClip_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(MovieClip);
	HX_MARK_MEMBER_NAME(currentLabels,"currentLabels");
	HX_MARK_MEMBER_NAME(currentLabel,"currentLabel");
	HX_MARK_MEMBER_NAME(currentFrameLabel,"currentFrameLabel");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void MovieClip_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(currentLabels,"currentLabels");
	HX_VISIT_MEMBER_NAME(currentLabel,"currentLabel");
	HX_VISIT_MEMBER_NAME(currentFrameLabel,"currentFrameLabel");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic MovieClip_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"flatten") ) { return flatten_dyn(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"unflatten") ) { return unflatten_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"currentLabel") ) { return currentLabel; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"currentLabels") ) { return currentLabels; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"currentFrameLabel") ) { return currentFrameLabel; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic MovieClip_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 12:
		if (HX_FIELD_EQ(inName,"currentLabel") ) { currentLabel=inValue.Cast< ::String >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"currentLabels") ) { currentLabels=inValue.Cast< Array< ::Dynamic > >(); return inValue; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"currentFrameLabel") ) { currentFrameLabel=inValue.Cast< ::String >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void MovieClip_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("currentLabels"));
	outFields->push(HX_CSTRING("currentLabel"));
	outFields->push(HX_CSTRING("currentFrameLabel"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("unflatten"),
	HX_CSTRING("flatten"),
	HX_CSTRING("currentLabels"),
	HX_CSTRING("currentLabel"),
	HX_CSTRING("currentFrameLabel"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(MovieClip_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(MovieClip_obj::__mClass,"__mClass");
};

Class MovieClip_obj::__mClass;

void MovieClip_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("format.display.MovieClip"), hx::TCanCast< MovieClip_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void MovieClip_obj::__boot()
{
}

} // end namespace format
} // end namespace display
