# linux-beep-music
A library to compound music using pcspkr module and motherboard speaker

# Requirements
## Advanced PC-speaker beeper
 beep does what you'd expect: it beeps. But unlike printf "\a", beep allows
 you to control pitch, duration, and repetitions. Its job is to live inside
 shell/perl scripts and allow more granularity than one has otherwise. It is
 controlled completely through command line options. It's not supposed to be
 complex, and it isn't - but it makes system monitoring (or whatever else it
 gets hacked into) much more informative.

```
sudo apt install beep
```

# Songs
## Megalovania - Undertale
Source: https://virtualpiano.net/music-sheet/megalovania-undertale-toby-fox-easy/
```bash
curl https://raw.githubusercontent.com/propilideno/linux-beep-music/main/megalovania.sh | bash
```

# References
- https://mixbutton.com/mixing-articles/music-note-to-frequency-chart/
