#include <hxcpp.h>

#ifndef INCLUDED_flash_Lib
#include <flash/Lib.h>
#endif
#ifndef INCLUDED_flash_display_DisplayObject
#include <flash/display/DisplayObject.h>
#endif
#ifndef INCLUDED_flash_display_IBitmapDrawable
#include <flash/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_flash_display_InteractiveObject
#include <flash/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_flash_display_SimpleButton
#include <flash/display/SimpleButton.h>
#endif
#ifndef INCLUDED_flash_events_EventDispatcher
#include <flash/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_flash_events_IEventDispatcher
#include <flash/events/IEventDispatcher.h>
#endif
namespace flash{
namespace display{

Void SimpleButton_obj::__construct(::flash::display::DisplayObject upState,::flash::display::DisplayObject overState,::flash::display::DisplayObject downState,::flash::display::DisplayObject hitTestState)
{
HX_STACK_PUSH("SimpleButton::new","flash/display/SimpleButton.hx",18);
{
	HX_STACK_LINE(20)
	super::__construct(::flash::display::SimpleButton_obj::nme_simple_button_create(),HX_CSTRING("SimpleButton"));
	HX_STACK_LINE(22)
	this->set_upState(upState);
	HX_STACK_LINE(23)
	this->set_overState(overState);
	HX_STACK_LINE(24)
	this->set_downState(downState);
	HX_STACK_LINE(25)
	this->set_hitTestState(hitTestState);
}
;
	return null();
}

SimpleButton_obj::~SimpleButton_obj() { }

Dynamic SimpleButton_obj::__CreateEmpty() { return  new SimpleButton_obj; }
hx::ObjectPtr< SimpleButton_obj > SimpleButton_obj::__new(::flash::display::DisplayObject upState,::flash::display::DisplayObject overState,::flash::display::DisplayObject downState,::flash::display::DisplayObject hitTestState)
{  hx::ObjectPtr< SimpleButton_obj > result = new SimpleButton_obj();
	result->__construct(upState,overState,downState,hitTestState);
	return result;}

Dynamic SimpleButton_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< SimpleButton_obj > result = new SimpleButton_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3]);
	return result;}

::flash::display::DisplayObject SimpleButton_obj::set_upState( ::flash::display::DisplayObject value){
	HX_STACK_PUSH("SimpleButton::set_upState","flash/display/SimpleButton.hx",82);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(84)
	this->upState = value;
	HX_STACK_LINE(85)
	::flash::display::SimpleButton_obj::nme_simple_button_set_state(this->__handle,(int)0,(  (((value == null()))) ? Dynamic(null()) : Dynamic(value->__handle) ));
	HX_STACK_LINE(86)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_upState,return )

::flash::display::DisplayObject SimpleButton_obj::set_overState( ::flash::display::DisplayObject value){
	HX_STACK_PUSH("SimpleButton::set_overState","flash/display/SimpleButton.hx",73);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(75)
	this->overState = value;
	HX_STACK_LINE(76)
	::flash::display::SimpleButton_obj::nme_simple_button_set_state(this->__handle,(int)2,(  (((value == null()))) ? Dynamic(null()) : Dynamic(value->__handle) ));
	HX_STACK_LINE(77)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_overState,return )

::flash::display::DisplayObject SimpleButton_obj::set_hitTestState( ::flash::display::DisplayObject value){
	HX_STACK_PUSH("SimpleButton::set_hitTestState","flash/display/SimpleButton.hx",64);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(66)
	this->hitTestState = value;
	HX_STACK_LINE(67)
	::flash::display::SimpleButton_obj::nme_simple_button_set_state(this->__handle,(int)3,(  (((value == null()))) ? Dynamic(null()) : Dynamic(value->__handle) ));
	HX_STACK_LINE(68)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_hitTestState,return )

bool SimpleButton_obj::set_useHandCursor( bool value){
	HX_STACK_PUSH("SimpleButton::set_useHandCursor","flash/display/SimpleButton.hx",56);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(58)
	::flash::display::SimpleButton_obj::nme_simple_button_set_hand_cursor(this->__handle,value);
	HX_STACK_LINE(59)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_useHandCursor,return )

bool SimpleButton_obj::get_useHandCursor( ){
	HX_STACK_PUSH("SimpleButton::get_useHandCursor","flash/display/SimpleButton.hx",55);
	HX_STACK_THIS(this);
	HX_STACK_LINE(55)
	return ::flash::display::SimpleButton_obj::nme_simple_button_get_hand_cursor(this->__handle);
}


HX_DEFINE_DYNAMIC_FUNC0(SimpleButton_obj,get_useHandCursor,return )

