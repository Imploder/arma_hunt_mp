enableSaving [ false, false ];

[player,"PoliceStuff",player,aHelipad,"American Store","Authorized Peacekeeping",{side player == WEST}] call grad_lbm_fnc_addInteraction;

addMissionEventHandler ["EntityKilled",{
    params ["_killedUnit","_killer","_triggerMan"];
	//Add money to police, allow civi clothes steal
    if (side _killedUnit isEqualTo civilian AND side _triggerMan isEqualTo west) then {
		[player,10000] call grad_lbm_fnc_addFunds;
		_triggerMan addRating (-(rating _triggerMan));
		_killedUnit addAction ["Take Clothes", "TakeClothes.sqf",[],1,false,true,"",""];
    };
	//Add money to police for killing protesters
    if (side _killedUnit isEqualTo east AND side _triggerMan isEqualTo west) then {
		[player,500] call grad_lbm_fnc_addFunds;
		_triggerMan addRating (-(rating _triggerMan));
    };
}];

// ToDo:
// Holster Weapon
// Shop exchanges equipment
// Add more shop items (More weapons + Backpack)
// 