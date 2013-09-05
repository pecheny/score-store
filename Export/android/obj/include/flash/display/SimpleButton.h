#ifndef INCLUDED_flash_display_SimpleButton
#define INCLUDED_flash_display_SimpleButton

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#include <flash/display/InteractiveObject.h>
HX_DECLARE_CLASS2(flash,display,DisplayObject)
HX_DECLARE_CLASS2(flash,display,IBitmapDrawable)
HX_DECLARE_CLASS2(flash,display,InteractiveObject)
HX_DECLARE_CLASS2(flash,display,SimpleButton)
HX_DECLARE_CLASS2(flash,events,EventDispatcher)
HX_DECLARE_CLASS2(flash,events,IEventDispatcher)
namespace flash{
namespace display{


class HXCPP_CLASS_ATTRIBUTES  SimpleButton_obj : public ::flash::display::InteractiveObject_obj{
	public:
		typedef ::flash::display::InteractiveObject_obj super;
		typedef SimpleButton_obj OBJ_;
		SimpleButton_obj();
		Void __construct(::flash::display::DisplayObject upState,::flash::display::DisplayObject overState,::flash::display::DisplayObject downState,::flash::display::DisplayObject hitTestState);

	public:
		static hx::ObjectPtr< SimpleButton_obj > __new(::flash::display::DisplayObject upState,::flash::display::DisplayObject overState,::flash::display::DisplayObject downState,::flash::display::DisplayObject hitTestState);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~SimpleButton_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("SimpleButton"); }

		virtual ::flash::display::DisplayObject set_upState( ::flash::display::DisplayObject value);
		Dynamic set_upState_dyn();

		virtual ::flash::display::DisplayObject set_overState( ::flash::display::DisplayObject value);
		Dynamic set_overState_dyn();

		virtual ::flash::display::DisplayObject set_hitTestState( ::flash::display::DisplayObject value);
		Dynamic set_hitTestState_dyn();

		virtual bool set_useHandCursor( bool value);
		Dynamic set_useHandCursor_dyn();

		virtual bool get_useHandCursor( );
		Dynamic get_useHandCursor_dyn();

		virtual bool set_enabled( bool value);
		Dynamic set_enabled_dyn();

		virtual bool get_enabled( );
		Dynamic get_enabled_dyn();

		virtual ::flash::display::DisplayObject set_downState( ::flash::display::DisplayObject value);
		Dynamic set_downState_dyn();

		::flash::display::DisplayObject upState;
		::flash::display::DisplayObject overState;
		::flash::display::DisplayObject hitTestState;
		::flash::display::DisplayObject downState;
		static Dynamic nme_simple_button_set_state;
		static Dynamic &nme_simple_button_set_state_dyn() { return nme_simple_button_set_state;}
		static Dynamic nme_simple_button_get_enabled;
		static Dynamic &nme_simple_button_get_enabled_dyn() { return nme_simple_button_get_enabled;}
		static Dynamic nme_simple_button_set_enabled;
		static Dynamic &nme_simple_button_set_enabled_dyn() { return nme_simple_button_set_enabled;}
		static Dynamic nme_simple_button_get_hand_cursor;
		static Dynamic &nme_simple_button_get_hand_cursor_dyn() { return nme_simple_button_get_hand_cursor;}
		static Dynamic nme_simple_button_set_hand_cursor;
		static Dynamic &nme_simple_button_set_hand_cursor_dyn() { return nme_simple_button_set_hand_cursor;}
		static Dynamic nme_simple_button_create;
		static Dynamic &nme_simple_button_create_dyn() { return nme_simple_button_create;}
};

} // end namespace flash
} // end namespace display

#endif /* INCLUDED_flash_display_SimpleButton */ 
