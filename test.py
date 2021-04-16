from midi2audio import FluidSynth

fs = FluidSynth()
fs.midi_to_audio('/static/music/test_output.mid', 'flac_output.flac')