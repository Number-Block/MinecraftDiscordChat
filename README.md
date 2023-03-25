# MinecraftDiscordChat
Share Discord and Minecraft chats on BDS.

Change Discord Bot token, Minecraft chat channel id and port used
Can be set by changing the environment variable. The environment variable name should be as follows.

MINECRAFT_DISCORD_BOT_TOKEN MINECRAFT_DISCORD_CHAT_CHANNEL_ID MINECRAFT_DISCORD_PORT

MINECRAFT_DISCORD_PORT defaults to 8080 If you change the port, you must change 8080 in the MINECRAFT_DISCORD_PORT and discord_minecraft_chat/discord_minecraft_chat_behavior/scripts/net.js DISCORDCHATURL variables.

It can also be set by writing directly to the variable to use if the environment variable is null.
