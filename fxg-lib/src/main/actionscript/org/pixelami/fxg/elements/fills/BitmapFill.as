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


package org.pixelami.fxg.elements.fills
{
	import flash.display.Bitmap;
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;

	/*
	Children
	
	* matrix
	*/
	
	public class BitmapFill extends FXGFill implements IFXGFill
	{
		private var _x:Number;
		private var _y:Number;
		private var _scaleX:Number;
		private var _scaleY:Number;
		private var _rotation:Number;
		private var _transformX:Number;
		private var _transformY:Number;
		private var _source:String;
		private var _repeat:Boolean;
		
		
		private var loader:Loader;
		private var bitmap:Bitmap;
		private var smooth:Boolean = true;
		
		
		private var pendingFill:Boolean;
		
		private var _matrix:Matrix = new Matrix();
		public function get matrix():Matrix
		{
			return _matrix;
		}
		
		public function set matrix(value:Matrix):void
		{
			_matrix = value;
		}
		
		/**
		 * The horizontal translation of the transform that defines the horizontal center of the gradient.
		 */
		
		public function get x():Number
		{
			return _x;
		}

		
		public function set x(value:Number):void
		{
			_x = value;
		}
		
		/**
		 * The vertical translation of the transform that defines the vertical center of the gradient.
		 */

		public function get y():Number
		{
			return _y;
		}

		public function set y(value:Number):void
		{
			_y = value;
		}
		
		/**
		 * The horizontal scale of the transform that defines the width of the (unrotated) gradient.
		 */

		public function get scaleX():Number
		{
			return _scaleX;
		}

		public function set scaleX(value:Number):void
		{
			_scaleX = value;
		}
		
		/**
		 * The vertical scale of the transform that defines the width of the (unrotated) gradient.
		 */

		public function get scaleY():Number
		{
			return _scaleY;
		}

		public function set scaleY(value:Number):void
		{
			_scaleY = value;
		}
		
		/**
		 * The rotation of the transform.
		 */

		public function get rotation():Number
		{
			return _rotation;
		}

		public function set rotation(value:Number):void
		{
			_rotation = value;
		}

		public function get transformX():Number
		{
			return _transformX;
		}
		
		/**
		 * The horizontal point of origin for the scale and rotation portions of the transform.
		 */

		public function set transformX(value:Number):void
		{
			_transformX = value;
		}

		public function get transformY():Number
		{
			return _transformY;
		}
		
		/**
		 * The vertical point of origin for the scale and rotation portions of the transform.
		 */

		public function set transformY(value:Number):void
		{
			_transformY = value;
		}
		
		/**
		 * A reference to the file containing the image data to use as fill.
		 */

		public function get source():String
		{
			return _source;
		}

		public function set source(value:String):void
		{
			_source = value;
		}
		
		/**
		 * Whether the image data should be rendered once, or tiled to fill an infinite plane.
		 */

		public function get repeat():Boolean
		{
			return _repeat;
		}

		public function set repeat(value:Boolean):void
		{
			_repeat = value;
		}
		
		public function BitmapFill()
		{
			super();
		}
		
		
		override public function beginFill(target:Graphics, bounds:Rectangle):void
		{
			if(bitmap)
			{
				matrix.identity();
				matrix.scale(scaleX,scaleY);
				matrix.rotate(rotation * Math.PI / 180);
				matrix.translate(transformX,transformY);
				target.beginBitmapFill(bitmap.bitmapData,matrix,repeat,smooth);
			}
			else
			{
				targetGraphics = target;
				targetBounds = bounds;
				pendingFill = true;
				load();
			}
		}
		
		protected function load():void
		{
			if(!loader) loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
			loader.load(new URLRequest(source));
		}
		
		private function onLoaderComplete(evt:Event):void
		{
			bitmap = evt.target.content;
			bitmap.smoothing = true;
			
			if(pendingFill)
			{
				pendingFill = false;
				beginFill(targetGraphics,targetBounds);
			}
		}
	}
}