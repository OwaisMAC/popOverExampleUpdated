//
//  PopoverView.swift
//  popOverExample
//
//  Copyright © 2019 Bajaj, Mahesh Kumar (Cognizant). All rights reserved.
//

import UIKit

class PopoverVC: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    convenience init(title:String, description:String, width:CGFloat, sourceView:UIView, popOverDelegate:UIPopoverPresentationControllerDelegate) {
        
        let nibNameString = "PopoverVC"
        self.init(nibName: nibNameString, bundle: Bundle.main)
        self.setup(title:title, description:description, width:width, sourceView:sourceView, popOverDelegate:popOverDelegate)
        
        
    }
    
    func setup(title:String, description:String, width:CGFloat, sourceView:UIView, popOverDelegate:UIPopoverPresentationControllerDelegate){
        
        let titleFont = UIFont.boldSystemFont(ofSize: 25.0)
        let descriptionFont = UIFont.systemFont(ofSize: 17.0)
        
        //Top and bottom constraint offset
        let verticalOffSet:CGFloat = 30
        //Leading and trailing constraint offset
        let horizontalOffSet:CGFloat = 20
        
        let heightOftitle = title.height(withConstrainedWidth: width-horizontalOffSet, font: titleFont)
        let heightOfdescription = description.height(withConstrainedWidth: width-horizontalOffSet, font: descriptionFont)
        
        let height = heightOftitle+heightOfdescription+verticalOffSet
        self.view.bounds = CGRect(x: 0.0, y: 0.0, width: 394, height: height)
        self.modalPresentationStyle = .popover
        self.preferredContentSize = CGSize(width: 394, height: 373)
        
        preferredContentSize = self.view.systemLayoutSizeFitting(
                    CGSize(width: width-horizontalOffSet, height: height),
                    withHorizontalFittingPriority: .required,
                    verticalFittingPriority: .fittingSizeLevel
                )
        
        let presentationController = self.presentationController as! UIPopoverPresentationController
        presentationController.sourceView = sourceView
        presentationController.sourceRect = sourceView.bounds
        presentationController.permittedArrowDirections = .any
        presentationController.delegate = popOverDelegate
        
        //self.titleLabel.font = titleFont
        //self.descriptionLabel.font = descriptionFont
        //self.titleLabel.text = title
        //self.descriptionLabel.text = description
        
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension String{
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
}
