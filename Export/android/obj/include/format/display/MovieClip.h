#ifndef INCLUDED_format_display_MovieClip
#define INCLUDED_format_display_MovieClip

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/display/MovieClip.h>
HX_DECLARE_CLASS2(flash,display,DisplayObject)
HX_DECLARE_CLASS2(flash,display,DisplayObjectContainer)
HX_DECLARE_CLASS2(flash,display,IBitmapDrawable)
HX_DECLARE_CLASS2(flash,display,InteractiveObject)
HX_DECLARE_CLASS2(flash,display,MovieClip)
HX_DECLARE_CLASS2(flash,display,Sprite)
HX_DECLARE_CLASS2(flash,events,EventDispatcher)
HX_DECLARE_CLASS2(flash,events,IEventDispatcher)
HX_DECLARE_CLASS2(format,display,FrameLabel)
HX_DECLARE_CLASS2(format,display,MovieClip)
namespace format{
namespace display{


class HXCPP_CLASS_ATTRIBUTES  MovieClip_obj : public ::flash::display::MovieClip_obj{
	public:
		typedef ::flash::display::MovieClip_obj super;
		typedef MovieClip_obj OBJ_;
		MovieClip_obj();
		Void __construct();

	public:
		static hx::ObjectPtr< MovieClip_obj > __new();
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~MovieClip_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("MovieClip"); }

		virtual Void unflatten( );
		Dynamic unflatten_dyn();

		virtual Void flatten( );
		Dynamic flatten_dyn();

		Array< ::Dynamic > currentLabels;
		::String currentLabel;
		::String currentFrameLabel;
};

} // end namespace format
} // end namespace display

#endif /* INCLUDED_format_display_MovieClip */ 
