Content.makeFrontInterface(600, 600);

Content.getComponent("Button1").setControlCallback(onButton1Control);
Content.getComponent("Frequency").setControlCallback(onFrequencyControl);
const var FloatingTile1 = Content.getComponent("FloatingTile1");

const player = Synth.getEffect("AudioPlayer");
const EQ = Synth.getEffect("EQ");

inline function onButton1Control(component, value)
{
	if (value) {
		Synth.playNote(64, 127);
		player.setBypassed(false);
	} else {
		player.setBypassed(true);
	}
}

inline function onFrequencyControl(component, value)
{
	EQ.setAttribute(EQ.BandOffset * 0 + EQ.Freq, value);
	EQ.setAttribute(EQ.BandOffset * 1 + EQ.Freq, value);
	EQ.setAttribute(EQ.BandOffset * 2 + EQ.Freq, value * 2.5);
	EQ.setAttribute(EQ.BandOffset * 3 + EQ.Freq, value * 2.5);	
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
 