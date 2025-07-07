import Alamofire
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    func fetchUsers(page: Int, count: Int, completion: @escaping (Result<[User], Error>) -> Void) {
        let url = K.API.usersURL(page: page, count: count)
        print("Requesting URL: \(url)")
        AF.request(url).responseDecodable(of: UsersResponse.self) { response in
            switch response.result {
            case .success(let response):
                completion(.success(response.users))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
