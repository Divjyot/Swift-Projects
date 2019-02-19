//
//  ViewController.swift
//  SwiftApp
//
//  Created by Divjyot Singh on 19/2/19.
//  Copyright © 2019 Divjyot Singh. All rights reserved.
//

import UIKit
protocol showSelectedImageDelegate {
    func showImageInView(selectedImage: UIImage)
}

class ViewController: UIViewController {

    var baseVCDelegate : showSelectedImageDelegate!
    var tempFrame : CGRect!
    
    @IBOutlet weak var chooseLibPhotoButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     }

    @IBAction func chooseLibPhoto(_ sender: Any) {
    
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.savedPhotosAlbum){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    

}

extension ViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            baseVCDelegate.showImageInView(selectedImage: pickedImage)
        }
        picker.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true
            , completion: nil)
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        
    }
}
