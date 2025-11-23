package;

import openfl.utils.AssetCache;
import openfl.Assets;
import flixel.input.gamepad.FlxGamepadInputID;
import openfl.events.Event;
import flixel.FlxG;
import flixel.input.keyboard.FlxKey;
<<<<<<< HEAD
=======
import mobile.flixel.input.FlxMobileInputID;
>>>>>>> 28779341 (tentando recuperar)

class Binds
{

	public static var binds:KeybindMap;

	public static function init():Void{

		binds = new KeybindMap();

		SaveManager.global();

		//Key binds
		if(FlxG.save.data.binds == null){
			binds = generateDefaultControls();
			saveControls();
		}
		else{
			setControls();
			if(checkForRepair()){
				binds = repairControls();
				saveControls();
			}
		}
	}

	public static function generateDefaultControls():KeybindMap{
		var r:KeybindMap = new KeybindMap();

		//Gameplay buttons
		var k:Keybind = {
			name: "Left Note",
			category: "Gameplay",
			binds: [LEFT, A],
			controllerBinds: [DPAD_LEFT, X],
<<<<<<< HEAD
=======
			mobileBinds: [noteLEFT, LEFT2],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("gameplayLeft", k);

		var k:Keybind = {
			name: "Down Note",
			category: "Gameplay",
			binds: [DOWN, S],
			controllerBinds: [DPAD_DOWN, A],
<<<<<<< HEAD
=======
			mobileBinds: [noteDOWN, DOWN2],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("gameplayDown", k);

		var k:Keybind = {
			name: "Up Note",
			category: "Gameplay",
			binds: [UP, W],
			controllerBinds: [DPAD_UP, Y],
<<<<<<< HEAD
=======
			mobileBinds: [noteUP, UP2],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("gameplayUp", k);

		var k:Keybind = {
			name: "Right Note",
			category: "Gameplay",
			binds: [RIGHT, D],
			controllerBinds: [DPAD_RIGHT, B],
<<<<<<< HEAD
=======
			mobileBinds: [noteRIGHT, RIGHT2],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("gameplayRight", k);

		var k:Keybind = {
			name: "Pause",
			category: "Gameplay",
			binds: [ESCAPE, ENTER],
			controllerBinds: [START],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("pause", k);

		var k:Keybind = {
			name: "Die",
			category: "Gameplay",
			binds: [R],
			controllerBinds: [BACK],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("killbind", k);



		//Menu buttons
		var k:Keybind = {
			name: "Up",
			category: "Menu",
			binds: [UP, W],
			controllerBinds: [DPAD_UP, LEFT_STICK_DIGITAL_UP],
<<<<<<< HEAD
=======
			mobileBinds: [UP, noteUP],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuUp", k);

		var k:Keybind = {
			name: "Down",
			category: "Menu",
			binds: [DOWN, S],
			controllerBinds: [DPAD_DOWN, LEFT_STICK_DIGITAL_DOWN],
<<<<<<< HEAD
=======
			mobileBinds: [DOWN, noteDOWN],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuDown", k);

		var k:Keybind = {
			name: "Left",
			category: "Menu",
			binds: [LEFT, A],
			controllerBinds: [DPAD_LEFT, LEFT_STICK_DIGITAL_LEFT],
<<<<<<< HEAD
=======
			mobileBinds: [LEFT, noteLEFT],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuLeft", k);

		var k:Keybind = {
			name: "Right",
			category: "Menu",
			binds: [RIGHT, D],
			controllerBinds: [DPAD_RIGHT, LEFT_STICK_DIGITAL_RIGHT],
<<<<<<< HEAD
=======
			mobileBinds: [RIGHT, noteRIGHT],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuRight", k);

		var k:Keybind = {
			name: "Accept",
			category: "Menu",
			binds: [ENTER, SPACE],
			controllerBinds: [A, START],
<<<<<<< HEAD
=======
			mobileBinds: [A],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuAccept", k);

		var k:Keybind = {
			name: "Back",
			category: "Menu",
			binds: [ESCAPE, BACKSPACE],
			controllerBinds: [B],
<<<<<<< HEAD
=======
			mobileBinds: [B],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuBack", k);

		var k:Keybind = {
			name: "Cycle Left",
			category: "Menu",
			binds: [Q],
			controllerBinds: [LEFT_SHOULDER],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuCycleLeft", k);

		var k:Keybind = {
			name: "Cycle Right",
			category: "Menu",
			binds: [E],
			controllerBinds: [RIGHT_SHOULDER],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuCycleRight", k);

		var k:Keybind = {
			name: "Change Character",
			category: "Menu",
			binds: [TAB],
			controllerBinds: [Y],
<<<<<<< HEAD
=======
			mobileBinds: [C],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuChangeCharacter", k);

		var k:Keybind = {
			name: "Reset Score",
			category: "Menu",
			binds: [R],
			controllerBinds: [BACK],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("menuResetScore", k);

		var k:Keybind = {
			name: "Fullscreen",
			category: "Menu",
			binds: [F11],
			controllerBinds: [],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: false
		};
		r.set("fullscreen", k);



		//Dev buttons
		var k:Keybind = {
			name: "Chart Editor",
			category: "Developement",
			binds: [SEVEN],
			controllerBinds: [],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: true
		};
		r.set("chartEditor", k);

		var k:Keybind = {
			name: "Offset Editor",
			category: "Developement",
			binds: [EIGHT],
			controllerBinds: [],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: true
		};
		r.set("offsetEditor", k);

		var k:Keybind = {
			name: "Reload Mods",
			category: "Developement",
			binds: [F5],
			controllerBinds: [],
<<<<<<< HEAD
=======
			mobileBinds: [],
>>>>>>> 28779341 (tentando recuperar)
			local: true
		};
		r.set("polymodReload", k);



		return r;
	}

	public static function setControls():Void{
		binds.clear();

		SaveManager.global();
		for(key in cast(FlxG.save.data.binds, KeybindMap).keys){
			binds.set(key, FlxG.save.data.binds.get(key));
		}

		SaveManager.modSpecific();
		if(FlxG.save.data.binds != null){
			for(key in cast(FlxG.save.data.binds, KeybindMap).keys){
				binds.set(key, FlxG.save.data.binds.get(key));
			}
		}

		SaveManager.global();
	}

	public static function saveControls():Void{
		var g:KeybindMap = new KeybindMap();
		var l:KeybindMap = new KeybindMap();

		for(key in binds.keys){
			if(binds.get(key).local){
				l.set(key, binds.get(key));
			}
			else{
				g.set(key, binds.get(key));
			}
		}

		SaveManager.global();
		FlxG.save.data.binds = g;
		SaveManager.flush();

		SaveManager.modSpecific();
		FlxG.save.data.binds = l;
		SaveManager.flush();

		SaveManager.global();
	}

	static function checkForRepair():Bool{
		
		var defaultThing = generateDefaultControls();

		var r = (binds.length() != defaultThing.length());

		if(!r){
			for(i in 0...binds.binds.length){
				if(binds.binds[i].name != defaultThing.binds[i].name || 
				   binds.binds[i].category != defaultThing.binds[i].category || 
				   binds.binds[i].local != defaultThing.binds[i].local){
					r = true;
					break;
				}
			}
		}

		return r;

	}

	public static function repairControls():KeybindMap{
		var r:KeybindMap = generateDefaultControls();

		for(x in r.keys){
			if(binds.exists(x)){
				var k:Keybind = {
					name: r.get(x).name,
					category: r.get(x).category,
					binds: binds.get(x).binds,
					controllerBinds: binds.get(x).controllerBinds,
<<<<<<< HEAD
=======
					mobileBinds: binds.get(x).mobileBinds,
>>>>>>> 28779341 (tentando recuperar)
					local: r.get(x).local
				};
				r.set(x, k);
			}
		}

		return r;
	}

	public static function resetToDefaultControls():Void{
		binds = generateDefaultControls();
		saveControls();
	}

	inline public static function pressed(input:String):Bool{
<<<<<<< HEAD
		return pressedKeyboardOnly(input) || pressedControllerOnly(input);
	}

	inline public static function justPressed(input:String):Bool{
		return justPressedKeyboardOnly(input) || justPressedControllerOnly(input);
	}

	inline public static function justReleased(input:String):Bool{
		return justReleasedKeyboardOnly(input) || justReleasedControllerOnly(input);
=======
		return pressedKeyboardOnly(input) || pressedControllerOnly(input) || pressedVirtualPadOnly(input) || pressedMobileCOnly(input);
	}

	inline public static function justPressed(input:String):Bool{
		return justPressedKeyboardOnly(input) || justPressedControllerOnly(input) || justPressedVirtualPadOnly(input) || justPressedMobileCOnly(input);
	}

	inline public static function justReleased(input:String):Bool{
		return justReleasedKeyboardOnly(input) || justReleasedControllerOnly(input) || justReleasedVirtualPadOnly(input) || justReleasedMobileCOnly(input);
>>>>>>> 28779341 (tentando recuperar)
	}

	inline public static function pressedKeyboardOnly(input:String):Bool{
		return FlxG.keys.anyPressed(binds.get(input).binds);
	}

	inline public static function justPressedKeyboardOnly(input:String):Bool{
		return FlxG.keys.anyJustPressed(binds.get(input).binds);
	}

	inline public static function justReleasedKeyboardOnly(input:String):Bool{
		return FlxG.keys.anyJustReleased(binds.get(input).binds);
	}

	inline public static function pressedControllerOnly(input:String):Bool{
		var r:Bool = false;
		for(x in binds.get(input).controllerBinds){
			r = FlxG.gamepads.anyPressed(x);
			if(r){ break; }
		}
		return r;
	}

	inline public static function justPressedControllerOnly(input:String):Bool{
		var r:Bool = false;
		for(x in binds.get(input).controllerBinds){
			r = FlxG.gamepads.anyJustPressed(x);
			if(r){
				break; }
		}
		return r;
	}

	inline public static function justReleasedControllerOnly(input:String):Bool{
		var r:Bool = false;
		for(x in binds.get(input).controllerBinds){
			r = FlxG.gamepads.anyJustReleased(x);
			if(r){ break; }
		}
		return r;
	}
<<<<<<< HEAD
=======

    public static var isInSubstate:Bool = false; // don't worry about this it becomes true and false on it's own in MusicBeatSubstate
	public static var requested(get, default):Dynamic; // is set to MusicBeatState or MusicBeatSubstate when the constructor is called
	public static var gameplayRequest(get, default):Dynamic; // for PlayState and EditorPlayState (hitbox and virtualPad)
	
	inline public static function pressedVirtualPadOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.virtualPad != null) {
		   for(x in binds.get(input).mobileBinds){
			  r = requested.virtualPad.anyPressed(x);
			  if(r){ break; }
	 	   }
		}
		return r;
	}

	inline public static function justPressedVirtualPadOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.virtualPad != null) {
		   for(x in binds.get(input).mobileBinds){
	   	      r = requested.virtualPad.anyJustPressed(x);
	 	      if(r){
				  break; }
		   }
		}
		return r;
	}

	inline public static function justReleasedVirtualPadOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.virtualPad != null) {
		   for(x in binds.get(input).mobileBinds){
			  r = requested.virtualPad.anyJustReleased(x);
			  if(r){ break; }
		   }
		}
	    return r;
	}

	inline public static function pressedMobileCOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.mobileControls != null && gameplayRequest != null) {
		   for(x in binds.get(input).mobileBinds){
			  r = gameplayRequest.anyPressed(x);
			  if(r){ break; }
		   }
		}
		return r;
	}

	inline public static function justPressedMobileCOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.mobileControls != null && gameplayRequest != null) {
		   for(x in binds.get(input).mobileBinds){
	   	      r = gameplayRequest.anyJustPressed(x);
	 	      if(r){
				  break; }
		   }
		}
		return r;
	}

	inline public static function justReleasedMobileCOnly(input:String):Bool{
		var r:Bool = false;
		if (requested.mobileControls != null && gameplayRequest != null) {
		   for(x in binds.get(input).mobileBinds){
			  r = gameplayRequest.anyJustReleased(x);
			  if(r){ break; }
		   }
		}
	    return r;
	}

	@:noCompletion
	private static function get_requested():Dynamic
			{
				if (isInSubstate)
					return MusicBeatSubState.instance;
				else
					return MusicBeatState.instance;
			}
						
	@:noCompletion
	private static function get_gameplayRequest():Dynamic
			{
				if (isInSubstate)
					return MusicBeatSubState.instance.mobileControls.current.target;
				else
					return MusicBeatState.instance.mobileControls.current.target;
			}
>>>>>>> 28779341 (tentando recuperar)
	
}

class KeybindMap
{

	public var keys:Array<String> = [];
	public var binds:Array<Keybind> = [];

	public function new() {
		
	}

	public function set(key:String, value:Keybind, ?index:Int = -1):Void {
		if(!keys.contains(key)){
			if(index < 0){
				keys.push(key);
				binds.push(value);
			}
			else{
				keys.insert(index, key);
				binds.insert(index, value);
			}
		}
		else{
			var i = keys.indexOf(key);
			binds[i] = value;
		}
	}

	public function get(key:String):Keybind {
		var i = keys.indexOf(key);
		return binds[i];
	}

	public function remove(key:String):Void {
		var i = keys.indexOf(key);
		binds.remove(binds[i]);
		keys.remove(key);
	}

	public function clear():Void {
		keys = [];
		binds = [];
	}

	public function exists(key:String):Bool {
		return keys.contains(key);
	}

	public function length():Int {
		return keys.length;
	}

}

typedef Keybind = {
	var name:String;								//The name of the input in the config menu.
	var category:String;							//The category of the input in the config menu.
	var binds:Array<FlxKey>;						//The default keyboard keys of input.
	var controllerBinds:Array<FlxGamepadInputID>;	//The default controller buttons of input.
<<<<<<< HEAD
	var local:Bool;									//Whether the input is global (false) or mod specific (true). If you need to add extra keys that are only for a mod, make this true.
}
=======
	var mobileBinds:Array<FlxMobileInputID>;        //The default mobile buttons of input.
	var local:Bool;									//Whether the input is global (false) or mod specific (true). If you need to add extra keys that are only for a mod, make this true.
}
>>>>>>> 28779341 (tentando recuperar)
