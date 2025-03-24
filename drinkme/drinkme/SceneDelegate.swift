import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = .init(windowScene: scene)
        
        let viewController = CocktailCardViewController(viewModel: CocktailViewModel.createExample())
        
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
}

