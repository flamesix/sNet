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
    
    let defaults = UserDefaults.standard
    let session = Session.instance
    let network = NetworkService()
    var friends = [Friends]()
    var responseUserID: Int = 0 {
        didSet {
            session.userID = responseUserID
        }
    }
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
        
        let tokenTimeGetted = Int(defaults.integer(forKey: "getTokenTime"))
        let currentTime = Int(Date().timeIntervalSince1970)

        if currentTime - tokenTimeGetted < 86400 {

        let unixtime = Date().timeIntervalSince1970
        defaults.set(Int(unixtime), forKey: "getTokenTime")

                webview.load(getTokenURLRequest())
        } else {
            guard let token = defaults.string(forKey: "token") else { return }
            tokenString = token
            print(tokenString)
        }
       
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
            URLQueryItem(name: "scope", value: "270342"),
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
        let userID = params["user_id"]
//        let expiring = params["expires_in"]
        responseUserID = Int(userID ?? "0")!
        tokenString = token!
        defaults.set(token!, forKey: "token")
       // print("Token is: \(token)")
        decisionHandler(.cancel)
    }
}
