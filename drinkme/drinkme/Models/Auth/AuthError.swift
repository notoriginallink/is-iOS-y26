import Foundation

/// Ошибки авторизации
enum AuthError: LocalizedError {
    case emptyUsername
    case emptyPassword
    case badFormatUsername(_ msg: String)
    case badFormatPassword(_ msg: String)
    case wrongPassword
    case unknownUser
    
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
        case .wrongPassword:
            return "Неверный пароль"
        case .unknownUser:
            return "Пользователь не найден"
        }
    }
}
