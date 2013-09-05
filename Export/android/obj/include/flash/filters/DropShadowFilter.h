#ifndef INCLUDED_flash_filters_DropShadowFilter
#define INCLUDED_flash_filters_DropShadowFilter

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/filters/BitmapFilter.h>
HX_DECLARE_CLASS2(flash,filters,BitmapFilter)
HX_DECLARE_CLASS2(flash,filters,DropShadowFilter)
namespace flash{
namespace filters{


class HXCPP_CLASS_ATTRIBUTES  DropShadowFilter_obj : public ::flash::filters::BitmapFilter_obj{
	public:
		typedef ::flash::filters::BitmapFilter_obj super;
		typedef DropShadowFilter_obj OBJ_;
		DropShadowFilter_obj();
		Void __construct(hx::Null< Float >  __o_distance,hx::Null< Float >  __o_angle,hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout,hx::Null< bool >  __o_hideObject);

	public:
		static hx::ObjectPtr< DropShadowFilter_obj > __new(hx::Null< Float >  __o_distance,hx::Null< Float >  __o_angle,hx::Null< int >  __o_color,hx::Null< Float >  __o_alpha,hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< Float >  __o_strength,hx::Null< int >  __o_quality,hx::Null< bool >  __o_inner,hx::Null< bool >  __o_knockout,hx::Null< bool >  __o_hideObject);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~DropShadowFilter_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("DropShadowFilter"); }

		virtual ::flash::filters::BitmapFilter clone( );

		Float strength;
		int quality;
		bool knockout;
		bool inner;
		bool hideObject;
		Float distance;
		int color;
		Float blurY;
		Float blurX;
		Float angle;
		Float alpha;
};

} // end namespace flash
} // end namespace filters

#endif /* INCLUDED_flash_filters_DropShadowFilter */ 
