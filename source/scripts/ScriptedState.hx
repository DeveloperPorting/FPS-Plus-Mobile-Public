package scripts;

import transition.CustomTransition;
import transition.data.InstantTransition;

import modding.PolymodHandler;
import extensions.flixel.FlxUIStateExt;
import restricted.RestrictedUtils;

#if mobile
import flixel.FlxCamera;
import mobile.MobileControls;
import mobile.flixel.FlxVirtualPad;
import flixel.util.FlxDestroyUtil;
import flixel.FlxG;
#end

//Basically just FlxUIStateExt with polymodReload
class ScriptedState extends FlxUIStateExt
{
	public var _stateName:String = "";

	override public function update(elapsed:Float){
		if(Binds.justPressed("polymodReload")){
			PolymodHandler.reload(false);
			var newInstance = init(_stateName);
			customTransOut = new InstantTransition();
			switchState(newInstance);
		}
		super.update(elapsed);
	}

	public static function init(stateString:String){
		var r = RestrictedUtils.callStaticGeneratedMethod(ScriptableState, "scriptInit", [stateString]);
		Reflect.setProperty(r, "_stateName", stateString);
		return r;
	}

	#if mobile
	public var mobileControls:MobileControls;
	public var virtualPad:FlxVirtualPad;

	public var vpadCam:FlxCamera;
	public var camControls:FlxCamera;

	
    public function addVirtualPad(DPad:FlxDPadMode, Action:FlxActionMode)
	{
		if (virtualPad != null)
			removeVirtualPad();

		virtualPad = new FlxVirtualPad(DPad, Action);
		add(virtualPad);
	}

	public function removeVirtualPad()
	{
		if (virtualPad != null)
			remove(virtualPad);
	}

	public function addMobileControls(DefaultDrawTarget:Bool = false)
	{
		mobileControls = new MobileControls();

		camControls = new FlxCamera();
		camControls.bgColor.alpha = 0;
		FlxG.cameras.add(camControls, DefaultDrawTarget);

		mobileControls.cameras = [camControls];
		mobileControls.visible = false;
		add(mobileControls);
	}

	public function removeMobileControls()
	{
		if (mobileControls != null)
			remove(mobileControls);
	}

	public function addVirtualPadCamera(DefaultDrawTarget:Bool = false)
	{
		if (virtualPad != null)
		{
			vpadCam = new FlxCamera();
			FlxG.cameras.add(vpadCam, DefaultDrawTarget);
			vpadCam.bgColor.alpha = 0;
			virtualPad.cameras = [vpadCam];
		}
	}

	override function destroy()
	{
		super.destroy();

		if (virtualPad != null)
		{
			virtualPad = FlxDestroyUtil.destroy(virtualPad);
			virtualPad = null;
		}

		if (mobileControls != null)
		{
			mobileControls = FlxDestroyUtil.destroy(mobileControls);
			mobileControls = null;
		}
	}
	#end
}
