struct damageRelationsModel: Decodable
{
	var double_damage_from: [nameAndURL]
	var double_damage_to:   [nameAndURL]
	var half_damage_from:   [nameAndURL]
	var half_damage_to:     [nameAndURL]
	var no_damage_from:     [nameAndURL]
	var no_damage_to:       [nameAndURL]
}

