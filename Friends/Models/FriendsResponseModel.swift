//
//  FriendsResponseModel.swift
//  Friends
//
//  Created by Workspace Infotech on 8/11/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let friendsResponse = try? newJSONDecoder().decode(FriendsResponse.self, from: jsonData)

import Foundation

// MARK: - FriendsResponse
class FriendsResponse: Codable {
    let results: [Friend]?
    let info: Info?

    init(results: [Friend]?, info: Info?) {
        self.results = results
        self.info = info
    }
}

// MARK: - Info
class Info: Codable {
    let seed: String?
    let results, page: Int?
    let version: String?

    init(seed: String?, results: Int?, page: Int?, version: String?) {
        self.seed = seed
        self.results = results
        self.page = page
        self.version = version
    }
}

// MARK: - Result
class Friend: Codable {
    let gender: Gender?
    let name: Name?
    let location: Location?
    let email: String?
    let login: Login?
    let dob, registered: Dob?
    let phone, cell: String?
    let id: ID?
    let picture: Picture?
    let nat: String?

    init(gender: Gender?, name: Name?, location: Location?, email: String?, login: Login?, dob: Dob?, registered: Dob?, phone: String?, cell: String?, id: ID?, picture: Picture?, nat: String?) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.login = login
        self.dob = dob
        self.registered = registered
        self.phone = phone
        self.cell = cell
        self.id = id
        self.picture = picture
        self.nat = nat
    }
}

// MARK: - Dob
class Dob: Codable {
    let date: String?
    let age: Int?

    init(date: String?, age: Int?) {
        self.date = date
        self.age = age
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
}

// MARK: - ID
class ID: Codable {
    let name: String?
    let value: String?

    init(name: String?, value: String?) {
        self.name = name
        self.value = value
    }
}

// MARK: - Location
class Location: Codable {
    let street: Street?
    let city, state, country: String?
    let postcode: Postcode?
    let coordinates: Coordinates?
    let timezone: Timezone?

    init(street: Street?, city: String?, state: String?, country: String?, postcode: Postcode?, coordinates: Coordinates?, timezone: Timezone?) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.coordinates = coordinates
        self.timezone = timezone
    }
}

// MARK: - Coordinates
class Coordinates: Codable {
    let latitude, longitude: String?

    init(latitude: String?, longitude: String?) {
        self.latitude = latitude
        self.longitude = longitude
    }
}

enum Postcode: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Postcode"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// MARK: - Street
class Street: Codable {
    let number: Int?
    let name: String?

    init(number: Int?, name: String?) {
        self.number = number
        self.name = name
    }
}

// MARK: - Timezone
class Timezone: Codable {
    let offset, timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }

    init(offset: String?, timezoneDescription: String?) {
        self.offset = offset
        self.timezoneDescription = timezoneDescription
    }
}

// MARK: - Login
class Login: Codable {
    let uuid, username, password, salt: String?
    let md5, sha1, sha256: String?

    init(uuid: String?, username: String?, password: String?, salt: String?, md5: String?, sha1: String?, sha256: String?) {
        self.uuid = uuid
        self.username = username
        self.password = password
        self.salt = salt
        self.md5 = md5
        self.sha1 = sha1
        self.sha256 = sha256
    }
}

// MARK: - Name
class Name: Codable {
    let title, first, last: String?

    init(title: String?, first: String?, last: String?) {
        self.title = title
        self.first = first
        self.last = last
    }
}

// MARK: - Picture
class Picture: Codable {
    let large, medium, thumbnail: String?

    init(large: String?, medium: String?, thumbnail: String?) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
