import Foundation

func printRootKeys()
{
	//let decoder = JSONDecoder()
	guard
		let url = Bundle.main.url(forResource: "SampleJSONGlaceon", withExtension: "json"),
		let data = try? Data(contentsOf: url),
		let dict = try? JSONSerialization.jsonObject(with: data) as? [String:Any]
	else 
	{
		print("Decoding failed")
		return 
	}
	print(dict.keys)
}

printRootKeys()
