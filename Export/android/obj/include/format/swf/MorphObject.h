#ifndef INCLUDED_format_swf_MorphObject
#define INCLUDED_format_swf_MorphObject

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/display/Sprite.h>
HX_DECLARE_CLASS2(flash,display,DisplayObject)
HX_DECLARE_CLASS2(flash,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(flash,display,IBitmapDrawable)
HX_DECLARE_CLASS2(flash,display,InteractiveObject)
HX_DECLARE_CLASS2(flash,display,Sprite)
HX_DECLARE_CLASS2(flash,events,EventDispatcher)
HX_DECLARE_CLASS2(flash,events,IEventDispatcher)
HX_DECLARE_CLASS2(format,swf,MorphObject)
HX_DECLARE_CLASS3(format,swf,symbol,MorphShape)
namespace format{
namespace swf{


class HXCPP_CLASS_ATTRIBUTES  MorphObject_obj : public ::flash::display::Sprite_obj{
	public:
		typedef ::flash::display::Sprite_obj super;
		typedef MorphObject_obj OBJ_;
		MorphObject_obj();
		Void __construct(::format::swf::symbol::MorphShape data);

	public:
		static hx::ObjectPtr< MorphObject_obj > __new(::format::swf::symbol::MorphShape data);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~MorphObject_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("MorphObject"); }

		virtual bool setRatio( int ratio);
		Dynamic setRatio_dyn();

		::format::swf::symbol::MorphShape data;
};

} // end namespace format
} // end namespace swf

#endif /* INCLUDED_format_swf_MorphObject */ 
