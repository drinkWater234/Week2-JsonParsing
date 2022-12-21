BIN = bin
SRC = src
program_name = dragon

$(BIN)/$(program_name): $(SRC)/$(program_name).swift
	swiftc $< -o $@

run:
	./$(BIN)/$(program_name)
