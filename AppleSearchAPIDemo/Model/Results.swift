
//  AppleSearchAPIDemo
//
//  Created by Rajneesh on 30/11/20.
//  Copyright © 2020 Nagarro. All rights reserved.


import Foundation
struct Results : Codable {
	let wrapperType : String?
	let kind : String?
	let artistId : Int?
	let collectionId : Int?
	let trackId : Int?
	let artistName : String?
	let collectionName : String?
	let trackName : String?
	let collectionCensoredName : String?
	let trackCensoredName : String?
	let collectionArtistId : Int?
	let collectionArtistName : String?
	let collectionArtistViewUrl : String?
	let artistViewUrl : String?
	let collectionViewUrl : String?
	let trackViewUrl : String?
	let previewUrl : String?
	let artworkUrl30 : String?
	let artworkUrl60 : String?
	let artworkUrl100 : String?
	let collectionPrice : Double?
	let trackPrice : Double?
	let releaseDate : String?
	let collectionExplicitness : String?
	let trackExplicitness : String?
	let discCount : Int?
	let discNumber : Int?
	let trackCount : Int?
	let trackNumber : Int?
	let trackTimeMillis : Int?
	let country : String?
	let currency : String?
	let primaryGenreName : String?
	let contentAdvisoryRating : String?
	let isStreamable : Bool?

	enum CodingKeys: String, CodingKey {

		case wrapperType = "wrapperType"
		case kind = "kind"
		case artistId = "artistId"
		case collectionId = "collectionId"
		case trackId = "trackId"
		case artistName = "artistName"
		case collectionName = "collectionName"
		case trackName = "trackName"
		case collectionCensoredName = "collectionCensoredName"
		case trackCensoredName = "trackCensoredName"
		case collectionArtistId = "collectionArtistId"
		case collectionArtistName = "collectionArtistName"
		case collectionArtistViewUrl = "collectionArtistViewUrl"
		case artistViewUrl = "artistViewUrl"
		case collectionViewUrl = "collectionViewUrl"
		case trackViewUrl = "trackViewUrl"
		case previewUrl = "previewUrl"
		case artworkUrl30 = "artworkUrl30"
		case artworkUrl60 = "artworkUrl60"
		case artworkUrl100 = "artworkUrl100"
		case collectionPrice = "collectionPrice"
		case trackPrice = "trackPrice"
		case releaseDate = "releaseDate"
		case collectionExplicitness = "collectionExplicitness"
		case trackExplicitness = "trackExplicitness"
		case discCount = "discCount"
		case discNumber = "discNumber"
		case trackCount = "trackCount"
		case trackNumber = "trackNumber"
		case trackTimeMillis = "trackTimeMillis"
		case country = "country"
		case currency = "currency"
		case primaryGenreName = "primaryGenreName"
		case contentAdvisoryRating = "contentAdvisoryRating"
		case isStreamable = "isStreamable"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		wrapperType = try values.decodeIfPresent(String.self, forKey: .wrapperType)
		kind = try values.decodeIfPresent(String.self, forKey: .kind)
		artistId = try values.decodeIfPresent(Int.self, forKey: .artistId)
		collectionId = try values.decodeIfPresent(Int.self, forKey: .collectionId)
		trackId = try values.decodeIfPresent(Int.self, forKey: .trackId)
		artistName = try values.decodeIfPresent(String.self, forKey: .artistName)
		collectionName = try values.decodeIfPresent(String.self, forKey: .collectionName)
		trackName = try values.decodeIfPresent(String.self, forKey: .trackName)
		collectionCensoredName = try values.decodeIfPresent(String.self, forKey: .collectionCensoredName)
		trackCensoredName = try values.decodeIfPresent(String.self, forKey: .trackCensoredName)
		collectionArtistId = try values.decodeIfPresent(Int.self, forKey: .collectionArtistId)
		collectionArtistName = try values.decodeIfPresent(String.self, forKey: .collectionArtistName)
		collectionArtistViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionArtistViewUrl)
		artistViewUrl = try values.decodeIfPresent(String.self, forKey: .artistViewUrl)
		collectionViewUrl = try values.decodeIfPresent(String.self, forKey: .collectionViewUrl)
		trackViewUrl = try values.decodeIfPresent(String.self, forKey: .trackViewUrl)
		previewUrl = try values.decodeIfPresent(String.self, forKey: .previewUrl)
		artworkUrl30 = try values.decodeIfPresent(String.self, forKey: .artworkUrl30)
		artworkUrl60 = try values.decodeIfPresent(String.self, forKey: .artworkUrl60)
		artworkUrl100 = try values.decodeIfPresent(String.self, forKey: .artworkUrl100)
		collectionPrice = try values.decodeIfPresent(Double.self, forKey: .collectionPrice)
		trackPrice = try values.decodeIfPresent(Double.self, forKey: .trackPrice)
		releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
		collectionExplicitness = try values.decodeIfPresent(String.self, forKey: .collectionExplicitness)
		trackExplicitness = try values.decodeIfPresent(String.self, forKey: .trackExplicitness)
		discCount = try values.decodeIfPresent(Int.self, forKey: .discCount)
		discNumber = try values.decodeIfPresent(Int.self, forKey: .discNumber)
		trackCount = try values.decodeIfPresent(Int.self, forKey: .trackCount)
		trackNumber = try values.decodeIfPresent(Int.self, forKey: .trackNumber)
		trackTimeMillis = try values.decodeIfPresent(Int.self, forKey: .trackTimeMillis)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		currency = try values.decodeIfPresent(String.self, forKey: .currency)
		primaryGenreName = try values.decodeIfPresent(String.self, forKey: .primaryGenreName)
		contentAdvisoryRating = try values.decodeIfPresent(String.self, forKey: .contentAdvisoryRating)
		isStreamable = try values.decodeIfPresent(Bool.self, forKey: .isStreamable)
	}

}
