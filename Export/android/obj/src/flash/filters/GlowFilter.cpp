#include <hxcpp.h>

#ifndef INCLUDED_flash_filters_BitmapFilter
#include <flash/filters/BitmapFilter.h>
#endif
#ifndef INCLUDED_flash_filters_DropShadowFilter
#include <flash/filters/DropShadowFilter.h>
#endif
#ifndef INCLUDED_flash_filters_GlowFilter
#include <flash/filters/GlowFilter.h>
#endif
namespace flash{
namespace filters{

Void GlowFilter_obj::__construct(hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout)
{
HX_STACK_PUSH("GlowFilter::new","flash/filters/GlowFilter.hx",7);
int color = __o_color.Default(0);
Float alpha = __o_alpha.Default(1.0);
Float blurX = __o_blurX.Default(6.0);
Float blurY = __o_blurY.Default(6.0);
Float strength = __o_strength.Default(2.0);
int quality = __o_quality.Default(1);
bool inner = __o_inner.Default(false);
bool knockout = __o_knockout.Default(false);
{
	HX_STACK_LINE(7)
	super::__construct((int)0,(int)0,color,alpha,blurX,blurY,strength,quality,inner,knockout,false);
}
;
	return null();
}

GlowFilter_obj::~GlowFilter_obj() { }

Dynamic GlowFilter_obj::__CreateEmpty() { return  new GlowFilter_obj; }
hx::ObjectPtr< GlowFilter_obj > GlowFilter_obj::__new(hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout)
{  hx::ObjectPtr< GlowFilter_obj > result = new GlowFilter_obj();
	result->__construct(__o_color,__o_alpha,__o_blurX,__o_blurY,__o_strength,__o_quality,__o_inner,__o_knockout);
	return result;}

Dynamic GlowFilter_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< GlowFilter_obj > result = new GlowFilter_obj();
	result->__construct(inArgs[0],inArgs[1],inArgs[2],inArgs[3],inArgs[4],inArgs[5],inArgs[6],inArgs[7]);
	return result;}


GlowFilter_obj::GlowFilter_obj()
{
}

void GlowFilter_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(GlowFilter);
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void GlowFilter_obj::__Visit(HX_VISIT_PARAMS)
{
	super::__Visit(HX_VISIT_ARG);
}

Dynamic GlowFilter_obj::__Field(const ::String &inName,bool inCallProp)
{
	return super::__Field(inName,inCallProp);
}

Dynamic GlowFilter_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	return super::__SetField(inName,inValue,inCallProp);
}

void GlowFilter_obj::__GetFields(Array< ::String> &outFields)
{
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(GlowFilter_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(GlowFilter_obj::__mClass,"__mClass");
};

Class GlowFilter_obj::__mClass;

void GlowFilter_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("flash.filters.GlowFilter"), hx::TCanCast< GlowFilter_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void GlowFilter_obj::__boot()
{
}

} // end namespace flash
} // end namespace filters
