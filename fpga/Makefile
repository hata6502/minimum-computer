all: character_rom_test mcvideo_test

character_rom_test: src/mcvideo/character_rom.v src/mcvideo/character_rom_test.v
	iverilog -o bin/mcvideo/character_rom_test src/mcvideo/character_rom.v src/mcvideo/character_rom_test.v

mcvideo_test: src/mcvideo/character_rom.v src/mcvideo/mcvideo.v src/mcvideo/mcvideo_test.v
	iverilog -o bin/mcvideo/mcvideo_test src/mcvideo/character_rom.v src/mcvideo/mcvideo.v src/mcvideo/mcvideo_test.v
