import 'dart:io';
import 'package:nyxx/nyxx.dart';
import 'http_server.dart';

late ITextChannel channel;

void startDiscordBot() {
  Map<String, String> envVars = Platform.environment;
  String discordBotToken = envVars['MINECRAFT_DISCORD_BOT_TOKEN'] ?? '';
  String discordChannelId = envVars['MINECRAFT_DISCORD_CHAT_CHANNEL_ID'] ?? '';

  final bot = NyxxFactory.createNyxxWebsocket(discordBotToken, GatewayIntents.all)
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions())
    ..connect();

  bot.eventsWs.onReady.listen((e) async {
    channel = await bot.fetchChannel(Snowflake(discordChannelId));
  });

  bot.eventsWs.onMessageReceived.listen((e) {
    if (e.message.author.bot) return;
    if (e.message.channel.id == Snowflake(discordChannelId)) {
      sendToMinecraftChat(
          '<${e.message.member?.nickname ?? e.message.author.username}> ${e.message.content}');
    }
  });
}

void sendToDiscordChat(String chat) {
  channel.sendMessage(MessageBuilder.content(chat));
}
