import UIKit

final class HapticManager {
    static let shared = HapticManager()
    private init() {}
    
    func vibrateForSelection() {
        let hapticFeedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
        hapticFeedbackGenerator.prepare()
        hapticFeedbackGenerator.impactOccurred()
    }
}
