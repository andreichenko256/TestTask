import UIKit

struct K {
    struct API {
        static let baseURL = "https://frontend-test-assignment-api.abz.agency"
        static let usersPath = "/api/v1/users"
        
        static func usersURL(page: Int = 1, count: Int = 6) -> String {
            return "\(baseURL)\(usersPath)?page=\(page)&count=\(count)"
        }
    }
    
    // MARK: - Colors
    struct Colors {
        static let primary = UIColor(red: 244/255, green: 224/255, blue: 65/255, alpha: 1)
        static let secondary = UIColor(red: 0/255, green: 189/255, blue: 211/255, alpha: 1)
        static let background = UIColor.white
        
        // Buttons colors
        static let pressed = UIColor(red: 255/255, green: 199/255, blue: 0/255, alpha: 1)
        static let disabled = UIColor(red: 222/255, green: 222/255, blue: 222/255, alpha: 1)
        
        static let black87 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.87)
        static let black48 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.48)
        
        // TabBar Colors
        static let tabBarBackground = UIColor(red: 248/255, green: 248/255, blue: 248/255, alpha: 1)
        static let black60 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.6)
        
        // Main View Colors
        static let topBarText = UIColor(red: 29/255, green: 27/255, blue: 32/255, alpha: 1)
        
        // Table View Colors
        static let black12 = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.12)
    }
    
    // MARK: - Fonts
    struct Fonts {
        // ! - to make sure the font is there
        static let heading1 = UIFont(name: "Nunito Sans", size: 24)!
        static let body1 = UIFont(name: "Nunito Sans", size: 18)!
        static let body2 = UIFont(name: "Nunito Sans", size: 16)!
        static let body3 = UIFont(name: "Nunito Sans", size: 14)!
    }
    
    
}
