
extension DS {
    /// Основная модель для декодинга из JSON
    struct Model: Decodable {
        /// Тип закодированной модели
        let type: ModelType
        
        /// Параметры для конфигурации  (текст, цвет и т.д.)
        let payload: Payload
        
        /// Вложенные View (Например, для Stack)
        let subviews: [Model]?
        
        // TODO: добавить actions
    }

    /// Тип View
    enum ModelType: String, Decodable {
        case textButton
        case iconButton
        case label
        case stack
        case textInput
    }
}
