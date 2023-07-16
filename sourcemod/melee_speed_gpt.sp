#include <sourcemod>

public void OnPluginStart()
{
	HookEvent("player_spawn", Event_PlayerSpawn);
	HookEvent("player_attack", Event_PlayerAttack);
}

public Action Event_PlayerSpawn(Handle event, const char[] name, bool no_broadcast)
{
	// 获取玩家ID
	int client = GetEventInt(event, "userid");

	// 设置基本的移动速度


	return Plugin_Continue;
}

public Action Event_PlayerAttack(Handle event, const char[] name, bool no_broadcast)
{
	// 获取玩家ID
	int client	  = GetEventInt(event, "userid");

	// 获取武器类型
	char[] weapon = "";
	GetClientWeapon(client, weapon, 24);

	// 判断是近战武器
	if (StrEqual(weapon, "weapon_melee"))
	{
		// 增加移动速度

    }	
	else
	{
		// 恢复基本的移动速度
		
	}

	return Plugin_Continue;
}
