////////////////////////////////////////////////////////////////////////////////
//
//  pixelami.com
//  Copyright 2011 Original Authors
//  All Rights Reserved.
//
//  NOTICE: Pixelami permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package org.pixelami.fxg.elements
{
	import flash.display.Shape;

	import org.pixelami.fxg.elements.fills.IFXGFill;
	import org.pixelami.fxg.elements.strokes.IFXGStroke;
	
	public class FXGShapeElement extends FXGPlacedElement implements IFXGPaintable
	{
		
		private var _width:Number // <length>: 
		private var _height:Number //  <length>: 
		
		
		private var _fill:IFXGFill;
		private var _stroke:IFXGStroke;
		
		protected var fillShape:Shape;
		protected var strokeShape:Shape;
		
		public function FXGShapeElement()
		{
			super();
		}
		
		/**
		 * The width of the rectangle. A negative value is an error.
		 */
		override public function get width():Number
		{
			return _width;
		}
		
		override public function set width(value:Number):void
		{
			if(_width != value)
			{
				_width = value;
				invalidateDisplayList();
			}
		}
		
		/**
		 * The height of the rectangle. A negative value is an error.
		 */
		override public function get height():Number
		{
			return _height;
		}
		
		override public function set height(value:Number):void
		{
			if(_height != value)
			{
				_height = value;
				invalidateDisplayList();
			}
		}
		
		
		public function get fill():IFXGFill
		{
			return _fill;
		}

		public function set fill(value:IFXGFill):void
		{
			if(_fill != value)
			{
				_fill = value;
				invalidateDisplayList();
			}
			
		}

		public function get stroke():IFXGStroke
		{
			return _stroke;
		}

		public function set stroke(value:IFXGStroke):void
		{
			if(_stroke != value)
			{
				_stroke = value;
				invalidateDisplayList();
			}
		}
		
		override protected function createChildren():void
		{
			fillShape = new Shape();
			strokeShape = new Shape();
			
			addChild(fillShape);
			addChild(strokeShape);
		}
		
		override protected function updateDisplayList(unscaledWidth:Number=NaN, unscaledHeight:Number=NaN):void
		{
			super.updateDisplayList(unscaledWidth,unscaledHeight);
			
			if(fill)
			{
				renderFill();
			}
			
			if(stroke)
			{
				renderStroke();
			}
		}
		
		protected function renderFill():void{}
		protected function renderStroke():void{}
	}
}