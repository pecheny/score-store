#include <hxcpp.h>

#ifndef INCLUDED_flash_filters_BitmapFilter
#include <flash/filters/BitmapFilter.h>
#endif
#ifndef INCLUDED_flash_filters_DropShadowFilter
#include <flash/filters/DropShadowFilter.h>
#endif
namespace flash{
namespace filters{

Void DropShadowFilter_obj::__construct(hx::Null< Float >  __o_distance,hx::Null< Float >  __o_angle,hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout,hx::Null< bool >  __o_hideObject)
{
HX_STACK_PUSH("DropShadowFilter::new","flash/filters/DropShadowFilter.hx",20);
Float distance = __o_distance.Default(4.0);
Float angle = __o_angle.Default(45.0);
int color = __o_color.Default(0);
Float alpha = __o_alpha.Default(1.0);
Float blurX = __o_blurX.Default(4.0);
Float blurY = __o_blurY.Default(4.0);
Float strength = __o_strength.Default(1.0);
int quality = __o_quality.Default(1);
bool inner = __o_inner.Default(false);
bool knockout = __o_knockout.Default(false);
bool hideObject = __o_hideObject.Default(false);
{
	HX_STACK_LINE(22)
	super::__construct(HX_CSTRING("DropShadowFilter"));
	HX_STACK_LINE(24)
	this->distance = distance;
	HX_STACK_LINE(25)
	this->angle = angle;
	HX_STACK_LINE(26)
	this->color = color;
	HX_STACK_LINE(27)
	this->alpha = alpha;
	HX_STACK_LINE(28)
	this->blurX = blurX;
	HX_STACK_LINE(29)
	this->blurY = blurY;
	HX_STACK_LINE(30)
	this->strength = strength;
	HX_STACK_LINE(31)
	this->quality = quality;
	HX_STACK_LINE(32)
	this->inner = inner;
	HX_STACK_LINE(33)
	this->knockout = knockout;
	HX_STACK_LINE(34)
	this->hideObject = hideObject;
}
;
	return null();
}

DropShadowFilter_obj::~DropShadowFilter_obj() { }

Dynamic DropShadowFilter_obj::__CreateEmpty() { return  new DropShadowFilter_obj; }
hx::ObjectPtr< DropShadowFilter_obj > DropShadowFilter_obj::__new(hx::Null< Float >  __o_distance,hx::Null< Float >  __o_angle,hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout,hx::Null< bool >  __o_hideObject)
{  hx::ObjectPtr< DropShadowFilter_obj > result = new DropShadowFilter_obj();
	result->__construct(__o_distance,__o_angle,__o_color,__o_alpha,__o_blurX,__o_blurY,__o_strength,__o_quality,__o_inner,__o_knockout,__o_hideObject);
	return result;}

Dynamic DropShadowFilter_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< DropShadowFilter_obj > result = new DropShadowFilter_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6],inArgs[7],inArgs[8],inArgs[9],inArgs[10]);
	return result;}

::flash::filters::BitmapFilter DropShadowFilter_obj::clone( ){
	HX_STACK_PUSH("DropShadowFilter::clone","flash/filters/DropShadowFilter.hx",39);
	HX_STACK_THIS(this);
	HX_STACK_LINE(39)
	return ::flash::filters::DropShadowFilter_obj::__new(this->distance,this->angle,this->color,this->alpha,this->blurX,this->blurY,this->strength,this->quality,this->inner,this->knockout,this->hideObject);
}



DropShadowFilter_obj::DropShadowFilter_obj()
{
}

