import Alamofire
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchUsers(page: Int, count: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let url = K.API.usersURL(page: page, count: count)
        AF.request(url).responseDecodable(of: UsersResponse.self) { response in
            switch response.result {
            case .success(let response):
                completion(.success(response.users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func fetchPositions() {
        print(K.API.positionsURL)
        AF.request(K.API.positionsURL).responseDecodable(of: PositionResponse.self) { response in
            print(response.result)
        }
    }
}
