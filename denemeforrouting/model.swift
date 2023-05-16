// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let authenticationResultCode: String?
    let brandLogoURI: String?
    let copyright: String?
    let resourceSets: [ResourceSet]?
    let statusCode: Int?
    let statusDescription, traceID: String?

    enum CodingKeys: String, CodingKey {
        case authenticationResultCode
        case brandLogoURI
        case copyright, resourceSets, statusCode, statusDescription
        case traceID
    }
}

// MARK: - ResourceSet
struct ResourceSet: Codable {
    let estimatedTotal: Int?
    let resources: [Resource]?
}

// MARK: - Resource
struct Resource: Codable {
    let type: String?
    let bbox: [Double]?
    let id, distanceUnit, durationUnit: String?
    let routeLegs: [RouteLeg]?
    let trafficCongestion, trafficDataUsed: String?
    let travelDistance: Double?
    let travelDuration, travelDurationTraffic: Int?
    let waypointsOrder: [String]?

    enum CodingKeys: String, CodingKey {
        case type
        case bbox, id, distanceUnit, durationUnit, routeLegs, trafficCongestion, trafficDataUsed, travelDistance, travelDuration, travelDurationTraffic, waypointsOrder
    }
}

// MARK: - RouteLeg
struct RouteLeg: Codable {
    let actualEnd, actualStart: ActualEnd?
    let alternateVias: [JSONAny]?
    let cost: Int?
    let description: String?
    let endLocation: Location?
    let itineraryItems: [ItineraryItem]?
    let routeRegion: String?
    let routeSubLegs: [RouteSubLeg]?
    let startLocation: Location?
    let travelDistance: Double?
    let travelDuration: Int?
}

// MARK: - ActualEnd
struct ActualEnd: Codable {
    let type: TypeEnum?
    let coordinates: [Double]?
}

enum TypeEnum: String, Codable {
    case point = "Point"
}

// MARK: - Location
struct Location: Codable {
    let bbox: [Double]?
    let name: String?
    let point: ActualEnd?
    let address: Address?
    let confidence, entityType: String?
    let geocodePoints: [GeocodePoint]?
    let matchCodes: [String]?
}

// MARK: - Address
struct Address: Codable {
    let addressLine, adminDistrict, adminDistrict2, countryRegion: String?
    let formattedAddress, locality, postalCode: String?
}

// MARK: - GeocodePoint
struct GeocodePoint: Codable {
    let type: TypeEnum?
    let coordinates: [Double]?
    let calculationMethod: CalculationMethod?
    let usageTypes: [UsageType]?
}

enum CalculationMethod: String, Codable {
    case interpolation = "Interpolation"
    case interpolationOffset = "InterpolationOffset"
    case rooftop = "Rooftop"
}

enum UsageType: String, Codable {
    case display = "Display"
    case route = "Route"
}

// MARK: - ItineraryItem
struct ItineraryItem: Codable {
    let compassDirection: String?
    let details: [Detail]?
    let exit: Exit?
    let iconType: IconType?
    let instruction: Instruction?
    let isRealTimeTransit: Bool?
    let maneuverPoint: ActualEnd?
    let realTimeTransitDelay: Int?
    let sideOfStreet: SideOfStreet?
    let tollZone, towardsRoadName, transitTerminus: String?
    let travelDistance: Double?
    let travelDuration: Int?
    let travelMode: Mode?
    let hints: [Hint]?
    let warnings: [Warning]?
    let signs: [String]?
}

// MARK: - Detail
struct Detail: Codable {
    let compassDegrees: Int?
    let endPathIndices: [Int]?
    let maneuverType: String?
    let mode: Mode?
    let names: [String]?
    let roadType: RoadType?
    let startPathIndices: [Int]?
    let locationCodes: [String]?
    let roadShieldRequestParameters: RoadShieldRequestParameters?
}

enum Mode: String, Codable {
    case driving = "Driving"
}

// MARK: - RoadShieldRequestParameters
struct RoadShieldRequestParameters: Codable {
    let bucket: Int?
    let shields: [Shield]?
}

// MARK: - Shield
struct Shield: Codable {
    let labels: [String]?
    let roadShieldType: Int?
}

enum RoadType: String, Codable {
    case arterial = "Arterial"
    case limitedAccessHighway = "LimitedAccessHighway"
    case majorRoad = "MajorRoad"
    case ramp = "Ramp"
    case street = "Street"
}

enum Exit: String, Codable {
    case empty = ""
    case the168B = "168B"
}

// MARK: - Hint
struct Hint: Codable {
    let hintType, text: String?
}

enum IconType: String, Codable {
    case auto = "Auto"
}

// MARK: - Instruction
struct Instruction: Codable {
    let formattedText: JSONNull?
    let maneuverType, text: String?
}

enum SideOfStreet: String, Codable {
    case unknown = "Unknown"
}

// MARK: - Warning
struct Warning: Codable {
    let origin, severity, text, to: String?
    let warningType: String?
}

// MARK: - RouteSubLeg
struct RouteSubLeg: Codable {
    let endWaypoint, startWaypoint: Waypoint?
    let travelDistance: Double?
    let travelDuration: Int?
}

// MARK: - Waypoint
struct Waypoint: Codable {
    let type: TypeEnum?
    let coordinates: [Double]?
    let description: String?
    let isVia: Bool?
    let locationIdentifier: String?
    let routePathIndex: Int?
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
