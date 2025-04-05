import Foundation

/// Моделька для авторизации
struct AuthContext {
    var username = ""
    var password = ""
}

/// Протокол для проверки контекста авторизации на корректность
protocol AuthContextValidator {
    func validate(_ context: AuthContext) -> Result<Void, any Error>
}
