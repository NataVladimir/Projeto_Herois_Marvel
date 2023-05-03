//
//  WebViewModel.swift
//  ProjComicsMarvel
//
//  Created by test on 18/04/23.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    
    let webView = WKWebView()
    var backButton: UIButton!
    var heroURLP: String?
    var heroUrlS: String?
    var loadingIndicator: UIActivityIndicatorView!
    
    
    override func loadView() {
        super.loadView()
        
        // web View
        view.addSubview(self.webView)
        webView.navigationDelegate = self
        
        //botão de voltar
        backButton = UIButton(type: .system)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        view.addSubview(backButton)
        
        //  Ativar constraints WKWebView e do botão de voltar
        webView.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.setUpConstraints()
        
       // Configure the loading indicator
        loadingIndicator = UIActivityIndicatorView(style: .large)
        loadingIndicator.color = .black
        loadingIndicator.startAnimating()
        view.addSubview(loadingIndicator)
        loadingIndicator.center = view.center
        
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: self.view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            backButton.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Carregar a URL na WKWebView
        if heroURLP?.isEmpty == false {
            let url = URL(string: heroURLP ?? "")!
            let request = URLRequest(url: url)
            self.webView.load(request)
        }else{
            let url = URL(string: heroUrlS ?? "")!
            let request = URLRequest(url: url)
            self.webView.load(request)
        }
        
    }
    
    // Método para voltar na navegação da webview
    @objc func goBack() {
        print("Botão precionado")
        if webView.canGoBack {
            webView.goBack()
        }else{
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadingIndicator.stopAnimating()
        print("loading final")
    }
    
}


