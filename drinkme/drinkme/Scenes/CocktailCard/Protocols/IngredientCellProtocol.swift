/// Протокол для ячейки ингредиента
protocol IngredientCellProtocol {
    /// Конфигурирует ячейку ингредиента
    /// - Parameters:
    ///   - name: Название ингредиента
    ///   - measure: Количество ингредиента
    func configure(name: String, measure: String)
}
