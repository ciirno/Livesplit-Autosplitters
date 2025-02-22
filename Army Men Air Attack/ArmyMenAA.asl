state("LiveSplit") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/emu-help-v3")).CreateInstance("PS1");
}

init
{
	vars.Helper.Load = (Func<dynamic, bool>)(emu => 
	{
		emu.Make<int>("Start", 0x800eb1ec);
		emu.Make<int>("MissionNumber", 0x800d0990);
		emu.Make<int>("MissionComplete", 0x801e1f04);

        return true;
	});

}

start
{
	return old.Start == 1 && current.Start == 0 && current.MissionNumber == 0;
}

split
{
    return ( old.MissionComplete == 0 || old.MissionComplete == 2 ) && current.MissionComplete == 9;
}