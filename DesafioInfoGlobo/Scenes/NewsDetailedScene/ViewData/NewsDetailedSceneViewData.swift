//
//  NewsDetailedSceneViewData.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/17/20.
//

import UIKit
import Kingfisher

protocol NewsDetailedSceneItemType {
    var editorialName: String { get }
    var title: String { get }
    var subtitle: String { get }
    var authors: String { get }
    var publishedIn: String { get }
    var image: UIImage { get}
    var imageSubtitle: String { get }
    var imageSource: String { get }
    var newsText: String { get }
}

struct NewsDetailedSceneViewData {
    
    //MARK: - Properties
    private let model: NewsDetailedModel
    
    init(model: NewsDetailedModel) {
        self.model = model
    }
    
   private func downloadImage(urlString : String) -> UIImage? {
        guard let url = URL(string: urlString) else { return UIImage() }
        let resource = ImageResource(downloadURL: url)
        var convertedImage: UIImage?
        
        KingfisherManager.shared.retrieveImage(with: resource, options: nil, progressBlock: nil) { result in
            convertedImage = try? result.get().image
        }
        return convertedImage
    }
    
   private func textOverImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 24)!

        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
    
        let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .left
            paragraphStyle.lineBreakMode = .byWordWrapping


        let textFontAttributes = [
            NSAttributedString.Key.font: textFont,
            NSAttributedString.Key.foregroundColor: textColor,
            .paragraphStyle: paragraphStyle
            ] as [NSAttributedString.Key : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))

        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
   }
    
    func displayImageWithText(imageURL: String) -> UIImage {
        let rawImage = downloadImage(urlString: imageURL) ?? UIImage()
        let textOnImage = "\(imageSubtitle). Foto: \(imageSource) "
        
        let imageXPoint = rawImage.size.width/UIScreen.main.bounds.width + 16
        let imageYPoint = rawImage.size.height - 80

        let imageWithText = textOverImage(drawText: textOnImage,
                                        inImage: rawImage,
                                        atPoint: CGPoint(x: imageXPoint,
                                                         y: imageYPoint))
        return imageWithText
    }
}

extension NewsDetailedSceneViewData: NewsDetailedSceneItemType {
    var editorialName: String {
        return model.editorialName ?? ""
    }
    
    var title: String {
        return model.title ?? ""
    }
    
    var subtitle: String {
        return model.subtitle ?? ""
    }
    
    var authors: String {
        let convertToString = model.authors?.joined(separator: ",")
        return "Por: \(convertToString ?? "")" 
    }
    
    var publishedIn: String {
        guard let modelDate = model.publishedIn else { return "" }
        let formatter = DateFormatter()
        let convertToDate = formatter.date(from: modelDate) ?? Date()
        formatter.dateFormat = "dd/mm/yy HH:mm"
        return formatter.string(from: convertToDate)
    }
    
    var image: UIImage {
        let imageURL = model.image?.first?.imageUrl ?? ""
        return displayImageWithText(imageURL: imageURL)
    }
    
    var imageSubtitle: String {
        return model.image?.first?.subtitle ?? ""
    }
    
    var imageSource: String {
        return model.image?.first?.source ?? ""
    }
    
    var newsText: String {
        return model.newsText ?? ""
    }
}
