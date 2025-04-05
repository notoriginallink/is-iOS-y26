/// Координатор для карточки коктейля
protocol CardCoordinatorProtocol: Coordinator {
    func backToList()
}


protocol CardCoordinatorDelegate: AnyObject {
    func completed(_ coordinator: CardCoordinatorProtocol)
}
