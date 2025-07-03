import Foundation

// MARK: - UsersResponse
struct UsersResponse: Codable {
    let success: Bool
    let page, totalPages, totalUsers, count: Int
    let links: Links
    let users: [User]

    enum CodingKeys: String, CodingKey {
        case success, page
        case totalPages = "total_pages"
        case totalUsers = "total_users"
        case count, links, users
    }
}

// MARK: - Links
struct Links: Codable {
    let nextURL: String?
    let prevURL: String?
    
    enum CodingKeys: String, CodingKey {
        case nextURL = "next_url"
        case prevURL = "prev_url"
    }
}

// MARK: - User
struct User: Codable {
    let id: Int
    let name, email, phone, position: String
    let positionID, registrationTimestamp: Int
    let photo: String

    enum CodingKeys: String, CodingKey {
        case id, name, email, phone, position
        case positionID = "position_id"
        case registrationTimestamp = "registration_timestamp"
        case photo
    }
}
