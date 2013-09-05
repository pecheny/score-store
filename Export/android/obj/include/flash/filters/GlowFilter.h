#ifndef INCLUDED_flash_filters_GlowFilter
#define INCLUDED_flash_filters_GlowFilter

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/filters/DropShadowFilter.h>
HX_DECLARE_CLASS2(flash,filters,BitmapFilter)
HX_DECLARE_CLASS2(flash,filters,DropShadowFilter)
HX_DECLARE_CLASS2(flash,filters,GlowFilter)
namespace flash{
namespace filters{


class HXCPP_CLASS_ATTRIBUTES  GlowFilter_obj : public ::flash::filters::DropShadowFilter_obj{
	public:
		typedef ::flash::filters::DropShadowFilter_obj super;
		typedef GlowFilter_obj OBJ_;
		GlowFilter_obj();
		Void __construct(hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout);

	public:
		static hx::ObjectPtr< GlowFilter_obj > __new(hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~GlowFilter_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("GlowFilter"); }

};

} // end namespace flash
} // end namespace filters

#endif /* INCLUDED_flash_filters_GlowFilter */ 
