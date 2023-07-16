#include <sourcemod>
#include <sdktools>

// 插件的基础信息
public Plugin myinfo =
{
	name = "My First Plugin",
	author = "Me",
	description = "My first plugin ever",
	version = "1.0",
	url = "http://www.sourcemod.net/"
};

// 服务器启动时会回调此函数
public void OnPluginStart()
{
    // 在服务器控制台打印Hello world
    PrintToServer("Hello world!");
    // 使用此命令注册管理命令
    RegAdminCmd("sm_myslap", Command_MySlap, ADMFLAG_SLAY);
    LoadTranslations("common.phrases.txt"); // Required for FindTarget fail reply
    return Plugin_Handled
}

// 需要注册的管理命令（回调函数）
public Action Command_MySlap(int client, int args)
{
    char arg1[32], arg2[32];

    /* By default, we set damage = 0 */
    int damage = 0;

    /* Get the first argument */
    GetCmdArg(1, arg1, sizeof(arg1));

    /* If there are 2 or more arguments, we set damage to
        * what the user specified. If a damage isn't specified
        * then it will stay zero. */
    if (args >= 2)
    {
        GetCmdArg(2, arg2, sizeof(arg2));
        damage = StringToInt(arg2);
    }

    /* Try and find a matching player */
    int target = FindTarget(client, arg1);
    if (target == -1)
    {
        /* FindTarget() automatically replies with the 
            * failure reason and returns -1 so we know not 
            * to continue
            */
        return Plugin_Handled;
    }

    SlapPlayer(target, damage);
    ReplyToCommand(client, "[SM] You slapped %N for %d damage!", target, damage);

    return Plugin_Handled;
}