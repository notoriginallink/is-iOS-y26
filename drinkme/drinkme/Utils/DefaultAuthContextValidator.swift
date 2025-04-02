class DefaultAuthContextValidator: AuthContextValidator {
    func validate(_ context: AuthContext) -> Result<Void, any Error> {
        if (context.username.isEmpty) {
            return .failure(AuthError.emptyUsername)
        } else if (!context.username.isAlphanumeric) {
            return .failure(AuthError.badFormatPassword("Имя пользователя может содержать только буквы и цифры"))
        } else if (context.password.isEmpty) {
            return .failure(AuthError.emptyPassword)
        } else if (!context.password.isValidLength(leftBound: 6, rigthBound: 20)) {
            return .failure(AuthError.badFormatPassword("Пароль должен содержать не менее 6 и не более 20 символов"))
        } else {
            return .success(())
        }
    }
}