void DropShadowFilter_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(DropShadowFilter);
	HX_MARK_MEMBER_NAME(strength,"strength");
	HX_MARK_MEMBER_NAME(quality,"quality");
	HX_MARK_MEMBER_NAME(knockout,"knockout");
	HX_MARK_MEMBER_NAME(inner,"inner");
	HX_MARK_MEMBER_NAME(hideObject,"hideObject");
	HX_MARK_MEMBER_NAME(distance,"distance");
	HX_MARK_MEMBER_NAME(color,"color");
	HX_MARK_MEMBER_NAME(blurY,"blurY");
	HX_MARK_MEMBER_NAME(blurX,"blurX");
	HX_MARK_MEMBER_NAME(angle,"angle");
	HX_MARK_MEMBER_NAME(alpha,"alpha");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void DropShadowFilter_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(strength,"strength");
	HX_VISIT_MEMBER_NAME(quality,"quality");
	HX_VISIT_MEMBER_NAME(knockout,"knockout");
	HX_VISIT_MEMBER_NAME(inner,"inner");
	HX_VISIT_MEMBER_NAME(hideObject,"hideObject");
	HX_VISIT_MEMBER_NAME(distance,"distance");
	HX_VISIT_MEMBER_NAME(color,"color");
	HX_VISIT_MEMBER_NAME(blurY,"blurY");
	HX_VISIT_MEMBER_NAME(blurX,"blurX");
	HX_VISIT_MEMBER_NAME(angle,"angle");
	HX_VISIT_MEMBER_NAME(alpha,"alpha");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic DropShadowFilter_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"clone") ) { return clone_dyn(); }
		if (HX_FIELD_EQ(inName,"inner") ) { return inner; }
		if (HX_FIELD_EQ(inName,"color") ) { return color; }
		if (HX_FIELD_EQ(inName,"blurY") ) { return blurY; }
		if (HX_FIELD_EQ(inName,"blurX") ) { return blurX; }
		if (HX_FIELD_EQ(inName,"angle") ) { return angle; }
		if (HX_FIELD_EQ(inName,"alpha") ) { return alpha; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"quality") ) { return quality; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"strength") ) { return strength; }
		if (HX_FIELD_EQ(inName,"knockout") ) { return knockout; }
		if (HX_FIELD_EQ(inName,"distance") ) { return distance; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"hideObject") ) { return hideObject; }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic DropShadowFilter_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 5:
		if (HX_FIELD_EQ(inName,"inner") ) { inner=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"color") ) { color=inValue.Cast< int >(); return inValue; }
		if (HX_FIELD_EQ(inName,"blurY") ) { blurY=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"blurX") ) { blurX=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"angle") ) { angle=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"alpha") ) { alpha=inValue.Cast< Float >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"quality") ) { quality=inValue.Cast< int >(); return inValue; }
		break;
	case 8:
		if (HX_FIELD_EQ(inName,"strength") ) { strength=inValue.Cast< Float >(); return inValue; }
		if (HX_FIELD_EQ(inName,"knockout") ) { knockout=inValue.Cast< bool >(); return inValue; }
		if (HX_FIELD_EQ(inName,"distance") ) { distance=inValue.Cast< Float >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"hideObject") ) { hideObject=inValue.Cast< bool >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void DropShadowFilter_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("strength"));
	outFields->push(HX_CSTRING("quality"));
	outFields->push(HX_CSTRING("knockout"));
	outFields->push(HX_CSTRING("inner"));
	outFields->push(HX_CSTRING("hideObject"));
	outFields->push(HX_CSTRING("distance"));
	outFields->push(HX_CSTRING("color"));
	outFields->push(HX_CSTRING("blurY"));
	outFields->push(HX_CSTRING("blurX"));
	outFields->push(HX_CSTRING("angle"));
	outFields->push(HX_CSTRING("alpha"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("clone"),
	HX_CSTRING("strength"),
	HX_CSTRING("quality"),
	HX_CSTRING("knockout"),
	HX_CSTRING("inner"),
	HX_CSTRING("hideObject"),
	HX_CSTRING("distance"),
	HX_CSTRING("color"),
	HX_CSTRING("blurY"),
	HX_CSTRING("blurX"),
	HX_CSTRING("angle"),
	HX_CSTRING("alpha"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(DropShadowFilter_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(DropShadowFilter_obj::__mClass,"__mClass");
};

Class DropShadowFilter_obj::__mClass;

void DropShadowFilter_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("flash.filters.DropShadowFilter"), hx::TCanCast< DropShadowFilter_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void DropShadowFilter_obj::__boot()
{
}

} // end namespace flash
} // end namespace filters
