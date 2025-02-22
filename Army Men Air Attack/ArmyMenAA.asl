state("LiveSplit") {}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/emu-help-v3")).CreateInstance("PS1");
}

init
{
	vars.Helper.Load = (Func<dynamic, bool>)(emu => 
	{
		emu.Make<int>("Start", 0xeb1ec);
		emu.Make<int>("MissionNumber", 0xd0990);
		emu.Make<int>("MissionComplete", 0xd7eb4);
		
		return true;
	});

}

start
{
	return old.Start == 00 && current.Start == 01;

    return true;
}

split
{
    return old.MissionComplete == 00 && current.MissionComplete == 01;
}

/* Current Level State
0x1e1f04
0x00=Not in Level / Loading Level
0x02=Playing Level
0x03=Level Paused
0x09=Quit/Won Level
*/

/* Mission Complete */
0xd7eb4	00 -> 01

/* Current Mission */

0xd0990

0x00=Mission 1: Plastic Pandemonium
0x01=Mission 2: Going Car-razy
0x02=Mission 3: The Train That Could
0x03=Mission 4: Tan Terror-tory
0x04=Mission 5: Bug Bath
0x05=Mission 6: Uninvited Guests
0x06=Mission 7: Ants in the Pants
0x07=Mission 8: Saucer Attack
0x08=Mission 9: The Heat is On
0x09=Mission 10: The Melting Pot
0x0A=Mission 11: River Rapids Riot
0x0B=Mission 12: Nighttime Teddy
0x0C=Mission 13: Demolition Time
0x0D=Mission 14: Pick up the Pieces
0x0E=Mission 15: Have An Ice Day
0x0F=Mission 16: Plastro's Reveng

/* In-game or On Screens */

0xeb1ec 	

0x00 - In Game
0x01 - On Screens