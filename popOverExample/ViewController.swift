

import UIKit

class ViewController: UIViewController {

    enum ErrorCodes: Int {
        case notFound = 404, ok = 200, unknown
        
        init?(code: Int) {
            switch code {
            case 404: self = .notFound
            case 200: self = .ok
            default: self = .unknown
            }
        }
    }
    
    
    var popover: UIPopoverPresentationController?

    override func viewDidLoad() {
        super.viewDidLoad()
     
        //UIDocumentInteractionController(url: <#T##URL#>)
    }

    @IBAction func infoButtonClicked(_ sender: Any) {
        
        let btn = sender as! UIButton
        
        let vc = PopoverVC(title: "Hello", description: "Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd Lorem ipsum saltd ", width: self.view.bounds.width, sourceView: btn, popOverDelegate: self)
        self.present(vc, animated: true, completion:{
            vc.view.superview?.layer.cornerRadius = 0
        })
    }
    
}

extension ViewController:UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
}
