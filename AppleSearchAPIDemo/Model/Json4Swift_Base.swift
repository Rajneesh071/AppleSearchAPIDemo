//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 30/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.

import Foundation
struct Json4Swift_Base : Codable {
	let resultCount : Int?
	let results : [Results]?

	enum CodingKeys: String, CodingKey {

		case resultCount = "resultCount"
		case results = "results"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		resultCount = try values.decodeIfPresent(Int.self, forKey: .resultCount)
		results = try values.decodeIfPresent([Results].self, forKey: .results)
	}

}
