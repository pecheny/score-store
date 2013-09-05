#include <hxcpp.h>

#ifndef INCLUDED_IMap
#include <IMap.h>
#endif
#ifndef INCLUDED_List
#include <List.h>
#endif
#ifndef INCLUDED_Std
#include <Std.h>
#endif
#ifndef INCLUDED_flash_display_Bitmap
#include <flash/display/Bitmap.h>
#endif
#ifndef INCLUDED_flash_display_BitmapData
#include <flash/display/BitmapData.h>
#endif
#ifndef INCLUDED_flash_display_BlendMode
#include <flash/display/BlendMode.h>
#endif
#ifndef INCLUDED_flash_display_DisplayObject
#include <flash/display/DisplayObject.h>
#endif
#ifndef INCLUDED_flash_display_DisplayObjectContainer
#include <flash/display/DisplayObjectContainer.h>
#endif
#ifndef INCLUDED_flash_display_Graphics
#include <flash/display/Graphics.h>
#endif
#ifndef INCLUDED_flash_display_IBitmapDrawable
#include <flash/display/IBitmapDrawable.h>
#endif
#ifndef INCLUDED_flash_display_InteractiveObject
#include <flash/display/InteractiveObject.h>
#endif
#ifndef INCLUDED_flash_display_MovieClip
#include <flash/display/MovieClip.h>
#endif
#ifndef INCLUDED_flash_display_PixelSnapping
#include <flash/display/PixelSnapping.h>
#endif
#ifndef INCLUDED_flash_display_Shape
#include <flash/display/Shape.h>
#endif
#ifndef INCLUDED_flash_display_SimpleButton
#include <flash/display/SimpleButton.h>
#endif
#ifndef INCLUDED_flash_display_Sprite
#include <flash/display/Sprite.h>
#endif
#ifndef INCLUDED_flash_events_Event
#include <flash/events/Event.h>
#endif
#ifndef INCLUDED_flash_events_EventDispatcher
#include <flash/events/EventDispatcher.h>
#endif
#ifndef INCLUDED_flash_events_IEventDispatcher
#include <flash/events/IEventDispatcher.h>
#endif
#ifndef INCLUDED_flash_geom_ColorTransform
#include <flash/geom/ColorTransform.h>
#endif
#ifndef INCLUDED_flash_geom_Matrix
#include <flash/geom/Matrix.h>
#endif
#ifndef INCLUDED_flash_geom_Rectangle
#include <flash/geom/Rectangle.h>
#endif
#ifndef INCLUDED_flash_text_TextField
#include <flash/text/TextField.h>
#endif
#ifndef INCLUDED_format_SWF
#include <format/SWF.h>
#endif
#ifndef INCLUDED_format_display_FrameLabel
#include <format/display/FrameLabel.h>
#endif
#ifndef INCLUDED_format_display_MovieClip
#include <format/display/MovieClip.h>
#endif
#ifndef INCLUDED_format_swf_MorphObject
#include <format/swf/MorphObject.h>
#endif
#ifndef INCLUDED_format_swf_MovieClip
#include <format/swf/MovieClip.h>
#endif
#ifndef INCLUDED_format_swf_data_DepthSlot
#include <format/swf/data/DepthSlot.h>
#endif
#ifndef INCLUDED_format_swf_data_DisplayAttributes
#include <format/swf/data/DisplayAttributes.h>
#endif
#ifndef INCLUDED_format_swf_data_Frame
#include <format/swf/data/Frame.h>
#endif
#ifndef INCLUDED_format_swf_symbol_Button
#include <format/swf/symbol/Button.h>
#endif
#ifndef INCLUDED_format_swf_symbol_EditText
#include <format/swf/symbol/EditText.h>
#endif
#ifndef INCLUDED_format_swf_symbol_MorphShape
#include <format/swf/symbol/MorphShape.h>
#endif
#ifndef INCLUDED_format_swf_symbol_Shape
#include <format/swf/symbol/Shape.h>
#endif
#ifndef INCLUDED_format_swf_symbol_Sprite
#include <format/swf/symbol/Sprite.h>
#endif
#ifndef INCLUDED_format_swf_symbol_StaticText
#include <format/swf/symbol/StaticText.h>
#endif
#ifndef INCLUDED_format_swf_symbol_Symbol
#include <format/swf/symbol/Symbol.h>
#endif
#ifndef INCLUDED_haxe_ds_IntMap
#include <haxe/ds/IntMap.h>
#endif
#ifndef INCLUDED_haxe_ds_StringMap
#include <haxe/ds/StringMap.h>
#endif
namespace format{
namespace swf{

Void MovieClip_obj::__construct(::format::swf::symbol::Sprite data)
{
HX_STACK_PUSH("MovieClip::new","format/swf/MovieClip.hx",33);
{
	HX_STACK_LINE(35)
	super::__construct();
	HX_STACK_LINE(37)
	this->objectPool = ::haxe::ds::IntMap_obj::__new();
	HX_STACK_LINE(39)
	this->enabled = true;
	HX_STACK_LINE(40)
	this->playing = false;
	HX_STACK_LINE(43)
	this->currentFrameLabel = null();
	HX_STACK_LINE(44)
	this->currentLabel = null();
	HX_STACK_LINE(45)
	this->currentLabels = Array_obj< ::Dynamic >::__new();
	HX_STACK_LINE(48)
	if (((data != null()))){
		HX_STACK_LINE(50)
		this->__totalFrames = data->frameCount;
		HX_STACK_LINE(51)
		this->__currentFrame = this->__totalFrames;
		HX_STACK_LINE(53)
		this->framesLoaded = this->__totalFrames;
		HX_STACK_LINE(56)
		this->swf = data->swf;
		HX_STACK_LINE(57)
		this->frames = data->frames;
		HX_STACK_LINE(60)
		for(::cpp::FastIterator_obj< ::String > *__it = ::cpp::CreateFastIterator< ::String >(data->frameLabels->keys());  __it->hasNext(); ){
			::String label = __it->next();
			{
				HX_STACK_LINE(62)
				::format::display::FrameLabel frameLabel = ::format::display::FrameLabel_obj::__new(data->frameLabels->get(label),label);		HX_STACK_VAR(frameLabel,"frameLabel");
				HX_STACK_LINE(63)
				this->currentLabels->push(frameLabel);
			}
;
		}
		HX_STACK_LINE(68)
		this->activeObjects = Dynamic( Array_obj<Dynamic>::__new() );
		HX_STACK_LINE(71)
		this->__currentFrame = (int)1;
		HX_STACK_LINE(72)
		this->updateObjects();
		HX_STACK_LINE(73)
		this->play();
	}
	else{
		HX_STACK_LINE(77)
		this->__currentFrame = (int)1;
		HX_STACK_LINE(78)
		this->__totalFrames = (int)1;
		HX_STACK_LINE(80)
		this->framesLoaded = (int)1;
	}
}
;
	return null();
}

MovieClip_obj::~MovieClip_obj() { }

Dynamic MovieClip_obj::__CreateEmpty() { return  new MovieClip_obj; }
hx::ObjectPtr< MovieClip_obj > MovieClip_obj::__new(::format::swf::symbol::Sprite data)
{  hx::ObjectPtr< MovieClip_obj > result = new MovieClip_obj();
	result->__construct(data);
	return result;}

Dynamic MovieClip_obj::__Create(hx::DynamicArray inArgs)
{  hx::ObjectPtr< MovieClip_obj > result = new MovieClip_obj();
	result->__construct(inArgs[0]);
	return result;}

Void MovieClip_obj::this_onEnterFrame( ::flash::events::Event event){
{
		HX_STACK_PUSH("MovieClip::this_onEnterFrame","format/swf/MovieClip.hx",493);
		HX_STACK_THIS(this);
		HX_STACK_ARG(event,"event");
		HX_STACK_LINE(493)
		if ((this->playing)){
			HX_STACK_LINE(497)
			(this->__currentFrame)++;
			HX_STACK_LINE(499)
			if (((this->__currentFrame > this->__totalFrames))){
				HX_STACK_LINE(499)
				this->__currentFrame = (int)1;
			}
			HX_STACK_LINE(505)
			this->updateObjects();
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC1(MovieClip_obj,this_onEnterFrame,(void))

Void MovieClip_obj::updateObjects( ){
{
		HX_STACK_PUSH("MovieClip::updateObjects","format/swf/MovieClip.hx",254);
		HX_STACK_THIS(this);
		HX_STACK_LINE(254)
		if (((this->frames != null()))){
			HX_STACK_LINE(258)
			::format::swf::data::Frame frame = this->frames->__get(this->__currentFrame).StaticCast< ::format::swf::data::Frame >();		HX_STACK_VAR(frame,"frame");
			HX_STACK_LINE(259)
			bool depthChanged = false;		HX_STACK_VAR(depthChanged,"depthChanged");
			HX_STACK_LINE(260)
			bool waitingLoader = false;		HX_STACK_VAR(waitingLoader,"waitingLoader");
			HX_STACK_LINE(262)
			if (((frame != null()))){
				HX_STACK_LINE(264)
				::haxe::ds::IntMap frameObjects = frame->copyObjectSet();		HX_STACK_VAR(frameObjects,"frameObjects");
				HX_STACK_LINE(265)
				Dynamic newActiveObjects = Dynamic( Array_obj<Dynamic>::__new() );		HX_STACK_VAR(newActiveObjects,"newActiveObjects");
				HX_STACK_LINE(267)
				{
					HX_STACK_LINE(267)
					int _g = (int)0;		HX_STACK_VAR(_g,"_g");
					Dynamic _g1 = this->activeObjects;		HX_STACK_VAR(_g1,"_g1");
					HX_STACK_LINE(267)
					while(((_g < _g1->__Field(HX_CSTRING("length"),true)))){
						HX_STACK_LINE(267)
						Dynamic activeObject = _g1->__GetItem(_g);		HX_STACK_VAR(activeObject,"activeObject");
						HX_STACK_LINE(267)
						++(_g);
						HX_STACK_LINE(269)
						::format::swf::data::DepthSlot depthSlot = frameObjects->get(activeObject->__Field(HX_CSTRING("depth"),true));		HX_STACK_VAR(depthSlot,"depthSlot");
						HX_STACK_LINE(271)
						if (((bool((bool((depthSlot == null())) || bool((depthSlot->symbolID != activeObject->__Field(HX_CSTRING("symbolID"),true))))) || bool(activeObject->__Field(HX_CSTRING("waitingLoader"),true))))){
							HX_STACK_LINE(275)
							if ((!(activeObject->__Field(HX_CSTRING("waitingLoader"),true)))){
								HX_STACK_LINE(277)
								::List pool = this->objectPool->get(activeObject->__Field(HX_CSTRING("symbolID"),true));		HX_STACK_VAR(pool,"pool");
								HX_STACK_LINE(279)
								if (((pool == null()))){
									HX_STACK_LINE(281)
									pool = ::List_obj::__new();
									HX_STACK_LINE(282)
									this->objectPool->set(activeObject->__Field(HX_CSTRING("symbolID"),true),pool);
								}
								HX_STACK_LINE(286)
								pool->push(activeObject->__Field(HX_CSTRING("object"),true));
							}
							HX_STACK_LINE(291)
							this->removeChild(activeObject->__Field(HX_CSTRING("object"),true));
						}
						else{
							HX_STACK_LINE(296)
							frameObjects->remove(activeObject->__Field(HX_CSTRING("depth"),true));
							HX_STACK_LINE(298)
							activeObject->__FieldRef(HX_CSTRING("index")) = depthSlot->findClosestFrame(activeObject->__Field(HX_CSTRING("index"),true),this->__currentFrame);
							HX_STACK_LINE(299)
							::format::swf::data::DisplayAttributes attributes = depthSlot->attributes->__get(activeObject->__Field(HX_CSTRING("index"),true)).StaticCast< ::format::swf::data::DisplayAttributes >();		HX_STACK_VAR(attributes,"attributes");
							HX_STACK_LINE(300)
							attributes->apply(activeObject->__Field(HX_CSTRING("object"),true));
							HX_STACK_LINE(302)
							newActiveObjects->__Field(HX_CSTRING("push"),true)(activeObject);
						}
					}
				}
				HX_STACK_LINE(309)
				for(::cpp::FastIterator_obj< int > *__it = ::cpp::CreateFastIterator< int >(frameObjects->keys());  __it->hasNext(); ){
					int depth = __it->next();
					{
						HX_STACK_LINE(311)
						::format::swf::data::DepthSlot slot = frameObjects->get(depth);		HX_STACK_VAR(slot,"slot");
						HX_STACK_LINE(312)
						::flash::display::DisplayObject displayObject = null();		HX_STACK_VAR(displayObject,"displayObject");
						HX_STACK_LINE(313)
						::List pool = this->objectPool->get(slot->symbolID);		HX_STACK_VAR(pool,"pool");
						HX_STACK_LINE(315)
						if (((bool((pool != null())) && bool((pool->length > (int)0))))){
							HX_STACK_LINE(317)
							displayObject = pool->pop();
							HX_STACK_LINE(319)
							{
								::format::swf::symbol::Symbol _switch_1 = (slot->symbol);
								switch((_switch_1)->GetIndex()){
									case 2: {
										HX_STACK_LINE(323)
										::format::swf::MovieClip clip = displayObject;		HX_STACK_VAR(clip,"clip");
										HX_STACK_LINE(324)
										clip->gotoAndPlay((int)1,null());
									}
									;break;
									default: {
									}
								}
							}
						}
						else{
							HX_STACK_LINE(331)
							{
								::format::swf::symbol::Symbol _switch_2 = (slot->symbol);
								switch((_switch_2)->GetIndex()){
									case 2: {
										::format::swf::symbol::Sprite sprite = _switch_2->__Param(0);
{
											HX_STACK_LINE(337)
											::format::swf::MovieClip movie = ::format::swf::MovieClip_obj::__new(sprite);		HX_STACK_VAR(movie,"movie");
											HX_STACK_LINE(338)
											displayObject = movie;
										}
									}
									;break;
									case 0: {
										::format::swf::symbol::Shape shape = _switch_2->__Param(0);
{
											HX_STACK_LINE(342)
											::flash::display::Shape s = ::flash::display::Shape_obj::__new();		HX_STACK_VAR(s,"s");
											HX_STACK_LINE(344)
											if (((bool((bool(shape->hasBitmapRepeat) || bool(shape->hasCurves))) || bool(shape->hasGradientFill)))){
												HX_STACK_LINE(344)
												s->set_cacheAsBitmap(true);
											}
											HX_STACK_LINE(351)
											waitingLoader = shape->render(s->get_graphics());
											HX_STACK_LINE(352)
											displayObject = s;
										}
									}
									;break;
									case 1: {
										::format::swf::symbol::MorphShape morphData = _switch_2->__Param(0);
{
											HX_STACK_LINE(356)
											::format::swf::MorphObject morph = ::format::swf::MorphObject_obj::__new(morphData);		HX_STACK_VAR(morph,"morph");
											HX_STACK_LINE(358)
											displayObject = morph;
										}
									}
									;break;
									case 5: {
										::format::swf::symbol::StaticText text = _switch_2->__Param(0);
{
											HX_STACK_LINE(362)
											::flash::display::Shape s = ::flash::display::Shape_obj::__new();		HX_STACK_VAR(s,"s");
											HX_STACK_LINE(363)
											s->set_cacheAsBitmap(true);
											HX_STACK_LINE(364)
											text->render(s->get_graphics());
											HX_STACK_LINE(365)
											displayObject = s;
										}
									}
									;break;
									case 6: {
										::format::swf::symbol::EditText text = _switch_2->__Param(0);
{
											HX_STACK_LINE(369)
											::flash::text::TextField t = ::flash::text::TextField_obj::__new();		HX_STACK_VAR(t,"t");
											HX_STACK_LINE(370)
											text->apply(t);
											HX_STACK_LINE(371)
											displayObject = t;
										}
									}
									;break;
									case 3: {
										HX_STACK_LINE(373)
										hx::Throw (HX_CSTRING("Adding bitmap?"));
									}
									;break;
									case 4: {
										HX_STACK_LINE(377)
										hx::Throw (HX_CSTRING("Adding font?"));
									}
									;break;
									case 7: {
										::format::swf::symbol::Button button = _switch_2->__Param(0);
{
											HX_STACK_LINE(383)
											::flash::display::SimpleButton b = ::flash::display::SimpleButton_obj::__new(null(),null(),null(),null());		HX_STACK_VAR(b,"b");
											HX_STACK_LINE(384)
											button->apply(b);
											HX_STACK_LINE(385)
											displayObject = b;
										}
									}
									;break;
								}
							}
						}
						HX_STACK_LINE(396)
						bool added = false;		HX_STACK_VAR(added,"added");
						HX_STACK_LINE(400)
						{
							HX_STACK_LINE(400)
							int _g1 = (int)0;		HX_STACK_VAR(_g1,"_g1");
							int _g = this->get_numChildren();		HX_STACK_VAR(_g,"_g");
							HX_STACK_LINE(400)
							while(((_g1 < _g))){
								HX_STACK_LINE(400)
								int cid = (_g1)++;		HX_STACK_VAR(cid,"cid");
								HX_STACK_LINE(408)
								int childDepth = (int)-1;		HX_STACK_VAR(childDepth,"childDepth");
								HX_STACK_LINE(409)
								::flash::display::DisplayObject sought = this->getChildAt(cid);		HX_STACK_VAR(sought,"sought");
								HX_STACK_LINE(411)
								{
									HX_STACK_LINE(411)
									int _g2 = (int)0;		HX_STACK_VAR(_g2,"_g2");
									HX_STACK_LINE(411)
									while(((_g2 < newActiveObjects->__Field(HX_CSTRING("length"),true)))){
										HX_STACK_LINE(411)
										Dynamic child = newActiveObjects->__GetItem(_g2);		HX_STACK_VAR(child,"child");
										HX_STACK_LINE(411)
										++(_g2);
										HX_STACK_LINE(413)
										if (((child->__Field(HX_CSTRING("object"),true) == sought))){
											HX_STACK_LINE(415)
											childDepth = child->__Field(HX_CSTRING("depth"),true);
											HX_STACK_LINE(416)
											break;
										}
									}
								}
								HX_STACK_LINE(424)
								if (((childDepth > depth))){
									HX_STACK_LINE(426)
									this->addChildAt(displayObject,cid);
									HX_STACK_LINE(427)
									added = true;
									HX_STACK_LINE(428)
									break;
								}
							}
						}
						HX_STACK_LINE(434)
						if ((!(added))){
							HX_STACK_LINE(434)
							this->addChild(displayObject);
						}
						HX_STACK_LINE(440)
						int idx = slot->findClosestFrame((int)0,this->__currentFrame);		HX_STACK_VAR(idx,"idx");
						HX_STACK_LINE(441)
						slot->attributes->__get(idx).StaticCast< ::format::swf::data::DisplayAttributes >()->apply(displayObject);
						struct _Function_4_1{
							inline static Dynamic Block( int &idx,::flash::display::DisplayObject &displayObject,int &depth,bool &waitingLoader,::format::swf::data::DepthSlot &slot){
								HX_STACK_PUSH("*::closure","format/swf/MovieClip.hx",443);
								{
									hx::Anon __result = hx::Anon_obj::Create();
									__result->Add(HX_CSTRING("object") , displayObject,false);
									__result->Add(HX_CSTRING("depth") , depth,false);
									__result->Add(HX_CSTRING("index") , idx,false);
									__result->Add(HX_CSTRING("symbolID") , slot->symbolID,false);
									__result->Add(HX_CSTRING("waitingLoader") , waitingLoader,false);
									return __result;
								}
								return null();
							}
						};
						HX_STACK_LINE(443)
						Dynamic act = _Function_4_1::Block(idx,displayObject,depth,waitingLoader,slot);		HX_STACK_VAR(act,"act");
						HX_STACK_LINE(445)
						newActiveObjects->__Field(HX_CSTRING("push"),true)(act);
						HX_STACK_LINE(446)
						depthChanged = true;
					}
;
				}
				HX_STACK_LINE(450)
				this->activeObjects = newActiveObjects;
				HX_STACK_LINE(454)
				this->currentFrameLabel = null();
				HX_STACK_LINE(456)
				{
					HX_STACK_LINE(456)
					int _g = (int)0;		HX_STACK_VAR(_g,"_g");
					Array< ::Dynamic > _g1 = this->currentLabels;		HX_STACK_VAR(_g1,"_g1");
					HX_STACK_LINE(456)
					while(((_g < _g1->length))){
						HX_STACK_LINE(456)
						::format::display::FrameLabel frameLabel = _g1->__get(_g).StaticCast< ::format::display::FrameLabel >();		HX_STACK_VAR(frameLabel,"frameLabel");
						HX_STACK_LINE(456)
						++(_g);
						HX_STACK_LINE(458)
						if (((frameLabel->frame < frame->frame))){
							HX_STACK_LINE(458)
							this->currentLabel = frameLabel->name;
						}
						else{
							HX_STACK_LINE(462)
							if (((frameLabel->frame == frame->frame))){
								HX_STACK_LINE(464)
								this->currentFrameLabel = frameLabel->name;
								HX_STACK_LINE(465)
								this->currentLabel = this->currentFrameLabel;
								HX_STACK_LINE(467)
								break;
							}
							else{
								HX_STACK_LINE(469)
								break;
							}
						}
					}
				}
			}
		}
	}
return null();
}


HX_DEFINE_DYNAMIC_FUNC0(MovieClip_obj,updateObjects,(void))

Void MovieClip_obj::unflatten( ){
{
		HX_STACK_PUSH("MovieClip::unflatten","format/swf/MovieClip.hx",247);
		HX_STACK_THIS(this);
		HX_STACK_LINE(247)
		this->updateObjects();
	}
return null();
}


Void MovieClip_obj::stop( ){
{
		HX_STACK_PUSH("MovieClip::stop","format/swf/MovieClip.hx",239);
		HX_STACK_THIS(this);
		HX_STACK_LINE(241)
		this->playing = false;
		HX_STACK_LINE(242)
		this->removeEventListener(::flash::events::Event_obj::ENTER_FRAME,this->this_onEnterFrame_dyn(),null());
	}
return null();
}


Void MovieClip_obj::prevFrame( ){
{
		HX_STACK_PUSH("MovieClip::prevFrame","format/swf/MovieClip.hx",224);
		HX_STACK_THIS(this);
		HX_STACK_LINE(226)
		int previous = (this->__currentFrame - (int)1);		HX_STACK_VAR(previous,"previous");
		HX_STACK_LINE(228)
		if (((previous < (int)1))){
			HX_STACK_LINE(228)
			previous = (int)1;
		}
		HX_STACK_LINE(234)
		this->gotoAndStop(previous,null());
	}
return null();
}


Void MovieClip_obj::play( ){
{
		HX_STACK_PUSH("MovieClip::play","format/swf/MovieClip.hx",207);
		HX_STACK_THIS(this);
		HX_STACK_LINE(207)
		if (((this->__totalFrames > (int)1))){
			HX_STACK_LINE(211)
			this->playing = true;
			HX_STACK_LINE(212)
			this->removeEventListener(::flash::events::Event_obj::ENTER_FRAME,this->this_onEnterFrame_dyn(),null());
			HX_STACK_LINE(213)
			this->addEventListener(::flash::events::Event_obj::ENTER_FRAME,this->this_onEnterFrame_dyn(),null(),null(),null());
		}
		else{
			HX_STACK_LINE(215)
			this->stop();
		}
	}
return null();
}


Void MovieClip_obj::nextFrame( ){
{
		HX_STACK_PUSH("MovieClip::nextFrame","format/swf/MovieClip.hx",185);
		HX_STACK_THIS(this);
		HX_STACK_LINE(187)
		int next = (this->__currentFrame + (int)1);		HX_STACK_VAR(next,"next");
		HX_STACK_LINE(189)
		if (((next > this->__totalFrames))){
			HX_STACK_LINE(189)
			next = this->__totalFrames;
		}
		HX_STACK_LINE(195)
		this->gotoAndStop(next,null());
	}
return null();
}


Void MovieClip_obj::gotoAndStop( Dynamic frame,::String scene){
{
		HX_STACK_PUSH("MovieClip::gotoAndStop","format/swf/MovieClip.hx",153);
		HX_STACK_THIS(this);
		HX_STACK_ARG(frame,"frame");
		HX_STACK_ARG(scene,"scene");
		HX_STACK_LINE(155)
		if (((frame != this->__currentFrame))){
			HX_STACK_LINE(157)
			if ((::Std_obj::is(frame,hx::ClassOf< ::String >()))){
				HX_STACK_LINE(159)
				int _g = (int)0;		HX_STACK_VAR(_g,"_g");
				Array< ::Dynamic > _g1 = this->currentLabels;		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(159)
				while(((_g < _g1->length))){
					HX_STACK_LINE(159)
					::format::display::FrameLabel frameLabel = _g1->__get(_g).StaticCast< ::format::display::FrameLabel >();		HX_STACK_VAR(frameLabel,"frameLabel");
					HX_STACK_LINE(159)
					++(_g);
					HX_STACK_LINE(161)
					if (((frameLabel->name == frame))){
						HX_STACK_LINE(163)
						this->__currentFrame = frameLabel->frame;
						HX_STACK_LINE(164)
						break;
					}
				}
			}
			else{
				HX_STACK_LINE(170)
				this->__currentFrame = frame;
			}
			HX_STACK_LINE(176)
			this->updateObjects();
		}
		HX_STACK_LINE(180)
		this->stop();
	}
return null();
}


Void MovieClip_obj::gotoAndPlay( Dynamic frame,::String scene){
{
		HX_STACK_PUSH("MovieClip::gotoAndPlay","format/swf/MovieClip.hx",121);
		HX_STACK_THIS(this);
		HX_STACK_ARG(frame,"frame");
		HX_STACK_ARG(scene,"scene");
		HX_STACK_LINE(123)
		if (((frame != this->__currentFrame))){
			HX_STACK_LINE(125)
			if ((::Std_obj::is(frame,hx::ClassOf< ::String >()))){
				HX_STACK_LINE(127)
				int _g = (int)0;		HX_STACK_VAR(_g,"_g");
				Array< ::Dynamic > _g1 = this->currentLabels;		HX_STACK_VAR(_g1,"_g1");
				HX_STACK_LINE(127)
				while(((_g < _g1->length))){
					HX_STACK_LINE(127)
					::format::display::FrameLabel frameLabel = _g1->__get(_g).StaticCast< ::format::display::FrameLabel >();		HX_STACK_VAR(frameLabel,"frameLabel");
					HX_STACK_LINE(127)
					++(_g);
					HX_STACK_LINE(129)
					if (((frameLabel->name == frame))){
						HX_STACK_LINE(131)
						this->__currentFrame = frameLabel->frame;
						HX_STACK_LINE(132)
						break;
					}
				}
			}
			else{
				HX_STACK_LINE(138)
				this->__currentFrame = frame;
			}
			HX_STACK_LINE(144)
			this->updateObjects();
		}
		HX_STACK_LINE(148)
		this->play();
	}
return null();
}


Void MovieClip_obj::flatten( ){
{
		HX_STACK_PUSH("MovieClip::flatten","format/swf/MovieClip.hx",88);
		HX_STACK_THIS(this);
		HX_STACK_LINE(94)
		::flash::geom::Rectangle bounds = this->getBounds(hx::ObjectPtr<OBJ_>(this));		HX_STACK_VAR(bounds,"bounds");
		HX_STACK_LINE(95)
		::flash::display::BitmapData bitmapData = ::flash::display::BitmapData_obj::__new(::Std_obj::_int(bounds->get_right()),::Std_obj::_int(bounds->get_bottom()),true,(int)0,null());		HX_STACK_VAR(bitmapData,"bitmapData");
		HX_STACK_LINE(96)
		bitmapData->draw(hx::ObjectPtr<OBJ_>(this),null(),null(),null(),null(),null());
		HX_STACK_LINE(98)
		{
			HX_STACK_LINE(98)
			int _g = (int)0;		HX_STACK_VAR(_g,"_g");
			Dynamic _g1 = this->activeObjects;		HX_STACK_VAR(_g1,"_g1");
			HX_STACK_LINE(98)
			while(((_g < _g1->__Field(HX_CSTRING("length"),true)))){
				HX_STACK_LINE(98)
				Dynamic activeObject = _g1->__GetItem(_g);		HX_STACK_VAR(activeObject,"activeObject");
				HX_STACK_LINE(98)
				++(_g);
				HX_STACK_LINE(100)
				this->removeChild(activeObject->__Field(HX_CSTRING("object"),true));
			}
		}
		HX_STACK_LINE(104)
		::flash::display::Bitmap bitmap = ::flash::display::Bitmap_obj::__new(bitmapData,null(),null());		HX_STACK_VAR(bitmap,"bitmap");
		HX_STACK_LINE(105)
		bitmap->set_smoothing(true);
		HX_STACK_LINE(106)
		this->addChild(bitmap);
		struct _Function_1_1{
			inline static Dynamic Block( ::flash::display::Bitmap &bitmap){
				HX_STACK_PUSH("*::closure","format/swf/MovieClip.hx",108);
				{
					hx::Anon __result = hx::Anon_obj::Create();
					__result->Add(HX_CSTRING("object") , hx::TCast< flash::display::DisplayObject >::cast(bitmap),false);
					__result->Add(HX_CSTRING("depth") , (int)0,false);
					__result->Add(HX_CSTRING("symbolID") , (int)-1,false);
					__result->Add(HX_CSTRING("index") , (int)0,false);
					__result->Add(HX_CSTRING("waitingLoader") , false,false);
					return __result;
				}
				return null();
			}
		};
		HX_STACK_LINE(108)
		Dynamic object = _Function_1_1::Block(bitmap);		HX_STACK_VAR(object,"object");
		HX_STACK_LINE(110)
		this->activeObjects = Dynamic( Array_obj<Dynamic>::__new().Add(object));
	}
return null();
}



MovieClip_obj::MovieClip_obj()
{
}

void MovieClip_obj::__Mark(HX_MARK_PARAMS)
{
	HX_MARK_BEGIN_CLASS(MovieClip);
	HX_MARK_MEMBER_NAME(swf,"swf");
	HX_MARK_MEMBER_NAME(playing,"playing");
	HX_MARK_MEMBER_NAME(objectPool,"objectPool");
	HX_MARK_MEMBER_NAME(frames,"frames");
	HX_MARK_MEMBER_NAME(activeObjects,"activeObjects");
	super::__Mark(HX_MARK_ARG);
	HX_MARK_END_CLASS();
}

void MovieClip_obj::__Visit(HX_VISIT_PARAMS)
{
	HX_VISIT_MEMBER_NAME(swf,"swf");
	HX_VISIT_MEMBER_NAME(playing,"playing");
	HX_VISIT_MEMBER_NAME(objectPool,"objectPool");
	HX_VISIT_MEMBER_NAME(frames,"frames");
	HX_VISIT_MEMBER_NAME(activeObjects,"activeObjects");
	super::__Visit(HX_VISIT_ARG);
}

Dynamic MovieClip_obj::__Field(const ::String &inName,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"swf") ) { return swf; }
		break;
	case 4:
		if (HX_FIELD_EQ(inName,"stop") ) { return stop_dyn(); }
		if (HX_FIELD_EQ(inName,"play") ) { return play_dyn(); }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"frames") ) { return frames; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"flatten") ) { return flatten_dyn(); }
		if (HX_FIELD_EQ(inName,"playing") ) { return playing; }
		break;
	case 9:
		if (HX_FIELD_EQ(inName,"unflatten") ) { return unflatten_dyn(); }
		if (HX_FIELD_EQ(inName,"prevFrame") ) { return prevFrame_dyn(); }
		if (HX_FIELD_EQ(inName,"nextFrame") ) { return nextFrame_dyn(); }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"objectPool") ) { return objectPool; }
		break;
	case 11:
		if (HX_FIELD_EQ(inName,"gotoAndStop") ) { return gotoAndStop_dyn(); }
		if (HX_FIELD_EQ(inName,"gotoAndPlay") ) { return gotoAndPlay_dyn(); }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"updateObjects") ) { return updateObjects_dyn(); }
		if (HX_FIELD_EQ(inName,"activeObjects") ) { return activeObjects; }
		break;
	case 17:
		if (HX_FIELD_EQ(inName,"this_onEnterFrame") ) { return this_onEnterFrame_dyn(); }
	}
	return super::__Field(inName,inCallProp);
}

