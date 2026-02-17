import Foundation
import Testing

import Lexicon

struct DefinitionTests {
	@Test
	func readLexicon() throws {
		let json = """
{
  "lexicon": 1,
  "id": "com.example.getProfile",
  "defs": {
	"main": {
	  "type": "query",
	  "parameters": {
		"type": "params",
		"required": ["user"],
		"properties": {
		   "user": { "type": "string" }
		},
	  },
	  "output": {
		"encoding": "application/json",
		"schema": {
		  "type": "object",
		  "required": ["did", "name"],
		  "properties": {
			"did": {"type": "string"},
			"name": {"type": "string"},
			"displayName": {"type": "string", "maxLength": 64},
			"description": {"type": "string", "maxLength": 256}
		  }
		}
	  }
	}
  }
}
"""
		let def = try JSONDecoder().decode(Definition.self, from: Data(json.utf8))

		#expect(def.version == 1)
		#expect(def.id == "com.example.getProfile")
		#expect(def.description == nil)
	}
}
