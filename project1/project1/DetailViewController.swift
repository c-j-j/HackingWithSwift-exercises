//
//  DetailViewController.swift
//  project1
//
//  Created by Chris Jordan on 08/06/2016.
//  Copyright © 2016 Chris Jordan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedImageFilePath: String? {
        didSet {
            self.configureView()
        }
    }

    @IBOutlet weak var detailImageView: UIImageView!
    
    func configureView() {
        // Update the user interface for the detail item.
        if let selectedImage = selectedImageFilePath {
            if let imageView = detailImageView {
                imageView.image = UIImage(named: selectedImage)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        title = selectedImageFilePath
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

