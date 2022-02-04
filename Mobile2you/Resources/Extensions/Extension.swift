
import Foundation
import UIKit


extension UIImageView {
    
    func UrlImage(url: String){
        guard let url = URL(string: url) else {
            return
        }
        
        DispatchQueue.global().async { [self] in
            if let Imagedata = try? Data(contentsOf: url) {
                if let image = UIImage(data: Imagedata){
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
        }
    }
}
