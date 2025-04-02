import Foundation

/// Ошибки авторизации
enum AuthError: LocalizedError {
    case emptyUsername
    case emptyPassword
    case badFormatUsername(_ msg: String)
    case badFormatPassword(_ msg: String)
    
    var errorDescription: String? {
        switch self {
        case .emptyUsername:
            return "Введите имя пользователя"
        case .emptyPassword:
            return "Введите пароль"
        case .badFormatUsername(let msg):
            return msg
        case .badFormatPassword(let msg):
            return msg
        }
    }
}
