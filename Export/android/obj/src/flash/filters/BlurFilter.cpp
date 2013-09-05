#include <hxcpp.h>

#ifndef INCLUDED_flash_filters_BitmapFilter
#include <flash/filters/BitmapFilter.h>
#endif
#ifndef INCLUDED_flash_filters_BlurFilter
#include <flash/filters/BlurFilter.h>
#endif
namespace flash{
namespace filters{

Void BlurFilter_obj::__construct(hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< int >  __o_quality)
{
HX_STACK_PUSH("BlurFilter::new","flash/filters/BlurFilter.hx",12);
Float blurX = __o_blurX.Default(4.0);
Float blurY = __o_blurY.Default(4.0);
int quality = __o_quality.Default(1);
{
	HX_STACK_LINE(14)
	super::__construct(HX_CSTRING("BlurFilter"));
	HX_STACK_LINE(16)
	this->blurX = blurX;
	HX_STACK_LINE(17)
	this->blurY = blurY;
	HX_STACK_LINE(18)
	this->quality = quality;
}
;
	return null();
}

BlurFilter_obj::~BlurFilter_obj() { }

Dynamic BlurFilter_obj::__CreateEmpty() { return  new BlurFilter_obj; }
hx::ObjectPtr< BlurFilter_obj > BlurFilter_obj::__new(hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< int >  __o_quality)
{  hx::ObjectPtr< BlurFilter_obj > result = new BlurFilter_obj();
	result->__construct(__o_blurX,__o_blurY,__o_quality);
	return result;}

Dynamic BlurFilter_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< BlurFilter_obj > result = new BlurFilter_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2]);
	return result;}

::flash::filters::BitmapFilter BlurFilter_obj::clone( ){
	HX_STACK_PUSH("BlurFilter::clone","flash/filters/BlurFilter.hx",23);
	HX_STACK_THIS(this);
	HX_STACK_LINE(23)
	return ::flash::filters::BlurFilter_obj::__new(this->blurX,this->blurY,this->quality);
}



BlurFilter_obj::BlurFilter_obj()
{
}

void BlurFilter_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(BlurFilter);
	HX_MARK_MEMBER_NAME(quality,"quality");
	HX_MARK_MEMBER_NAME(blurY,"blurY");
	HX_MARK_MEMBER_NAME(blurX,"blurX");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void BlurFilter_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(quality,"quality");
	HX_VISIT_MEMBER_NAME(blurY,"blurY");
	HX_VISIT_MEMBER_NAME(blurX,"blurX");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic BlurFilter_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return clone_dyn(); }
		if (HX_FIELD_EQ(inName,"blurY") ) { return blurY; }
		if (HX_FIELD_EQ(inName,"blurX") ) { return blurX; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"quality") ) { return quality; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic BlurFilter_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"blurY") ) { blurY=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"blurX") ) { blurX=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"quality") ) { quality=inValue.Cast< int >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void BlurFilter_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("quality"));
	outFields->push(HX_CSTRING("blurY"));
	outFields->push(HX_CSTRING("blurX"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("clone"),
	HX_CSTRING("quality"),
	HX_CSTRING("blurY"),
	HX_CSTRING("blurX"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(BlurFilter_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(BlurFilter_obj::__mClass,"__mClass");
};

Class BlurFilter_obj::__mClass;

void BlurFilter_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("flash.filters.BlurFilter"), hx::TCanCast< BlurFilter_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void BlurFilter_obj::__boot()
{
}

} // end namespace flash
} // end namespace filters
