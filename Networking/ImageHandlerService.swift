//
//  ImageHandlerService.swift
//  SwiftApp
//
//  Created by Divjyot Singh on 20/2/19.
//  Copyright © 2019 Divjyot Singh. All rights reserved.
//

import UIKit
import Alamofire

class ImageHandlerService: NSObject {
    let _basicHeader = "XYZ"
    func uploadImage(selectedImage: UIImage){
        guard var imageData = selectedImage.jpegData(compressionQuality: 0.5) else{
            print("Could nnot get JPEG rep.")
            return
        }
        
        Alamofire.upload(multipartFormData: { multipartFormData in
                                                multipartFormData.append(imageData,
                                                                        withName: "imagefile",
                                                                        fileName: "image.jpg",
                                                                        mimeType: "image/jpeg")
                                            },
                         to: "http://api.imagga.com/v1/content",
                         headers: ["Authorization": "Basic " + _basicHeader],
                         encodingCompletion: { encodingResult in
        })
    }
}
