

import UIKit

class WelcomViewController: UIViewController {
    
    private let singInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Sing In Spotify", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Music"
        view.backgroundColor = .purple
        view.addSubview(singInButton)
        singInButton.addTarget(self, action: #selector(didTapSingIn), for: .touchUpInside)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        singInButton.frame = CGRect(x: 20,
                                    y: view.height-50-view.safeAreaInsets.bottom,
                                    width: view.width-40,
                                    height: 50)
        
    }
    @objc func didTapSingIn(){
        let vc = AuthViewController()
        vc.comletionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    private func handleSignIn(success: Bool){
        //log user in or yell at them for error
        guard success else {
            let alert = UIAlertController(title: "Oops",
                                          message: "Something went wrong",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss",
                                          style: .cancel,
                                         handler: nil))
            present(alert, animated: true)
            return
        }
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }

}
