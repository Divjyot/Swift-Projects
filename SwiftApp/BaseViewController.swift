//
//  BaseViewController.swift
//  SwiftApp
//
//  Created by Divjyot Singh on 20/2/19.
//  Copyright © 2019 Divjyot Singh. All rights reserved.
//

import UIKit
import Alamofire

enum StartButtonState {
    case SelectPhoto
    case UploadPhoto
}
class BaseViewController: UIViewController {
    
    var buttonStateToggle: StartButtonState
    var imageHandlerService : ImageHandlerService
    
    @IBOutlet weak var startAndDetectButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonStateToggle = StartButtonState.SelectPhoto
        startAndDetectButton.setTitle("Start", for: UIControl.State.normal)
        
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
       
        switch buttonStateToggle {
            
        case StartButtonState.SelectPhoto :
        let pickerVC = storyboard?.instantiateViewController(withIdentifier: "photoPickerVC") as! ViewController
        pickerVC.baseVCDelegate = self
        present(pickerVC, animated: true, completion: nil)
        
        case StartButtonState.UploadPhoto :
            imageHandlerService.uploadImage(selectedImage: imageView.image!)
    }
   
    }
}

extension BaseViewController : showSelectedImageDelegate{
    
    func showImageInView(selectedImage: UIImage) {
        
        imageView.frame = CGRect.init(x: 165, y: 246, width: 300, height: 200)
        imageView.image = selectedImage
        buttonStateToggle = StartButtonState.UploadPhoto
        startAndDetectButton.setTitle("Upload", for: UIControl.State.normal)
    }
    

}
