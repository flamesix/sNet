//
//  WebViewLoginViewController.swift
//  sNet
//
//  Created by Юрий Гриневич on 14.06.2022.
//

import UIKit
import WebKit
import Alamofire

class WebViewLoginViewController: UIViewController {
    
    let session = Session.instance
    let network = NetworkService()
    var friends = [Friends]()
    var tokenString: String = "" {
        didSet {
            session.token = tokenString
            performSegue(withIdentifier: PropertyKeys.webViewSegue, sender: nil)
        }
    }
    
    @IBOutlet weak var webview: WKWebView! {
        didSet {
            webview.navigationDelegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        network.getInfoWithURLSession(for: session.userID, info: .groupsList)
        //
                webview.load(getTokenURLRequest())
        //
        //        network.getInfo(for: 123733, info: .friendList)
//        network.getInfo(for: 123733, info: .friendList) { [weak self] friendsArray in
//            self?.friends = friendsArray
//        }
        //
//        print(friends)
        
        //        network.getInfo(for: session.userID, info: .photosList)
        //        network.getInfo(for: session.userID, info: .groupsList)
        //        network.getInfo(for: session.userID, info: .groupSearch, search: "Behind the mirror")
        
//        performSegue(withIdentifier: PropertyKeys.webViewSegue, sender: nil)
        
    }
    
    ///Getting access token
    private func getTokenURLRequest() -> URLRequest {
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "8193655"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        return request
    }
}

// MARK: - WKNavigationDelegate

extension WebViewLoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse:
                 WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url,
              url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        
        let token = params["access_token"]
      //  print(token!)
        tokenString = token!
        decisionHandler(.cancel)
    }
}
