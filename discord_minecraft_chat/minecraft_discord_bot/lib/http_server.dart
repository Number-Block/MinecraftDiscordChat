import 'dart:convert';
import 'dart:io';

import 'package:minecraft_discord_bot/discord_bot.dart';

Map<String, String> envVars = Platform.environment;

final host = InternetAddress.loopbackIPv4;
final port = int.parse(envVars['MINECRAFT_DISCORD_PORT'] ?? '8080');

List<HttpRequest> getChatRequests = [];

void startHttpServer() async {
  HttpServer server = await HttpServer.bind(host, port, shared: false);
  await for (HttpRequest request in server) {
    request.response.headers.contentType = ContentType.text;
    if (request.method == 'GET' && request.uri.path == '/minecraft/chat') {
      request.response.deadline = Duration(hours: 1);
      getChatRequests.add(request);
    } else if (request.method == 'POST' && request.uri.path == '/minecraft/chat') {
      sendToDiscordChat(await utf8.decodeStream(request));
      request.response
        ..statusCode = HttpStatus.ok
        ..write('')
        ..close();
    } else {
      request.response
        ..statusCode = HttpStatus.notFound
        ..write('')
        ..close();
    }
  }
}

void sendToMinecraftChat(String chat) {
  for (HttpRequest request in getChatRequests) {
    request.response
      ..statusCode = HttpStatus.ok
      ..write(chat)
      ..close();
  }
  getChatRequests = [];
}
