/// Основной координатор приложения
protocol AppCoordinatorProtocol: Coordinator {
    /// Показывает экран авторизации
    func showAuth()
    
    /// Показывает экран списка коктейлей
    func showCocktailList()
    
    /// Выполняет выход из системы
    func logout()
}
