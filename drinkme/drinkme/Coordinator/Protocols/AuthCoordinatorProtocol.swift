protocol AuthCoordinatorProtocol: Coordinator {
    func authenticationDidComplete()
}

protocol AuthCoordinatorDelegate: AnyObject {
    func completed(_ coordinator: AuthCoordinatorProtocol)
}
