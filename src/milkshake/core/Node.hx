package milkshake.core;

import haxe.exception.Exception;
import hsl.haxe.direct.DirectSignaler.DirectSignaler;
import hsl.haxe.Signaler.Signaler;
import milkshake.Milkshake;

using Reflect;

class Node
{
	public var id:String;
	public var parent:Node;

	public var nodes(default, null):Array<Node>;

	public var onNodeAdded(default, null):Signaler<Node>;
	public var onAddedToNode(default, null):Signaler<Node>;
	public var onNodeRemoved(default, null):Signaler<Node>;
	public var onRemovedFromNode(default, null):Signaler<Node>;

	private var milk(get, null): Milkshake;

	public function new(?id:String = null)
	{
		this.id = id == null ? Type.typeof(this).getName() : id;
		this.nodes = [];

		this.onNodeAdded = new DirectSignaler(this);
		this.onAddedToNode = new DirectSignaler(this);
		this.onNodeRemoved = new DirectSignaler(this);
		this.onRemovedFromNode = new DirectSignaler(this);
	}

	public function update(deltaTime:Float):Void
	{
		for(node in nodes) node.update(deltaTime);
	}

	public function addNode(node:Node, ?defaultValues:Dynamic):Void
	{
		node.parent = this;
		nodes.push(node);

		if(defaultValues != null)
		{
			for(key in defaultValues.fields())
			{
				node.setProperty(key, defaultValues.field(key));
				//node.setField();
			}
		}

		onNodeAdded.dispatch(node);
		node.onAddedToNode.dispatch(this);
	}

	public function removeNode(node:Node):Void
	{
		node.parent = null;
		nodes.remove(node);

		onNodeRemoved.dispatch(node);
		node.onRemovedFromNode.dispatch(this);
	}

	function get_milk():Milkshake
	{
		return Milkshake.getInstance();
	}
}