# nf-doom

```bash
nextflow run doom
```

![nf-doom screenshot](nextflow_doom.png)

> [!NOTE]
> All credit for the Java implementation go to this project: https://github.com/gaborbata/vanilla-mocha-doom

## Troubleshooting

### Sound error: NullPointerException

If you see an error like:

```
Cannot invoke "javax.sound.midi.Receiver.send(javax.sound.midi.MidiMessage, long)" because "receiver" is null
```

This occurs on systems without MIDI audio devices. Run with the `--nomusic` flag to disable music:

```bash
nextflow run doom --nomusic
```
