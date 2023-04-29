
import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let homeVC = HomeViewController()
        let searchVC = SearchViewController()
        let libraryVC = LibraryViewController()
        
        homeVC.title = "Browse"
        searchVC.title = "Search"
        libraryVC.title = "Library"
        
        homeVC.navigationItem.largeTitleDisplayMode = .always
        searchVC.navigationItem.largeTitleDisplayMode = .always
        libraryVC.navigationItem.largeTitleDisplayMode = .always
        
        let navHome = UINavigationController(rootViewController: homeVC)
        let navSearch = UINavigationController(rootViewController: searchVC)
        let navLibrary = UINavigationController(rootViewController: libraryVC)
        
        navHome.navigationBar.tintColor = .label
        navSearch.navigationBar.tintColor = .label
        navLibrary.navigationBar.tintColor = .label
        
        navHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        navSearch.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        navLibrary.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 1)
        
        navHome.navigationBar.prefersLargeTitles = true
        navSearch.navigationBar.prefersLargeTitles = true
        navLibrary.navigationBar.prefersLargeTitles = true
        
        setViewControllers([navHome,navSearch,navLibrary], animated: false)
    }
    

    

}
