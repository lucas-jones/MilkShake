package milkshake.game.tile;

import milkshake.core.DisplayObject;
import milkshake.game.scene.camera.Camera;
import milkshake.game.tile.TileMapRenderer;
import milkshake.game.tile.TileMapData;

class TileMap extends DisplayObject
{
	public var tileMapData(default, null):TileMapData;

	public var renderer(default, null):TileMapRenderer;

	public function new(tileMapData:TileMapData, renderer:TileMapRenderer)
	{
		this.tileMapData = tileMapData;
		this.renderer = renderer;

		super();

		renderer.setup(tileMapData);
		addNode(renderer);
	}
}