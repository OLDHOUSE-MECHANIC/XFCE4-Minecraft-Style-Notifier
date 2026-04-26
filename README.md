# minecraft-dunst

turned my linux notifications into minecraft achievements

because why should my system alerts look boring

![badge](https://img.shields.io/badge/Linux-XFCE-blue)
![badge](https://img.shields.io/badge/dunst-notification-green)
![badge](https://img.shields.io/badge/vibes-immaculate-yellow)

## what it does

your notifications now look like minecraft achievement popups

low urgency → Advancement Made!
normal → Achievement get!
critical → Goal Reached! (red border, stays until you close it)

minecraft font, pixel corners, zero nonsense

## requirements

- dunst
- the minecraft font .ttf file (put it next to the script)

## setup

```bash
git clone https://github.com/OLDHOUSE-MECHANIC/minecraft-dunst.git
cd minecraft-dunst
chmod +x minecraft_dunst_setup.sh
./minecraft_dunst_setup.sh
```

done. three test notifications fire automatically so you know it worked.

## usage

```bash
notify-send -u low      "Advancement Made!" "your message"
notify-send -u normal   "Achievement get!"  "your message"  
notify-send -u critical "Goal Reached!"     "your message"
```

## why,you ask?

- One, i rice my desktop
- Two, i play minecraft
- Sixteen, it was inevitable
