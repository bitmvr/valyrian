# valyrian

Valyrian is simple video cutter. 


## Getting Started

> **NOTE:** This has a depdency on `ffmpeg` and `ffprobe`

### Add Timestamp

1. Open `timestamps.manifest` with your favorite editor.
2. Add timestamps in `HH:MM:SS` format.


**Timestamp Example**
```

00:12:34

```
### Execute Valyrian

1. Open **Terminal**
2. Execute: `cd /path/to/valyrian/`
3. Execute: `./valyrian.sh VIDEO_SOURCE`
4. Wait...

Converted videos will be available as `VIDEO_X` where X is dependent on the number of timestamps provided.


