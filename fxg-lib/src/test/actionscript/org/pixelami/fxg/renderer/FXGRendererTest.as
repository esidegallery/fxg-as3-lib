package org.pixelami.fxg.renderer
{
	import flash.display.Sprite;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	import org.pixelami.fxg.elements.Ellipse;
	import org.pixelami.fxg.elements.Graphic;
	import org.pixelami.fxg.elements.Group;
	import org.pixelami.fxg.elements.fills.RadialGradient;

	public class FXGRendererTest
	{		
		[Bindable]
		[Embed(source="radialGradient-01.xml",mimeType="application/octet-stream")]
		public var RadialGradientFXG01:Class
		
		[Before]
		public function setUp():void
		{
		}
		
		[After]
		public function tearDown():void
		{
		}
		
		[BeforeClass]
		public static function setUpBeforeClass():void
		{
		}
		
		[AfterClass]
		public static function tearDownAfterClass():void
		{
		}
		
		[Test]
		public function testRadialGradient():void
		{
			var renderer:FXGRenderer = new FXGRenderer();
			var sprite:Sprite = new Sprite();
			renderer.renderElement(new XML(new RadialGradientFXG01()),sprite);
			assertTrue(renderer.graphic is Graphic);
			var g0:Group = renderer.graphic.getChildAt(0) as Group;
			var g1:Group = g0.getChildAt(0) as Group;
			var l:uint = g1.numChildren;
			var el:Ellipse = g1.getChildAt(0) as Ellipse;
			var fill:RadialGradient = el.fill as RadialGradient;
			assertEquals(7,fill.entries.length);
		}
		
		
		[Bindable]
		public var radialGradientFXG:String = 
			'<?xml version="1.0" encoding="utf-8" ?><Graphic version="2.0" viewHeight="768" viewWidth="1024" ' +
			'ai:appVersion="15.0.1.399" ATE:version="1.0.0" flm:version="1.0.0" d:id="1" d:using="" ' +
			'xmlns="http://ns.adobe.com/fxg/2008" xmlns:ATE="http://ns.adobe.com/ate/2009" ' +
			'xmlns:ai="http://ns.adobe.com/ai/2009" xmlns:d="http://ns.adobe.com/fxg/2008/dt" ' +
			'xmlns:flm="http://ns.adobe.com/flame/2008">  <Library/>  ' +
			'<Group ai:artboardActive="1" ai:artboardIndex="0" ai:seqID="1" d:layerType="page" ' +
			'd:pageHeight="768" d:pageWidth="1024" d:type="layer" d:userLabel="Artboard 1">    ' +
			'<Group ai:objID="1d935510" ai:seqID="2" d:id="2" d:type="layer" d:userLabel="Layer 1">      ' +
			'<Ellipse x="0.46582" y="0.427734" width="464.886" height="464.886" ai:objID="229b7da0" ai:seqID="3" flm:variant="1" d:id="3">        ' +
			'<fill>          <RadialGradient x="232.443" y="232.443" scaleX="464.886" scaleY="464.886">            ' +
			'<GradientEntry ratio="0" color="#B6B9BB"/>            ' +
			'<GradientEntry ratio="0.180276" color="#BF65DE"/>            ' +
			'<GradientEntry ratio="0.278965" color="#C248EA"/>            ' +
			'<GradientEntry ratio="0.385783" color="#C432F4"/>            ' +
			'<GradientEntry ratio="0.496512" color="#C624F9"/>            ' +
			'<GradientEntry ratio="0.622738" color="#C71CFD"/>            ' +
			'<GradientEntry ratio="1" color="#C717FF"/>          </RadialGradient>        </fill>        <stroke>          ' +
			'<SolidColorStroke weight="1" caps="none" joints="miter" miterLimit="10"/>        ' +
			'</stroke>      </Ellipse>    </Group>  </Group>  <Private variant:using="" mngo:using="" ' +
			'xmlns:mngo="http://ns.adobe.com/flamingo/apd" xmlns:variant="http://ns.adobe.com/flame/2008/apd">    ' +
			'<mngo:VariantContent fpdNS="http://ns.adobe.com/flame/2008/apd" fpdPRE="variant" flm:hashcode="E72F3432B167FF8DFCE58A2822EBD641" ' +
			'flm:original="1" d:ref="#3">      ' +
			'<variant:Ellipse x="0.46582" y="0.427734" width="464.886" height="464.886" ai:objID="229b7da0" ai:seqID="3">        ' +
			'<variant:fill>          <variant:RadialGradient x="232.443" y="232.443" scaleX="464.886" scaleY="464.886">            ' +
			'<variant:GradientEntry ratio="0" color="#B6B9BB" flm:midpoint="0.172340431213379"/>            ' +
			'<variant:GradientEntry ratio="1" color="#C717FF"/>          </variant:RadialGradient>       ' +
			' </variant:fill>        <variant:stroke>          <variant:SolidColorStroke weight="1" caps="none" ' +
			'joints="miter" miterLimit="10"/>        </variant:stroke>      </variant:Ellipse>    </mngo:VariantContent>   ' +
			' <ai:PrivateElement d:ref="#1">      <ai:SaveOptions>        ' +
			'<ai:Dict data="I versionKey 2 B aiEditCap 1 I preserveTextPolicy 4 I preserveFilterPolicy 3 I preserveGradientPolicy 4 I ' +
			'expandBlendsOption 5 B includeSymbol 0 B includeXMP 0 I rasterizeResolution 72 B downsampleLinkedImages 0 B writeImages 1 B ' +
			'includeObjectOutsideArtboard 0 "/>      </ai:SaveOptions>      <ai:DocData base="radialGradient-01.assets/images" ' +
			'rulerCanvasDiffH="512.5" rulerCanvasDiffV="384.5">        <ai:DocRasterSettings>          ' +
			'<ai:Dict data="I colr 4 I dpi. 72 B alis 0 B spot 0 B mask 0 R padd 36 "/>        ' +
			'</ai:DocRasterSettings>      </ai:DocData>      <ai:AutoGenImageList>        <ai:Dict/>      ' +
			'</ai:AutoGenImageList>    </ai:PrivateElement>    <ai:PrivateElement flm:hashcode="8A417631D3310D79ADA6682F7F991955" d:ref="#2">      ' +
			'<ai:LayerOptions color="5 79.31 257 128.502"/>    </ai:PrivateElement>  </Private></Graphic>';
		
		
		[Test]
		public function mapPropertiesTest():void
		{
			var renderer:FXGRenderer = new FXGRenderer();
			var graphic:Graphic = new Graphic();
			renderer.mapProperties(new XML(radialGradientFXG),graphic);
			assertEquals(1024,graphic.viewWidth);
			assertEquals(768,graphic.viewHeight);
		}
	}
}