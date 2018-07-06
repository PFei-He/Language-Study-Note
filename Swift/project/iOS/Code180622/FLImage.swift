//
//  File.swift
//  OcO
//
//  Created by Fay on 2018/6/22.
//

import UIKit

public extension UIImage {
    /**
     去除图片方向
     - Parameters:
        - image: 原始图片
     - Returns: 修改后的图片
     */
    func removeRotationForImage(image: UIImage) -> UIImage {
        if image.imageOrientation == UIImageOrientation.up {
            return image
        }
        
        UIGraphicsBeginImageContextWithOptions(image.size, false, image.scale)
        image.draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: image.size))
        let normalizedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return normalizedImage
    }
}
