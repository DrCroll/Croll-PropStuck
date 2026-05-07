# Croll-PropStuck

Lightweight standalone FiveM utility command to remove props attached to your player.

## Features

- Standalone (no framework dependency).
- Removes only objects attached to the local player ped.
- Uses a distance pre-filter for better performance on busy servers.
- Simple in-game notification feedback.

## Installation

1. Place the resource folder in your server `resources` directory.
2. Ensure the resource in your `server.cfg`:

```cfg
ensure Croll-PropStuck
```

## Usage

- Run `/propstuck` in chat.
- If attached props are found, they are deleted.
- You will get a success or error notification.

## Notes

- This script is client-side and intended as a self-cleanup utility.
- The scan radius can be adjusted in `client.lua` using `ATTACH_SCAN_RADIUS`.
