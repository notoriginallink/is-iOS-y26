import UIKit

protocol ConfigurableView{
    associatedtype ViewModel: Identifiable where ViewModel.ID == Int
    
    func configure(with viewModel: ViewModel)
}
