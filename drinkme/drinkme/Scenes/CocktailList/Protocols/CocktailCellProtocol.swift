/// Протокол для ячейки коктейля
protocol CocktailCellProtocol {
    
    /// Конфигурирует ячейку с помощью ViewModel
    /// - Parameter viewModel: ViewModel для ячейки
    func configure(with viewModel: CocktailCellViewModelProtocol)
}
