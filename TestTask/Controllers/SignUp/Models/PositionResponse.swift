struct PositionResponse: Codable {
    let success: Bool
    let positions: [Position]
}

struct Position: Codable {
    let id: Int
    let name: String
}

