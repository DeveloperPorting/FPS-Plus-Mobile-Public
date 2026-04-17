package;

import Conductor.BPMChangeEvent;
import flixel.FlxSubState;
import flixel.FlxCamera;
import mobile.MobileControls;
import mobile.flixel.FlxVirtualPad;
import flixel.util.FlxDestroyUtil;
import flixel.FlxG;

class MusicBeatSubState extends FlxSubState
{
	public var curStep:Int = 0;
	public var curBeat:Int = 0;

	private var trackedStep:Int = -1;
	private var trackedBeat:Int = -1;

	private var timeSinceLastStep:Float = 1000;
	private var timeSinceLastBeat:Float = 1000;

	private var countSteps:Bool = true;

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
		
		super.destroy();
	}
	override function create(){
		super.create();
	}

	override function update(elapsed:Float){
		if(countSteps){
			var lastChange:BPMChangeEvent = {
				stepTime: 0,
				songTime: 0,
				bpm: 0
			}
			for (i in 0...Conductor.bpmChangeMap.length){
				if (Conductor.songPosition >= Conductor.bpmChangeMap[i].songTime){
					lastChange = Conductor.bpmChangeMap[i];
				}
			}

			curStep = lastChange.stepTime + Math.floor((Conductor.songPosition - lastChange.songTime) / Conductor.stepCrochet);
			curBeat = Math.floor(curStep / 4);

			timeSinceLastStep += elapsed;
			timeSinceLastBeat += elapsed;

			if(curStep != trackedStep){
				trackedStep = curStep;
				if(timeSinceLastStep > (Conductor.stepCrochet/1000)/4){
					stepHit();
					timeSinceLastStep = 0;
				}
			}

			if(curBeat != trackedBeat){
				trackedBeat = curBeat;
				if(timeSinceLastBeat > (Conductor.stepCrochet/1000)/4){
					beatHit();
					timeSinceLastBeat = 0;
				}
			} 
		}
		super.update(elapsed);
	}

	public function stepHit():Void{}

	public function beatHit():Void{}

}
