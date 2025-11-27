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

		if (!MobileUtil.areAssetsCopied("assets/"))
			MobileUtil.copyAssetsFromAPK("assets/");

		if (!MobileUtil.areModsCopied("mods/"))
			MobileUtil.copyModsFromAPK("mods/");
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

		fpsDisplay = new FPSExt(3, 3, 0xFFFFFF);
		fpsDisplay.visible = true;

		addChild(new FlxGame(0, 0, Startup, 60, 60, true));
		addChild(fpsDisplay);

		//On web builds, video tends to lag quite a bit, so this just helps it run a bit faster.
		#if web
		VideoHandler.MAX_FPS = 30;
		#end

		trace("-=Args=-");
		trace("novid: " + novid);
		trace("flippymode: " + flippymode);

	}
}
