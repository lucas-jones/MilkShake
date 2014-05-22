package milkshake.io.net;

import milkshake.game.network.NetworkManager;
import milkshake.game.scene.SceneManager;
import net.handlers.RoomHandler;

class MilkshakeNetworkManager extends NetworkManager
{
	private var sceneManager:SceneManager;
	
	public function new(sceneManager:SceneManager)
	{
		super(Globals.SERVER_ADDRESS);
		
		this.sceneManager = sceneManager;
	}
}