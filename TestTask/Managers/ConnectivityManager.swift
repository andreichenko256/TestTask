import Network

final class ConnectivityManager {
    static let shared = ConnectivityManager()
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "ConnectivityMonitor")
    
    private(set) var isConnected: Bool = false

    private init() {
        monitor.pathUpdateHandler = { path in
            self.isConnected = path.status == .satisfied
        }
        monitor.start(queue: queue)
    }
    
    func observeConnectionStatus(_ handler: @escaping (Bool) -> Void) {
        monitor.pathUpdateHandler = { path in
            let connected = path.status == .satisfied
            self.isConnected = connected
            DispatchQueue.main.async {
                handler(connected)
            }
        }
        monitor.start(queue: queue)
    }
}


