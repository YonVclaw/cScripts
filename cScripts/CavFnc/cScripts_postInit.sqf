/*
 * Author: CPL.Brostrom.A
 * This is the rules set for the mission using the cba XEH. Each setting here is alterd via cbaSettings
 */
if (is3DEN) exitWith {};

#include "..\script_component.hpp";

FORCEINFO("Loading postInit");

// Add diary records on mission start
if (cScripts_Settings_showDiaryRecords) then {
    call cScripts_fnc_initDocuments;
};

if (cScripts_Settings_allowCustomInit) then {
    // Change inventory content of supply crates on mission start.
    if (cScripts_Settings_useCustomVehicleSettings) then {
        call cScripts_fnc_initVehicle;

        // Make sure curator object gets its functions reapplied.
        call cScripts_fnc_initCuratorC130;
        call cScripts_fnc_initCuratorHeloGetOutRL;
    };

    // Change inventory content of nato supply crates on mission start.
    if (cScripts_Settings_useCustomSupplyInventory) then {
        call cScripts_fnc_initSupply;
    };
};

switch (cScripts_Settings_setMissionType) do {
    case (0): {
        if (cScripts_Settings_enableStartHint) then {
            [cScripts_Settings_setCustomHintTopic, cScripts_Settings_setCustomHintText, 15] call cScripts_fnc_initCustomStartHint;
        };
    };
    case (1): {
        if (cScripts_Settings_enableStartHint) then {
            [cScripts_Settings_setRedLightTime] call cScripts_fnc_initMissionStartHint;
        };
    };
    case (2): {
        if (cScripts_Settings_enableStartHint) then {
            [cScripts_Settings_setTrainingHintTime] call cScripts_fnc_initTrainingStartHint;
        };
    };
};

FORCEINFO("postInit loaded");
