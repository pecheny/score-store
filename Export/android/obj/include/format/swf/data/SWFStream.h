#ifndef INCLUDED_format_swf_data_SWFStream
#define INCLUDED_format_swf_data_SWFStream

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS2(flash,display,CapsStyle)
HX_DECLARE_CLASS2(flash,display,InterpolationMethod)
HX_DECLARE_CLASS2(flash,display,JointStyle)
HX_DECLARE_CLASS2(flash,display,LineScaleMode)
HX_DECLARE_CLASS2(flash,display,SpreadMethod)
HX_DECLARE_CLASS2(flash,geom,ColorTransform)
HX_DECLARE_CLASS2(flash,geom,Matrix)
HX_DECLARE_CLASS2(flash,geom,Rectangle)
HX_DECLARE_CLASS2(flash,utils,ByteArray)
HX_DECLARE_CLASS2(flash,utils,IDataInput)
HX_DECLARE_CLASS2(flash,utils,IDataOutput)
HX_DECLARE_CLASS3(format,swf,data,SWFStream)
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS2(openfl,utils,IMemoryRange)
namespace format{
namespace swf{
namespace data{


class HXCPP_CLASS_ATTRIBUTES  SWFStream_obj : public hx::Object{
	public:
		typedef hx::Object super;
		typedef SWFStream_obj OBJ_;
		SWFStream_obj();
		Void __construct(::flash::utils::ByteArray bytes);

	public:
		static hx::ObjectPtr< SWFStream_obj > __new(::flash::utils::ByteArray bytes);
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		~SWFStream_obj();

		HX_DO_RTTI;
		static void __boot();
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		::String __ToString() const { return HX_CSTRING("SWFStream"); }

		virtual int set_position( int value);
		Dynamic set_position_dyn();

		virtual int get_position( );
		Dynamic get_position_dyn();

		virtual Float readUTwips( );
		Dynamic readUTwips_dyn();

		virtual int readUInt16( );
		Dynamic readUInt16_dyn();

		virtual Float readTwips( int length);
		Dynamic readTwips_dyn();

		virtual ::String readString( );
		Dynamic readString_dyn();

		virtual ::flash::display::SpreadMethod readSpreadMethod( );
		Dynamic readSpreadMethod_dyn();

		virtual Float readSTwips( );
		Dynamic readSTwips_dyn();

		virtual int readSInt16( );
		Dynamic readSInt16_dyn();

		virtual ::flash::display::LineScaleMode readScaleMode( );
		Dynamic readScaleMode_dyn();

		virtual int readRGB( );
		Dynamic readRGB_dyn();

		virtual ::flash::geom::Rectangle readRect( );
		Dynamic readRect_dyn();

		virtual ::String readPascalString( );
		Dynamic readPascalString_dyn();

		virtual ::flash::geom::Matrix readMatrix( );
		Dynamic readMatrix_dyn();

		virtual ::flash::display::JointStyle readJoinStyle( );
		Dynamic readJoinStyle_dyn();

		virtual ::flash::display::InterpolationMethod readInterpolationMethod( );
		Dynamic readInterpolationMethod_dyn();

		virtual int readInt( );
		Dynamic readInt_dyn();

		virtual int readID( );
		Dynamic readID_dyn();

		virtual int readFrames( );
		Dynamic readFrames_dyn();

		virtual Float readFrameRate( );
		Dynamic readFrameRate_dyn();

		virtual Float readFloat( );
		Dynamic readFloat_dyn();

		virtual ::flash::utils::ByteArray readFlashBytes( int length);
		Dynamic readFlashBytes_dyn();

		virtual Float readFixedBits( int length);
		Dynamic readFixedBits_dyn();

		virtual Float readFixed8( );
		Dynamic readFixed8_dyn();

		virtual Float readFixed( );
		Dynamic readFixed_dyn();

		virtual int readDepth( );
		Dynamic readDepth_dyn();

		virtual ::flash::geom::ColorTransform readColorTransform( bool withAlpha);
		Dynamic readColorTransform_dyn();

		virtual ::flash::display::CapsStyle readCapsStyle( );
		Dynamic readCapsStyle_dyn();

		virtual ::flash::utils::ByteArray readBytes( int length);
		Dynamic readBytes_dyn();

		virtual int readByte( );
		Dynamic readByte_dyn();

		virtual bool readBool( );
		Dynamic readBool_dyn();

		virtual int readBits( int length,hx::Null< bool >  isSigned);
		Dynamic readBits_dyn();

		virtual int readArraySize( bool extended);
		Dynamic readArraySize_dyn();

		virtual ::String readAlign( );
		Dynamic readAlign_dyn();

		virtual Void pushTag( );
		Dynamic pushTag_dyn();

		virtual Void popTag( );
		Dynamic popTag_dyn();

		virtual int getVersion( );
		Dynamic getVersion_dyn();

		virtual int getBytesLeft( );
		Dynamic getBytesLeft_dyn();

		virtual Void endTag( );
		Dynamic endTag_dyn();

		virtual Void close( );
		Dynamic close_dyn();

		virtual int beginTag( );
		Dynamic beginTag_dyn();

		virtual Void alignBits( );
		Dynamic alignBits_dyn();

		int pushTagSize;
		int pushTagRead;
		int version;
		int tagSize;
		int tagRead;
		::flash::utils::ByteArray stream;
		int byteBuffer;
		int bitPosition;
};

} // end namespace format
} // end namespace swf
} // end namespace data

#endif /* INCLUDED_format_swf_data_SWFStream */ 
