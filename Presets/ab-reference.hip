Processor 
Type SynthChain ID ab-reference Bypassed Gain 	      �?Balance 	        VoiceLimit 	      P@KillFadeTime 	      4@IconColour 0 packageName  BuildVersion �  EditorStates BodyShown 0 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type ScriptProcessor ID Interface Bypassed Script 4Content.makeFrontInterface(600, 600);

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
  EditorStates BodyShown 1 Visible 1 Solo 0 contentShown 1 onInitOpen 1  ChildProcessors   Content  Control type ScriptAudioWaveform id AudioWaveform1 value 	        data  rangeStart     rangeEnd      Control type ScriptButton id 	Button1 value 	         Control type ScriptSlider id BandWidth value 	      @ Control type ScriptButton id Filter value 	         Control type ScriptSlider id Frequency value 	      Y@ Control type ScriptSlider id Volume value 	         UIData  ContentProperties DeviceType 	Desktop Component 	type ScriptPanel id Panel1 x 	      �?y 	        width 	     ��@height 	     ��@itemColour 4278190080 itemColour2 4278190080 locked 1  Component type ScriptAudioWaveform id AudioWaveform1 x 	      4@y 	     �V@processorId AudioPlayer width 	     ��@height 	      i@itemColour2 4280339679 itemColour 4290640127 bgColour 0 itemColour3 4294967295 showLines 1 opaque 0  Component type ScriptButton id 	Button1 x 	      Y@y 	     ��@text 
