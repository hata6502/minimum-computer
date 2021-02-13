all: character_rom_test video_generator_test

character_rom_test: src/character_rom.v src/character_rom_test.v
	iverilog -o bin/character_rom_test src/character_rom.v src/character_rom_test.v

video_generator_test: src/character_rom.v src/video_generator.v src/video_generator_test.v
	iverilog -o bin/video_generator_test src/character_rom.v src/video_generator.v src/video_generator_test.v
