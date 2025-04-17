protocol AuthCoordinatorProtocol: Coordinator {
    func authenticationDidComplete()
}

protocol AuthCoordinatorDelegate: AnyObject {
    /// Вызывается, когда завершается авторизация
    func completed(_ coordinator: AuthCoordinatorProtocol)
}
