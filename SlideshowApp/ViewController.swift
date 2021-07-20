//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 志村　圭 on 2021/07/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slideImage: UIImageView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
    
    // 画像名List
    let img: [String] = ["img001_640x427.jpeg", "img002_640x427.jpeg", "img003_640x360.jpeg"]
    // 表示中の画像配列index
    var choiceImgNumber:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 初期画像設定
        let i = UIImage(named: img[choiceImgNumber])
        slideImage.image = i
    }
    
    @IBAction func next(_ sender: Any) {
        calcChoiceNumber(calcNum:1)
        let initImg = UIImage(named: img[choiceImgNumber])
        slideImage.image = initImg
    }
    
    @IBAction func back(_ sender: Any) {
        calcChoiceNumber(calcNum:-1)
        let initImg = UIImage(named: img[choiceImgNumber])
        slideImage.image = initImg
    }
    
    @IBAction func resumeStop(_ sender: Any) {
        // アニメーションモードがONならOFFにする
        if slideImage.isAnimating == true {
            slideImage.stopAnimating()
            // ボタン押下設定
            nextBtn.isEnabled = true
            backBtn.isEnabled = true
        } else {
            // ボタン押下設定
            nextBtn.isEnabled = false
            backBtn.isEnabled = false

            // アニメーション用画像設定
            calcChoiceNumber(calcNum:1)
            let j = UIImage(named: img[choiceImgNumber])!
            calcChoiceNumber(calcNum:1)
            let k = UIImage(named: img[choiceImgNumber])!
            var imageListArray :Array<UIImage> = []
            imageListArray.append(slideImage.image!)
            imageListArray.append(j)
            imageListArray.append(k)
            // アニメーションセット（間隔：2秒、繰り返し）
            slideImage.animationImages = imageListArray
            slideImage.animationDuration = 2
            // アニメーション開始
            slideImage.startAnimating()
        }
    }
    
    // 関数：画像Index計算
    func calcChoiceNumber(calcNum:Int) {
        // numは+1または-1が入る
        choiceImgNumber += calcNum
        // indexからはみ出てしまう場合はリセットする
        if choiceImgNumber < 0 {
            choiceImgNumber = 2
        } else if choiceImgNumber > 2 {
            choiceImgNumber = 0
        }
    }


}

