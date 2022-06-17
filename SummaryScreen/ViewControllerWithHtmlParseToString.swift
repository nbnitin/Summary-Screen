//
//  ViewControllerWithHtmlParseToString.swift
//  SummaryScreen
//
//  Created by Nitin Bhatia on 07/06/22.
//

import UIKit
let CONST_STRING_HTML = "<b><span>Direction:</span></b> <span>Read the following passage and answer the question given below.</span>\n<p><span>When looking at the positions of the seven continents on a map, it's easy to assume that they are fixed. For centuries, human beings have fought wars and made peace over their share of these territories, on the assumption that their land – and that of their neighbours – has always been there, and always will be. From the Earth's perspective, however, the continents are leaves drifting across a pond. And human concerns are a raindrop on the leaf's surface. The seven continents were once assembled in a single mass, a supercontinent called Pangaea. And before that, there's evidence for others stretching back over three billion years: Pannotia, Rodinia, Columbia/Nuna, Kenorland and Ur. Geologists know that supercontinents disperse and assemble in cycles: we're halfway through one now.</span></p>\n\n Hello End"
class ViewControllerWithHtmlParseToString: UIViewController {
    @IBOutlet weak var lblTest: UILabel!
    
    @IBOutlet weak var txtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTest.attributedText = CONST_STRING_HTML.htmlAttributedString(size: 15, color: .red, align: "left")
        // Do any additional setup after loading the view.
    }
    

    

}

extension UIColor {
    var hexString:String? {
        var r : CGFloat = 1
        var g : CGFloat = 1
        var b : CGFloat = 1
        
        if let components = self.cgColor.components {
            for (index,items) in components.enumerated() {
                switch index {
                case 0:
                    r = components[0]
                case 1:
                    g = components[1]
                case 3:
                    b = components[2]
                default:
                    break
                }
            }
            return  String(format: "#%02x%02x%02x", (Int)(r * 255), (Int)(g * 255), (Int)(b * 255))
        }
        return nil
    }
}
extension String {
func htmlAttributedString(size: CGFloat, color: UIColor, align: String) -> NSAttributedString? {
    let htmlTemplate = """
        <!doctype html>
        <html>
          <head>
            <style>
              body {
                color: \(color.hexString!);
                font-family: Ubuntu;
                font-size: \(size)px;
                text-align: \(align);
              }
            </style>
          </head>
          <body>
            \(self)
          </body>
        </html>
        """
    
    guard let data = htmlTemplate.data(using: .utf8) else {
        return nil
    }
    
    guard let attributedString = try? NSAttributedString(
        data: data,
        options: [.documentType: NSAttributedString.DocumentType.html,
                  .characterEncoding: String.Encoding.utf8.rawValue],
        documentAttributes: nil
    ) else {
        return nil
    }
    
    return attributedString
}

}
