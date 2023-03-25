# MinecraftDiscordChat
Share Discord and Minecraft chats on BDS.


Discord ボットのトークン、Minecraft のチャット チャネル ID、使用するポートを変更する
環境変数を変更することで設定できます。環境変数名は次のようになります。

MINECRAFT_DISCORD_BOT_TOKEN MINECRAFT_DISCORD_CHAT_CHANNEL_ID MINECRAFT_DISCORD_PORT

MINECRAFT_DISCORD_PORT のデフォルトは 8080 ポートを変更する場合、MINECRAFT_DISCORD_PORT および discord_minecraft_chat/discord_minecraft_chat_behavior/scripts/net.js DISCORDCHATURL 変数で 8080 を変更する必要があります。

環境変数が null の場合に使用する変数に直接書き込むことによって設定することもできます。
