//
//  IconTableViewCell.swift
//  IconTableView
//
//  Created by Mit Amin on 12/24/21.
//

import UIKit

enum PlaceType {
    case burger
    case burrito
    case noodles
    case pizza
}

class IconTableViewCell: UITableViewCell {
    @IBOutlet weak var imageview: UIImageView!
    
    let backView = UIView()
    
    let cellView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 60))
        view.backgroundColor     = UIColor.white
        return view
    }()

    static let identifier = "IconTableViewCell"
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        backView.frame = self.frame
    }
    
    func icon() {
        backView.frame = self.frame
        backView.backgroundColor = .white

        let mask = MaskView(frame: backView.frame)
        backView.mask = mask.createMask()

        self.addSubview(backView)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: identifier, bundle: nil)
    }
}

class MaskView: UIImageView {

    let centralView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let image = UIImage(named: "burger")!

        self.addSubview(self.centralView)
        self.centralView.backgroundColor = .blue // not sure why but I need to do this

        // define position and size of cut out image
        self.centralView.frame = CGRect(x: 8, y: 16, width: 60, height: 60)
        
        // mask icon image to UIImageView
        centralView.mask = UIImageView(image: image)

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        masksView.frame = centralView.bounds
    }


    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createMask() -> UIImageView? {
        self.backgroundColor = .white  // not sure why but I need to do this
        
        let renderer = UIGraphicsImageRenderer(bounds: self.bounds)
        let image = renderer.image { rendererContext in
            self.layer.render(in: rendererContext.cgContext)
        }
        
        guard let ciImage = CIImage(image: image)?.applyingFilter("CIMaskToAlpha") else {
            return nil
        }

        // Create a UIImage
        let maskImage = UIImage(ciImage: ciImage)
        // Create a UIImageView from the UIImage
        let imageView = UIImageView(image: maskImage)
        // Set the bounds
        imageView.frame = self.bounds
        // Return the imageView
        return imageView
    }
}