Dynamic MovieClip_obj::__SetField(const ::String &inName,const Dynamic &inValue,bool inCallProp)
{
	switch(inName.length) {
	case 3:
		if (HX_FIELD_EQ(inName,"swf") ) { swf=inValue.Cast< ::format::SWF >(); return inValue; }
		break;
	case 6:
		if (HX_FIELD_EQ(inName,"frames") ) { frames=inValue.Cast< Array< ::Dynamic > >(); return inValue; }
		break;
	case 7:
		if (HX_FIELD_EQ(inName,"playing") ) { playing=inValue.Cast< bool >(); return inValue; }
		break;
	case 10:
		if (HX_FIELD_EQ(inName,"objectPool") ) { objectPool=inValue.Cast< ::haxe::ds::IntMap >(); return inValue; }
		break;
	case 13:
		if (HX_FIELD_EQ(inName,"activeObjects") ) { activeObjects=inValue.Cast< Dynamic >(); return inValue; }
	}
	return super::__SetField(inName,inValue,inCallProp);
}

void MovieClip_obj::__GetFields(Array< ::String> &outFields)
{
	outFields->push(HX_CSTRING("swf"));
	outFields->push(HX_CSTRING("playing"));
	outFields->push(HX_CSTRING("objectPool"));
	outFields->push(HX_CSTRING("frames"));
	outFields->push(HX_CSTRING("activeObjects"));
	super::__GetFields(outFields);
};

