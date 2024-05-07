class vicBuyMenu {
	idd = 20231960;
	class controls {
        class RscText_1000: RscText
        {
            idc = 1000;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.528 * safezoneH;
            colorBackground[] = {0.1,0.1,0.1,0.9};
        };
        class RscFrame_1800: RscFrame
        {
            idc = 1800;
            x = 0.304062 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.391875 * safezoneW;
            h = 0.528 * safezoneH;
        };
        class vicList: RscListbox
        {
            idc = 1500;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.226875 * safezoneW;
            h = 0.451 * safezoneH;
            onLBSelChanged = "execVM 'vicUpdate.sqf'";
        };
        class vicPreview: RscPicture
        {
            idc = 1200;
            text = "#(argb,8,8,3)color(1,1,1,1)";
            x = 0.551562 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.128906 * safezoneW;
            h = 0.22 * safezoneH;
        };
        class buttonPurchase: RscButton
        {
            idc = 1600;
            text = "Purchase"; //--- ToDo: Localize;
            x = 0.597969 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0928125 * safezoneW;
            h = 0.044 * safezoneH;
            colorBackground[] = {0.349,0.475,0.306,1};
            action = "execVM 'purchaseVic.sqf'";
        };
        class textCost: RscText
        {
            idc = 1001;
            text = "Cost:"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0257812 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class textCostValue: RscText
        {
            idc = 1002;
            text = "0"; //--- ToDo: Localize;
            x = 0.329844 * safezoneW + safezoneX;
            y = 0.709 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class textWallet: RscText
        {
            idc = 1004;
            text = "Supply:"; //--- ToDo: Localize;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.022 * safezoneH;
        };
        class textWalletValue: RscText
        {
            idc = 1005;
            text = "0"; //--- ToDo: Localize;
            x = 0.335 * safezoneW + safezoneX;
            y = 0.731 * safezoneH + safezoneY;
            w = 0.0515625 * safezoneW;
            h = 0.022 * safezoneH;
        };
    };
};

class dialogGenerateAO {
	idd = 2023;
	class controls{
		class textBG: RscText
		{
			idc = 1801;
			text = "";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,0.9};
		};
		class frameBG: RscFrame
		{
			idc = 1800;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.268125 * safezoneW;
			h = 0.44 * safezoneH;
			colorBackground[] = {0.1,0.1,0.1,1};
		};
		class textEnemyStrength: RscText
		{
			idc = 1000;
			text = "Enemy Strength:"; //--- ToDo: Localize;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
		class textAOsize: RscText
		{
			idc = 1001;
			text = "AO size:";
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.061875 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
		class sliderEnemyStrength: RscXSliderH
		{
			idc = 1900;
			x = 0.452656 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.171094 * safezoneW;
			h = 0.022 * safezoneH;
			sliderRange[] = {1, 10};
			sliderPosition = 2;
			sliderStep = 1;
			onSliderPosChanged = "AO_enemyStrength = _this select 1; publicVariable 'AO_enemyStrength'; ctrlSetText [1002, str AO_enemyStrength];";
		};
		class textsliderEnemyStrength: RscText
		{
			idc = 1002;
			text = "2";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.291 * safezoneH + safezoneY;
			w = 0.03 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
		class sliderAOsize: RscXSliderH
		{
			idc = 1901;
			x = 0.452656 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.171094 * safezoneW;
			h = 0.022 * safezoneH;
			sliderRange[] = {200, 1000};
			sliderPosition = 500;
			sliderStep = 50;
			onSliderPosChanged = "AO_size = _this select 1; publicVariable 'AO_size'; ctrlSetText [1003, str AO_size];";
		};
		class textsliderAOsize: RscText
		{
			idc = 1003;
			text = "500";
			x = 0.422656 * safezoneW + safezoneX;
			y = 0.324 * safezoneH + safezoneY;
			w = 0.03 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorText[] = {1,1,1,1};
		};
		class listActiveAOs: RscListbox
		{
			idc = 1500;
			x = 0.360781 * safezoneW + safezoneX;
			y = 0.445 * safezoneH + safezoneY;
			w = 0.0773437 * safezoneW;
			h = 0.264 * safezoneH;
			onLBSelChanged = "execVM 'focusMap.sqf'";
		};
		class mapActiveAO: RscMapControl
		{
			idc = 1990;
			x = 0.453594 * safezoneW + safezoneX;
			y = 0.368 * safezoneH + safezoneY;
			w = 0.154687 * safezoneW;
			h = 0.253 * safezoneH;
		};
		class buttonGenerateMission: RscButton
		{
			idc = 1600;
			text = "Generate Mission"; //--- ToDo: Localize;
			x = 0.556719 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.0721875 * safezoneW;
			h = 0.044 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0.25,0.25,0.25,1};
			action = "remoteExec ['ARDN_fnc_generateMission',2]; closeDialog 1;";
		};
		class buttonClearAO: RscButton
		{
			idc = 1601;
			text = "Clear AO"; //--- ToDo: Localize;
			x = 0.438125 * safezoneW + safezoneX;
			y = 0.676 * safezoneH + safezoneY;
			w = 0.04125 * safezoneW;
			h = 0.033 * safezoneH;
			colorBackground[] = {0,0,0,1};
			colorBackgroundActive[] = {0.25,0.25,0.25,1};
			action = "_index = lbCurSel 1500; _ao = activeAOs select _index; [_ao] remoteExec ['ARDN_fnc_clearAO',2]; closeDialog 1;";
		};
	};
};