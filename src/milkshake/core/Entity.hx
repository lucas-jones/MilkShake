package milkshake.core;

import milkshake.core.Node;
import milkshake.game.scene.Scene;

class Entity extends Node
{
	public var scene(default, null):Scene;
	
	@:isVar public var x(get, set):Float;
	@:isVar public var y(get, set):Float;
	
	public function new(id:String="undefined-entity") 
	{
		super(id);
	}
	
	public function setScene(scene:Scene):Void
	{
		this.scene = scene;
	}
	
	override public function addNode(node:Node):Void 
	{
		if (Std.is(node, Entity))
		{
			trace("Set Scene");
			trace(scene);
			var entity:Entity = cast node;
			
			entity.setScene(scene);
			
			scene.onNodeAdded.dispatch(node);
		}
		
		super.addNode(node);
	}
	
	public function update(deltaTime:Float):Void { }
	
	public function get_x():Float { return x; }	
	public function set_x(value:Float):Float { return x = value; }
	
	public function get_y():Float { return y; }	
	public function set_y(value:Float):Float { return y = value; }
}