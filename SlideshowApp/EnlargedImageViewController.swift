//
//  EnlargedImageViewController.swift
//  SlideshowApp
//
//  Created by 志村　圭 on 2021/07/20.
//

import UIKit

class EnlargedImageViewController: UIViewController {
    
    @IBOutlet weak var enlargedImage: UIImageView!
    
    var dispImg:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        enlargedImage.image = dispImg
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
