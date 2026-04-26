# minecraft-dunst

turned my linux notifications into minecraft achievements

because why should my system alerts look boring

![badge](https://img.shields.io/badge/Linux-XFCE-blue)
![badge](https://img.shields.io/badge/dunst-notification-green)
![badge](https://img.shields.io/badge/vibes-immaculate-yellow)

## what it does

your notifications now look like minecraft achievement popups
```
low urgency → Advancement Made!
normal → Achievement get!
critical → Goal Reached! (red border, stays until you close it)
```
minecraft font, pixel corners. that look pixel look that i always wanted!!

<img width="1920" height="1080" alt="SSmineNotif" src="https://github.com/user-attachments/assets/0344171b-0a0c-4f5d-97bc-f44aa2d3772a" />

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
notify-send -u low "Advancement Made!" 
notify-send -u normal "Achievement get!"    
notify-send -u critical "Goal Reached!"     
```

## why,you ask?

- One, i rice my desktop
- Two, i play minecraft
- Sixteen, it was inevitable
