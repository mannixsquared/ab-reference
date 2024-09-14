Content.makeFrontInterface(600, 600);

Content.getComponent("Button1").setControlCallback(onButton1Control);
Content.getComponent("Frequency").setControlCallback(onFrequencyControl);
Content.getComponent("BandWidth").setControlCallback(onBandwidthControl);
const var FloatingTile1 = Content.getComponent("FloatingTile1");
const var FrequencyValue = Content.getComponent("FrequencyValue");
const var WidthValue = Content.getComponent("WidthValue");

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

inline function onFrequencyControl(component, value)
{
	local v = Engine.doubleToString(value, 0) + " Hz";
	FrequencyValue.set("text", v);
	
	EQ.setAttribute(EQ.BandOffset * 0 + EQ.Freq, value);
	EQ.setAttribute(EQ.BandOffset * 1 + EQ.Freq, value);
	EQ.setAttribute(EQ.BandOffset * 2 + EQ.Freq, value * bandwidth);
	EQ.setAttribute(EQ.BandOffset * 3 + EQ.Freq, value * bandwidth);
};

inline function onBandwidthControl(component, value)
{
	bandwidth = value;
	
	local l = Engine.doubleToString(value, 1);
	WidthValue.set("text", l);
	
	local v = EQ.getAttribute(EQ.BandOffset * 0 + EQ.Freq);
	EQ.setAttribute(EQ.BandOffset * 2 + EQ.Freq, v * bandwidth);
	EQ.setAttribute(EQ.BandOffset * 3 + EQ.Freq, v * bandwidth);
};

inline function onFilterControl(component, value)
{
	EQ.setBypassed(!value);
};

Content.getComponent("Filter").setControlCallback(onFilterControl);

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
 