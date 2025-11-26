package;

import flixel.system.debug.log.LogStyle;
import extensions.openfl.display.FPSExt;
import modding.PolymodHandler;
import flixel.system.scaleModes.RatioScaleMode;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import openfl.display.Sprite;
import openfl.display.InteractiveObject;

#if mobile
import mobile.utils.*;
//import funkin.mobile.input.*;
#end

class Main extends Sprite
{

	public static var fpsDisplay:InteractiveObject;

	public static var novid:Bool = false;
	public static var flippymode:Bool = false;

	public function new()
	{
		super();

		#if mobile
		MobileUtil.getPermissions();
		Sys.setCwd(haxe.io.Path.addTrailingSlash(MobileUtil.getDirectory()));
		#end
			
		PolymodHandler.init();
		FlxSprite.defaultAntialiasing = true;

		#if !debug
		LogStyle.ERROR.openConsole = false;
		LogStyle.ERROR.errorSound = null;
		#end

		LogStyle.WARNING.openConsole = false;
		LogStyle.WARNING.errorSound = null;

		#if sys
		novid = Sys.args().contains("-novid");
		flippymode = Sys.args().contains("-flippymode");
		#end

		SaveManager.global();

		fpsDisplay = new FPSExt(#if mobile FlxG.game.x + #end 3, #if mobile FlxG.game.y + #end 3, 0xFFFFFF);
		fpsDisplay.visible = true;

		addChild(new FlxGame(0, 0, Startup, 60, 60, true));
		addChild(fpsDisplay);

		#if mobile
		FlxG.stage.window.onResize.add((w:Int, h:Int) -> fpsDisplay.setScale());
		#end

		//On web builds, video tends to lag quite a bit, so this just helps it run a bit faster.
		#if web
		VideoHandler.MAX_FPS = 30;
		#end

		trace("-=Args=-");
		trace("novid: " + novid);
		trace("flippymode: " + flippymode);

	}
}
