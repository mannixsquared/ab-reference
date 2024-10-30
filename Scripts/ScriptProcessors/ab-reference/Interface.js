Content.makeFrontInterface(600, 650);

Content.getComponent("Button1").setControlCallback(onButton1Control);
Content.getComponent("Frequency").setControlCallback(onFrequencyControl);
Content.getComponent("BandWidth").setControlCallback(onBandwidthControl);
const var FloatingTile1 = Content.getComponent("FloatingTile1");
const var Frequency = Content.getComponent("Frequency");
const var FrequencyValue = Content.getComponent("FrequencyValue");
const var BandWidth = Content.getComponent("BandWidth");
const var WidthValue = Content.getComponent("WidthValue");

const var SubBass = Content.getComponent("SubBass");
const var Bass = Content.getComponent("Bass");
const var LowMids = Content.getComponent("LowMids");
const var MidRange = Content.getComponent("MidRange");
const var UpperMids = Content.getComponent("UpperMids");
const var Presence = Content.getComponent("Presence");

const player = Synth.getEffect("AudioPlayer");
const gain = Synth.getEffect("Simple Gain1");
const EQ = Synth.getEffect("EQ");
var bandwidth = 2.5;

inline function onButton1Control(component, value)
{
	if (value) {
		Synth.playNote(64, 127);
		player.setBypassed(false);
		gain.setBypassed(false);
	} else {
		player.setBypassed(true);
		gain.setBypassed(true);
	}
}

inline function setFrequencyBand(l, h) {
	EQ.setAttribute(EQ.BandOffset * 0 + EQ.Freq, l);
	EQ.setAttribute(EQ.BandOffset * 1 + EQ.Freq, l);
	EQ.setAttribute(EQ.BandOffset * 2 + EQ.Freq, h);
	EQ.setAttribute(EQ.BandOffset * 3 + EQ.Freq, h);	
}

inline function resetButtons() {
	SubBass.setValue(false);
	Bass.setValue(false);
	LowMids.setValue(false);
	MidRange.setValue(false);
	UpperMids.setValue(false);
	Presence.setValue(false);
}

inline function updateControls(l, h) {
	Frequency.setValue(l);
	Frequency.updateValueFromProcessorConnection();
	BandWidth.setValue(h / l);
	BandWidth.updateValueFromProcessorConnection();
	
	local v = Engine.doubleToString(l, 0) + " Hz";
	FrequencyValue.set("text", v);
	
	local v = Engine.doubleToString(h / l, 1);
	WidthValue.set("text", v);
	
	setFrequencyBand(l, h);
}

inline function onFrequencyControl(component, value)
{
	local v = Engine.doubleToString(value, 0) + " Hz";
	FrequencyValue.set("text", v);
	setFrequencyBand(value, value * bandwidth);
	
	resetButtons();
};

inline function onBandwidthControl(component, value)
{
	bandwidth = value;
	
	local l = Engine.doubleToString(value, 1);
	WidthValue.set("text", l);
	
	local v = EQ.getAttribute(EQ.BandOffset * 0 + EQ.Freq);
	setFrequencyBand(v, v * bandwidth);
	
	resetButtons();
};

inline function onFilterControl(component, value)
{
	EQ.setBypassed(!value);
};

Content.getComponent("Filter").setControlCallback(onFilterControl);

inline function onSubBassControl(component, value)
{
	if (value) {
		updateControls(20, 60);
	}
};

Content.getComponent("SubBass").setControlCallback(onSubBassControl);

inline function onBassControl(component, value)
{
	if (value) {
		updateControls(60, 250);
	}
};

Content.getComponent("Bass").setControlCallback(onBassControl);

inline function onLowMidsControl(component, value)
{
	if (value) {
		updateControls(250, 500);
	}
};

Content.getComponent("LowMids").setControlCallback(onLowMidsControl);

inline function onMidRangeControl(component, value)
{
	if (value) {
		updateControls(500, 2000);
	}
};

Content.getComponent("MidRange").setControlCallback(onMidRangeControl);

inline function onUpperMidsControl(component, value)
{
	if (value) {
		updateControls(2000, 4000);
	}
};

Content.getComponent("UpperMids").setControlCallback(onUpperMidsControl);

inline function onPresenceControl(component, value)
{
	if (value) {
		updateControls(4000, 6000);
	}
};

Content.getComponent("Presence").setControlCallback(onPresenceControl);
function onNoteOn()
{
	
}
 function onNoteOff()
{
	
}
 function onController()
{
	
}
 function onTimer()
{
	
}
 function onControl(number, value)
{
	
}
 