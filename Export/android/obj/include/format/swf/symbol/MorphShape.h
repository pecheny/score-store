#ifndef INCLUDED_format_swf_symbol_MorphShape
#define INCLUDED_format_swf_symbol_MorphShape

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(flash,display,Graphics)
HX_DECLARE_CLASS2(flash,geom,Matrix)
HX_DECLARE_CLASS2(flash,geom,Rectangle)
HX_DECLARE_CLASS1(format,SWF)
HX_DECLARE_CLASS3(format,swf,data,SWFStream)
HX_DECLARE_CLASS3(format,swf,symbol,MorphShape)
namespace format{
namespace swf{
namespace symbol{


class HXCPP_CLASS_ATTRIBUTES  MorphShape_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef MorphShape_obj OBJ_;
		MorphShape_obj();
		Void __construct(::format::SWF swf,::format::swf::data::SWFStream stream,int version);

	public:
		static hx::ObjectPtr< MorphShape_obj > __new(::format::SWF swf,::format::swf::data::SWFStream stream,int version);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~MorphShape_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("MorphShape"); }

		virtual bool render( ::flash::display::Graphics graphics,Float f);
		Dynamic render_dyn();

		virtual Dynamic readLineStyles( ::format::swf::data::SWFStream stream,int version);
		Dynamic readLineStyles_dyn();

		virtual Dynamic readFillStyles( ::format::swf::data::SWFStream stream,int version);
		Dynamic readFillStyles_dyn();

		bool waitingLoader;
		::format::SWF swf;
		bool hasScaled;
		bool hasNonScaled;
		::flash::geom::Rectangle edgeBounds1;
		::flash::geom::Rectangle edgeBounds0;
		Dynamic commands;
		::flash::geom::Rectangle bounds1;
		::flash::geom::Rectangle bounds0;
		static int ftSolid;
		static int ftLinear;
		static int ftRadial;
		static int ftRadialF;
		static int ftBitmapRepeat;
		static int ftBitmapClipped;
		static int ftBitmapRepeatR;
		static int ftBitmapClippedR;
		static int interpolateColor( int color0,int color1,Float f);
		static Dynamic interpolateColor_dyn();

		static ::flash::geom::Matrix interpolateMatrix( ::flash::geom::Matrix matrix0,::flash::geom::Matrix matrix1,Float f);
		static Dynamic interpolateMatrix_dyn();

};

} // end namespace format
} // end namespace swf
} // end namespace symbol

#endif /* INCLUDED_format_swf_symbol_MorphShape */ 
