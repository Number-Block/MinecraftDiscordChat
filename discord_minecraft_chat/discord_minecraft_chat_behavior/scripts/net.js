import { world } from '@minecraft/server';
import { HttpRequest, HttpRequestMethod, HttpHeader, http } from '@minecraft/server-net';

const DISCORDCHATURL = 'http://localhost:8080/minecraft/chat';

export async function getDiscordChat() {
    try {
        const req = new HttpRequest(DISCORDCHATURL);
        req.method = HttpRequestMethod.GET;
        req.setTimeout(72000);
        const response = await http.request(req);
        world.sendMessage(response.body);
        getDiscordChat();
    } catch (_) {
        getDiscordChat();
    }
}

export async function postMinecraftChat(chat) {
    try {
        const req = new HttpRequest(DISCORDCHATURL);
        req.method = HttpRequestMethod.POST;
        req.headers = [
            new HttpHeader('Content-Type', 'text/plain')
        ];
        req.body = chat;
        await http.request(req);
    } catch (_) { }
}