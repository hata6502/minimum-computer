all: character_rom_test video_generator_test

character_rom_test: src/video_generator/character_rom.v src/video_generator/character_rom_test.v
	iverilog -o bin/video_generator/character_rom_test src/video_generator/character_rom.v src/video_generator/character_rom_test.v

video_generator_test: src/video_generator/character_rom.v src/video_generator/video_generator.v src/video_generator/video_generator_test.v
	iverilog -o bin/video_generator/video_generator_test src/video_generator/character_rom.v src/video_generator/video_generator.v src/video_generator/video_generator_test.v
