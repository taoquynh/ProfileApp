//
//  Extension+UIImageView.swift
//  ProfileApp
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(urlString: String){
        var string = ""
        if urlString.starts(with: "http") {
            string = urlString
        }else{
            string = ApiNameManager.shared.domain + urlString
        }
        
        let url = URL(string: string)
        self.kf.indicatorType = .activity
        self.kf.setImage(with: url)
    }
}
