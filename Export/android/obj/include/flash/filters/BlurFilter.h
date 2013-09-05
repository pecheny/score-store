#ifndef INCLUDED_flash_filters_BlurFilter
#define INCLUDED_flash_filters_BlurFilter

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/filters/BitmapFilter.h>
HX_DECLARE_CLASS2(flash,filters,BitmapFilter)
HX_DECLARE_CLASS2(flash,filters,BlurFilter)
namespace flash{
namespace filters{


class HXCPP_CLASS_ATTRIBUTES  BlurFilter_obj : public ::flash::filters::BitmapFilter_obj{
	public:
		typedef ::flash::filters::BitmapFilter_obj super;
		typedef BlurFilter_obj OBJ_;
		BlurFilter_obj();
		Void __construct(hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< int >  __o_quality);

	public:
		static hx::ObjectPtr< BlurFilter_obj > __new(hx::Null< Float >  __o_blurX,hx::Null< Float >  __o_blurY,hx::Null< int >  __o_quality);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~BlurFilter_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("BlurFilter"); }

		virtual ::flash::filters::BitmapFilter clone( );

		int quality;
		Float blurY;
		Float blurX;
};

} // end namespace flash
} // end namespace filters

#endif /* INCLUDED_flash_filters_BlurFilter */ 
