#include <sourcemod>
#include <sdktools>

// 插件的基础信息
public Plugin myinfo =
{
	name		= "My First Plugin",
	author		= "Me",
	description = "My first plugin ever",
	version		= "1.0",
	url			= "http://www.sourcemod.net/"
};

// 服务器启动时会回调此函数
public void OnPluginStart()
{
	HookEvent("weapon_fire", Event_WeaponFire);
}

public Action Event_WeaponFire(Event event, const char[] name, bool bHandled)
{
	int client = GetClientOfUserId(GetEventInt(event, "userid"));

	if (!IsClientInGame(client) || IsFakeClient(client) || GetClientTeam(client) != 2)
	{
		return Plugin_Handled;
	}

	char[] weapon = "";
	GetClientWeapon(client, weapon, 24);

	if (StrEqual(weapon, "weapon_melee"))
	{
		// 使用的是近战
	}
	else
	{
		// 没有使用近战
	}

	return Plugin_Handled;
}