 const var laf = Engine.createGlobalScriptLookAndFeel();
 
 laf.registerFunction("drawToggleButton", function(g, obj)
 {
 	 if (obj.value) {
     	g.setColour(0xFF20CCDF);
     } else {
     	g.setColour(Colours.withAlpha(0xFFE0DCC7, 0.3));
     }
     	
     g.fillEllipse([6, obj.area[3]/2-6, 10, 10]);
         
     g.setColour(Colours.withAlpha(0xFFE0DCC7, obj.value ? 1.0 : 0.3));
     g.setFont("Avenir Next, Arial", 12.0);
     obj.area[0] += 22;     
     g.drawAlignedText(obj.text.toUpperCase(), obj.area, "left");
 });function onNoteOn()
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
 