bool SimpleButton_obj::set_enabled( bool value){
	HX_STACK_PUSH("SimpleButton::set_enabled","flash/display/SimpleButton.hx",47);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(49)
	::flash::display::SimpleButton_obj::nme_simple_button_set_enabled(this->__handle,value);
	HX_STACK_LINE(50)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_enabled,return )

bool SimpleButton_obj::get_enabled( ){
	HX_STACK_PUSH("SimpleButton::get_enabled","flash/display/SimpleButton.hx",46);
	HX_STACK_THIS(this);
	HX_STACK_LINE(46)
	return ::flash::display::SimpleButton_obj::nme_simple_button_get_enabled(this->__handle);
}


HX_DEFINE_DYNAMIC_FUNC0(SimpleButton_obj,get_enabled,return )

::flash::display::DisplayObject SimpleButton_obj::set_downState( ::flash::display::DisplayObject value){
	HX_STACK_PUSH("SimpleButton::set_downState","flash/display/SimpleButton.hx",37);
	HX_STACK_THIS(this);
	HX_STACK_ARG(value,"value");
	HX_STACK_LINE(39)
	this->downState = value;
	HX_STACK_LINE(40)
	::flash::display::SimpleButton_obj::nme_simple_button_set_state(this->__handle,(int)1,(  (((value == null()))) ? Dynamic(null()) : Dynamic(value->__handle) ));
	HX_STACK_LINE(41)
	return value;
}


HX_DEFINE_DYNAMIC_FUNC1(SimpleButton_obj,set_downState,return )

Dynamic SimpleButton_obj::nme_simple_button_set_state;

Dynamic SimpleButton_obj::nme_simple_button_get_enabled;

Dynamic SimpleButton_obj::nme_simple_button_set_enabled;

Dynamic SimpleButton_obj::nme_simple_button_get_hand_cursor;

Dynamic SimpleButton_obj::nme_simple_button_set_hand_cursor;

Dynamic SimpleButton_obj::nme_simple_button_create;


SimpleButton_obj::SimpleButton_obj()
{
}

