BIN = bin
SRC = src
program_name = main

$(BIN)/$(program_name): $(SRC)/$(program_name).swift $(SRC)/damageRelationModel.swift $(SRC)/gameIndexAndGeneration.swift $(SRC)/pokemonObject.swift $(SRC)/nameAndURL.swift
	swiftc $^ -o $@

run:
	./$(BIN)/$(program_name)
