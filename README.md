## Description

This script allows players to spawn a Sanchez and automatically place themselves on it using the `/motor` command. It includes a cooldown feature, requiring players to wait two minutes before using the command again.

---

## Features

- Spawns a Sanchez motorcycle at the player's current location.
- Automatically places the player on the motorcycle.
- Implements a 2 minute cooldown to prevent overuse of the `/motor` command.
- Includes a notification system to inform players when the command is on cooldown.

---

## Installation

1. **Download and Extract**  
   Download the script and place it in your resource folder.

2. **Resource Setup**  
   Add the resource to your `server.cfg` file:
   ```plaintext
   ensure wd-motor
   ```

3. **Notification System**  
   Ensure you have a notification system like `okokNotify` installed and configured.

---

## Usage

1. In the game, use the command `/motor` to spawn a motorcycle.
2. If the command is on cooldown, you will receive an info notification.

---

## Configuration

- **Cooldown Duration**  
  The cooldown is set to 120 seconds (2 minutes) by default.  
  To modify this, change the value in `Server.lua`:
  ```lua
  if cooldowns[player] and (currentTime - cooldowns[player]) < 120 then
  ```
  Replace `120` with your desired duration in seconds.

- **Vehicle Model**  
  The script spawns a Sanchez motorcycle by default.  
  To use a different vehicle, replace `"sanchez"` in `client.lua` with the desired model name:
  ```lua
  local vehicleHash = GetHashKey("sanchez")
  ```

---

## Dependencies

- Notification system (e.g., `okokNotify`)

---

## Files

- **client.lua**  
  Handles the vehicle spawning logic.

- **server.lua**  
  Manages the `/motor` command and cooldown system.

---

## Contributing

Feel free to submit issues or pull requests to enhance the functionality of this script.

---

## License

This project is licensed under the MIT License. See the LICENSE file for details.