void SimpleButton_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(SimpleButton);
	HX_MARK_MEMBER_NAME(upState,"upState");
	HX_MARK_MEMBER_NAME(overState,"overState");
	HX_MARK_MEMBER_NAME(hitTestState,"hitTestState");
	HX_MARK_MEMBER_NAME(downState,"downState");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void SimpleButton_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(upState,"upState");
	HX_VISIT_MEMBER_NAME(overState,"overState");
	HX_VISIT_MEMBER_NAME(hitTestState,"hitTestState");
	HX_VISIT_MEMBER_NAME(downState,"downState");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic SimpleButton_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"upState") ) { return upState; }
		if (HX_FIELD_EQ(inName,"enabled") ) { return get_enabled(); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"overState") ) { return overState; }
		if (HX_FIELD_EQ(inName,"downState") ) { return downState; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"set_upState") ) { return set_upState_dyn(); }
		if (HX_FIELD_EQ(inName,"set_enabled") ) { return set_enabled_dyn(); }
		if (HX_FIELD_EQ(inName,"get_enabled") ) { return get_enabled_dyn(); }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"hitTestState") ) { return hitTestState; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"set_overState") ) { return set_overState_dyn(); }
		if (HX_FIELD_EQ(inName,"set_downState") ) { return set_downState_dyn(); }
		if (HX_FIELD_EQ(inName,"useHandCursor") ) { return get_useHandCursor(); }
		break;
	case 16:
		if (HX_FIELD_EQ(inName,"set_hitTestState") ) { return set_hitTestState_dyn(); }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"set_useHandCursor") ) { return set_useHandCursor_dyn(); }
		if (HX_FIELD_EQ(inName,"get_useHandCursor") ) { return get_useHandCursor_dyn(); }
		break;
	case 24:
		if (HX_FIELD_EQ(inName,"nme_simple_button_create") ) { return nme_simple_button_create; }
		break;
	case 27:
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_state") ) { return nme_simple_button_set_state; }
		break;
	case 29:
		if (HX_FIELD_EQ(inName,"nme_simple_button_get_enabled") ) { return nme_simple_button_get_enabled; }
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_enabled") ) { return nme_simple_button_set_enabled; }
		break;
	case 33:
		if (HX_FIELD_EQ(inName,"nme_simple_button_get_hand_cursor") ) { return nme_simple_button_get_hand_cursor; }
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_hand_cursor") ) { return nme_simple_button_set_hand_cursor; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic SimpleButton_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 7:
		if (HX_FIELD_EQ(inName,"upState") ) { if (inCallProp) return set_upState(inValue);upState=inValue.Cast< ::flash::display::DisplayObject >(); return inValue; }
		if (HX_FIELD_EQ(inName,"enabled") ) { return set_enabled(inValue); }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"overState") ) { if (inCallProp) return set_overState(inValue);overState=inValue.Cast< ::flash::display::DisplayObject >(); return inValue; }
		if (HX_FIELD_EQ(inName,"downState") ) { if (inCallProp) return set_downState(inValue);downState=inValue.Cast< ::flash::display::DisplayObject >(); return inValue; }
		break;
	case 12:
		if (HX_FIELD_EQ(inName,"hitTestState") ) { if (inCallProp) return set_hitTestState(inValue);hitTestState=inValue.Cast< ::flash::display::DisplayObject >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"useHandCursor") ) { return set_useHandCursor(inValue); }
		break;
	case 24:
		if (HX_FIELD_EQ(inName,"nme_simple_button_create") ) { nme_simple_button_create=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 27:
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_state") ) { nme_simple_button_set_state=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 29:
		if (HX_FIELD_EQ(inName,"nme_simple_button_get_enabled") ) { nme_simple_button_get_enabled=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_enabled") ) { nme_simple_button_set_enabled=inValue.Cast< Dynamic >(); return inValue; }
		break;
	case 33:
		if (HX_FIELD_EQ(inName,"nme_simple_button_get_hand_cursor") ) { nme_simple_button_get_hand_cursor=inValue.Cast< Dynamic >(); return inValue; }
		if (HX_FIELD_EQ(inName,"nme_simple_button_set_hand_cursor") ) { nme_simple_button_set_hand_cursor=inValue.Cast< Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void SimpleButton_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("useHandCursor"));
	outFields->push(HX_CSTRING("upState"));
	outFields->push(HX_CSTRING("overState"));
	outFields->push(HX_CSTRING("hitTestState"));
	outFields->push(HX_CSTRING("enabled"));
	outFields->push(HX_CSTRING("downState"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	HX_CSTRING("nme_simple_button_set_state"),
	HX_CSTRING("nme_simple_button_get_enabled"),
	HX_CSTRING("nme_simple_button_set_enabled"),
	HX_CSTRING("nme_simple_button_get_hand_cursor"),
	HX_CSTRING("nme_simple_button_set_hand_cursor"),
	HX_CSTRING("nme_simple_button_create"),
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("set_upState"),
	HX_CSTRING("set_overState"),
	HX_CSTRING("set_hitTestState"),
	HX_CSTRING("set_useHandCursor"),
	HX_CSTRING("get_useHandCursor"),
	HX_CSTRING("set_enabled"),
	HX_CSTRING("get_enabled"),
	HX_CSTRING("set_downState"),
	HX_CSTRING("upState"),
	HX_CSTRING("overState"),
	HX_CSTRING("hitTestState"),
	HX_CSTRING("downState"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(SimpleButton_obj::__mClass,"__mClass");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_state,"nme_simple_button_set_state");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_get_enabled,"nme_simple_button_get_enabled");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_enabled,"nme_simple_button_set_enabled");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_get_hand_cursor,"nme_simple_button_get_hand_cursor");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_hand_cursor,"nme_simple_button_set_hand_cursor");
	HX_MARK_MEMBER_NAME(SimpleButton_obj::nme_simple_button_create,"nme_simple_button_create");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::__mClass,"__mClass");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_state,"nme_simple_button_set_state");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_get_enabled,"nme_simple_button_get_enabled");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_enabled,"nme_simple_button_set_enabled");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_get_hand_cursor,"nme_simple_button_get_hand_cursor");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_set_hand_cursor,"nme_simple_button_set_hand_cursor");
	HX_VISIT_MEMBER_NAME(SimpleButton_obj::nme_simple_button_create,"nme_simple_button_create");
};

Class SimpleButton_obj::__mClass;

void SimpleButton_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("flash.display.SimpleButton"), hx::TCanCast< SimpleButton_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void SimpleButton_obj::__boot()
{
	nme_simple_button_set_state= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_set_state"),(int)3);
	nme_simple_button_get_enabled= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_get_enabled"),(int)1);
	nme_simple_button_set_enabled= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_set_enabled"),(int)2);
	nme_simple_button_get_hand_cursor= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_get_hand_cursor"),(int)1);
	nme_simple_button_set_hand_cursor= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_set_hand_cursor"),(int)2);
	nme_simple_button_create= ::flash::Lib_obj::load(HX_CSTRING("nme"),HX_CSTRING("nme_simple_button_create"),(int)0);
}

} // end namespace flash
} // end namespace display
