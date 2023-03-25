import { world } from '@minecraft/server';
import { postMinecraftChat, getDiscordChat } from './net';

getDiscordChat();

world.events.beforeChat.subscribe(ev => {
    postMinecraftChat(`<${ev.sender.name}> ${ev.message}`);
});

world.events.playerJoin.subscribe(ev => {
    postMinecraftChat(`${ev.playerName} joined the game`);
});

world.events.playerLeave.subscribe(ev => {
    postMinecraftChat(`${ev.playerName} left the game`);
});