static ::String sStaticFields[] = {
	String(null()) };

static ::String sMemberFields[] = {
	HX_CSTRING("this_onEnterFrame"),
	HX_CSTRING("updateObjects"),
	HX_CSTRING("unflatten"),
	HX_CSTRING("stop"),
	HX_CSTRING("prevFrame"),
	HX_CSTRING("play"),
	HX_CSTRING("nextFrame"),
	HX_CSTRING("gotoAndStop"),
	HX_CSTRING("gotoAndPlay"),
	HX_CSTRING("flatten"),
	HX_CSTRING("swf"),
	HX_CSTRING("playing"),
	HX_CSTRING("objectPool"),
	HX_CSTRING("frames"),
	HX_CSTRING("activeObjects"),
	String(null()) };

static void sMarkStatics(HX_MARK_PARAMS) {
	HX_MARK_MEMBER_NAME(MovieClip_obj::__mClass,"__mClass");
};

static void sVisitStatics(HX_VISIT_PARAMS) {
	HX_VISIT_MEMBER_NAME(MovieClip_obj::__mClass,"__mClass");
};

Class MovieClip_obj::__mClass;

void MovieClip_obj::__register()
{
	hx::Static(__mClass) = hx::RegisterClass(HX_CSTRING("format.swf.MovieClip"), hx::TCanCast< MovieClip_obj> ,sStaticFields,sMemberFields,
	&__CreateEmpty, &__Create,
	&super::__SGetClass(), 0, sMarkStatics, sVisitStatics);
}

void MovieClip_obj::__boot()
{
}

} // end namespace format
} // end namespace swf