A|B TEST itemColour 0 itemColour2 0 bgColour 0 textColour 4292926663 width 	     �V@height 	      >@ Component type ScriptFloatingTile id FloatingTile2 x 	      4@y 	     `s@ContentType AudioAnalyser bgColour 0 itemColour 2569063647 itemColour2 4292926663 textColour 0 Data K{
  "ProcessorId": "Analyser",
  "Index": 1,
  "FollowWorkspace": false
} width 	     ��@height 	     �g@ Component type ScriptFloatingTile id FloatingTile1 x 	      4@y 	     �r@ContentType FilterDisplay bgColour 0 itemColour 4294967295 itemColour2 2437827917 Data o{
  "ProcessorId": "EQ",
  "Index": 0,
  "FollowWorkspace": false,
  "GainRange": 24.0,
  "ShowLines": true
} width 	     ��@height 	     �g@ Component type ScriptLabel id Label1 x 	     �Q@y 	      >@alignment left text A|B REFERENCE fontName Avenir Next fontSize 	      A@width 	     @j@height 	      4@textColour 4292926663  Component type ScriptSlider id BandWidth x 	     }@y 	     �@min 	       @max 	      $@stepSize 	   ����?suffix  Hz middlePosition 	      @filmstripImage !{PROJECT_FOLDER}subtle_knob.png numStrips 	      P@width 	      P@height 	      P@showTextBox 0 defaultValue 	      @ Component type ScriptButton id Filter x 	     �g@y 	     ��@text ENABLE FILTER bgColour 0 itemColour2 0 itemColour 0 height 	      >@textColour 4292926663 width 	      ^@ Component type ScriptLabel id Label2 x 	     `@y 	     h�@text WIDTH editable 0 itemColour2 0 alignment right width 	      T@height 	      4@fontName Avenir Next fontStyle Bold fontSize 	      0@textColour 4280339679  Component type ScriptLabel id 	Company x 	     �z@y 	      >@alignment right text © Mannix Squared, 2024 textColour 4292926663 parentComponent MainPanel fontName Avenir Next fontSize 	      0@width 	     �b@ Component type ScriptLabel id 	Version x 	      |@y 	      $@text V1.0 alignment right fontStyle Bold parentComponent MainPanel fontName Avenir Next fontSize 	      0@textColour 4280339679  Component type ScriptImage id Image1 x 	      1@y 	      1@fileName {PROJECT_FOLDER}logo.png  Component type ScriptSlider id Frequency x 	      t@y 	     �@mode Frequency min 	      4@max 	     ��@stepSize 	      �?suffix  Hz middlePosition 	     p�@filmstripImage !{PROJECT_FOLDER}subtle_knob.png numStrips 	      P@width 	      P@height 	      P@showTextBox 0 defaultValue 	      Y@ Component type ScriptLabel id Label3 x 	     �w@y 	     h�@text FREQUENCY editable 0 itemColour2 0 alignment right width 	      T@height 	      4@fontName Avenir Next fontStyle Bold fontSize 	      0@textColour 4280339679  Component type ScriptLabel id WidthValue x 	     `@y 	     �@text 2.5 editable 0 itemColour2 0 alignment right width 	      T@height 	      4@fontName Avenir Next fontStyle 	Regular fontSize 	      0@textColour 4292926663  Component type ScriptLabel id FrequencyValue x 	     �w@y 	     �@text 100 Hz editable 0 itemColour2 0 alignment right width 	      T@height 	      4@fontName Avenir Next fontStyle 	Regular fontSize 	      0@textColour 4292926663  Component type ScriptSlider id Volume x 	      4@y 	     �@mode 	Decibel min 	      8�max 	        stepSize 	      �?suffix  Hz middlePosition 	      (�filmstripImage !{PROJECT_FOLDER}subtle_knob.png numStrips 	      P@width 	      P@height 	      P@showTextBox 0 processorId Simple Gain1 parameterId Gain  Component type ScriptLabel id Label4 x 	      $@y 	     Ё@text VOLUME editable 0 itemColour2 0 width 	      T@height 	      4@fontName Avenir Next fontStyle Bold fontSize 	      ,@textColour 4280339679  Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor Type 
ScriptFX ID AudioPlayer Bypassed NumAudioFiles    Script � function prepareToPlay(sampleRate, blockSize)
{
	
}
 function processBlock(channels)
{
	
}
 function onControl(number, value)
{
	
}
  EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Content   Networks  Network ID AudioPlayer Version 0.0.0  UIData  ContentProperties DeviceType 	Desktop  Processor Type SimpleGain ID Simple Gain1 Bypassed Gain 	        Delay 	        Width 	      Y@Balance 	        InvertPolarity 	        EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Gain Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Delay Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Width Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   Processor Type ModulatorChain ID Pan Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0 Folded 1  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type 	CurveEq ID EQ Bypassed NumFilters    Band0 	      �?Band1 	      Y@Band2 	      �?Band3 	      �?Band4 	      �?Band5 	      �?Band6 	      Y@Band7 	      �?Band8 	      �?Band9 	      �?Band10 	      �?Band11 	     @o@Band12 	      �?Band13 	      �?Band14 	        Band15 	      �?Band16 	     @o@Band17 	      �?Band18 	      �?Band19 	        FFTEnabled EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type 
Analyser ID 
Analyser Bypassed BufferSize 	      �@PreviewType 	      @EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� Processor Type AudioLooper ID Audio Loop Player1 Bypassed Gain 	      �?Balance 	        VoiceLimit 	      p@KillFadeTime 	      4@IconColour 0 SyncMode 	      �?PitchTracking 	        LoopEnabled 	      �?RootNote 	      P@SampleStartMod 	        Reversed 	        FileName Q/Users/johnmannix/Library/Mobile Documents/com~apple~CloudDocs/Music/Lofi 1.wav min     max     loopStart     loopEnd     EditorStates BodyShown 1 Visible 1 Solo 0 Folded 1  ChildProcessors  Processor Type MidiProcessorChain ID Midi Processor Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   Processor Type ModulatorChain ID GainModulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors  Processor 	Type SimpleEnvelope ID DefaultEnvelope1 Bypassed Monophonic 	        Retrigger 	      �?Intensity 	      �?Attack 	      @Release 	      $@LinearMode 	      �?EditorStates BodyShown 1 Visible 1 Solo 0  ChildProcessors  Processor Type ModulatorChain ID Attack Time Modulation Bypassed Intensity 	      �?EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   Processor Type ModulatorChain ID PitchModulation Bypassed Intensity 	        EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   Processor Type EffectChain ID FX Bypassed EditorStates BodyShown 1 Visible 0 Solo 0  ChildProcessors   RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� RoutingMatrix NumSourceChannels    Channel0     Send0 ����Channel1    Send1 ���� macro_controls  macro name 	Macro 1 value 	        midi_cc ���� macro name 	Macro 2 value 	        midi_cc ���� macro name 	Macro 3 value 	        midi_cc ���� macro name 	Macro 4 value 	        midi_cc ���� macro name 	Macro 5 value 	        midi_cc ���� macro name 	Macro 6 value 	        midi_cc ���� macro name 	Macro 7 value 	        midi_cc ���� macro name 	Macro 8 value 	        midi_cc ���� MidiAutomation   MPEData Enabled  