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
    @IBOutlet weak var resumeStopBtn: UIButton!
    
    // 画像名List
    let img: [String] = ["img001_640x427.jpeg", "img002_640x427.jpeg", "img003_640x360.jpeg"]
    // 表示中の画像配列index
    var choiceImgNumber:Int = 0
    // タイマー変数
    var timer: Timer!
    // タイマー時間
    var timer_sec: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 初期画像設定
        let initImage = UIImage(named: img[choiceImgNumber])
        slideImage.image = initImage
    }
    
    @objc func updateTimer(_ timer: Timer) {
        if timer_sec % 2 == 0 {
            calcChoiceNumber(calcNum: 1)
            let showImage = UIImage(named: img[choiceImgNumber])
            slideImage.image = showImage
        }
        self.timer_sec += 1
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
        
        if self.timer == nil {
            // アニメーション開始時のボタン設定
            nextBtn.isEnabled = false
            backBtn.isEnabled = false
            resumeStopBtn.setTitle("停止", for: UIControl.State.normal)
            
            // スライドショーおよびタイマー起動
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        } else {
            // アニメーション停止時のボタン設定
            nextBtn.isEnabled = true
            backBtn.isEnabled = true
            resumeStopBtn.setTitle("再生", for: UIControl.State.normal)

            // タイマー停止およびリセット
            self.timer.invalidate()
            self.timer = nil
            self.timer_sec = 0
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // segueから遷移先のEnlargedImageViewControllerを取得する
            let enlargedImageController:EnlargedImageViewController = segue.destination as! EnlargedImageViewController
        enlargedImageController.dispImg = slideImage.image
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
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

