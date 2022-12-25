import Foundation

/*
struct nameAndURL: Decodable
{
	var name: String
	var url: String
}

struct gameIndexAndGenaration: Decodable
{
	var game_index: Int
	var generation: nameAndURL
}

struct pokemonObject: Decodable
{
	var pokemon: nameAndURL
	var slot: Int
}

struct damageRelationsModel: Decodable
{
	var double_damage_from: [nameAndURL]
	var double_damage_to:   [nameAndURL]
	var half_damage_from:   [nameAndURL]
	var half_damage_to:     [nameAndURL]
	var no_damage_from:     [nameAndURL]
	var no_damage_to:       [nameAndURL]
}
*/

struct topLevel: Decodable
{
	var damage_relations:  damageRelationsModel
	var game_indices:      [gameIndexAndGenaration]
	var generation:        nameAndURL
	var id:                Int
	var move_damage_class: nameAndURL
	var moves:             [nameAndURL]
	var name:              String
	var pokemon:           [pokemonObject]

	enum CodingKeys: String, CodingKey
	{
		case damage_relations
		case game_indices
		case generation
		case id
		case move_damage_class
		case moves
		case name
		case pokemon
	}
	
	init(from decoder: Decoder) throws
	{
		let container = try decoder.container(keyedBy: CodingKeys.self)
		damage_relations = try container.decode(damageRelationsModel.self, forKey: .damage_relations)
		game_indices = try container.decode([gameIndexAndGenaration].self, forKey: .game_indices)
		generation = try container.decode(nameAndURL.self, forKey: .generation)
		id = try container.decode(Int.self, forKey: .id)
		move_damage_class = try container.decode(nameAndURL.self, forKey: .move_damage_class)
		moves = try container.decode([nameAndURL].self, forKey: .moves)
		name = try container.decode(String.self, forKey: .name)
		do
		{
			let newValue = try container.decode(pokemonObject.self, forKey: .pokemon)		
			pokemon = [newValue]
		} catch {
			pokemon = try container.decode([pokemonObject].self, forKey: .pokemon)
		}
	}

}

func parseJSONFile() -> topLevel?
{
	let decoder = JSONDecoder()
	if let url = Bundle.main.url(forResource: "SampleJSONDragon", withExtension: "json")
	{
		do
		{
			let data = try Data(contentsOf: url)
			let jsonData = try decoder.decode(topLevel.self, from: data)
			return jsonData
		} catch {
			print("error: \(error)")
		}
	} else { print("Did not find file") }
	return nil
}

if let result = parseJSONFile()
{
	print("\(result)")
}
