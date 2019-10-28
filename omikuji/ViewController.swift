//
//  ViewController.swift
//  omikuji
//
//  Created by Kobayashi Yako on 2017/11/02.
//  Copyright © 2017年 Step App School. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    var speak:AVSpeechSynthesizer = AVSpeechSynthesizer()

    @IBOutlet var labelJudge: UILabel!
    @IBOutlet var tvAdvice: UITextView!
    
    //ラベルの運勢の選択肢
    let fortune = ["大吉","中吉","吉","小吉","末吉"]
    
    //おみくじのアドバイス「いつ、何は、どうなる、ラッキーアイテム」を配列で定義する
    let whenArray = ["近い将来","これから1時間後","還暦過ぎて","お腹が減った時に","気がついた時には"]
    let whoArray = ["あなたは","大切な人は","家の中では","スマホによって","仕事の面で"]
    let becomeArray = ["満たされた気持ちになります","何かがあふれます","運命の大逆転","いろいろと見つかります","三歩進んで二歩下がります"]
    let luckyArray = ["ポケットティッシュ","友達からのプレゼント","エラーの出るアプリ","見た目が微妙なぬいぐるみ","巨大なもの"]

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   
    //おみくじボタンを押した時のアクション
    @IBAction func tapButton(_ sender: Any) {
        //ランダムに選んだ運勢をテキストに出力
        labelJudge.text = fortune.randomElement()!

        
        //アドバイスの言葉を配列からランダムに選ぶ
        let when = whenArray.randomElement()!
        let who = whoArray.randomElement()!
        let become = becomeArray.randomElement()!
        let lucky = luckyArray.randomElement()!

        //アドバイスの文章を生成する
        let strAdvice:String = String(format:"%@、%@%@。ラッキーアイテムは%@。",when,who,become,lucky)
        
        //生成した文章をテキストビューに出力
        tvAdvice.text = strAdvice
        
        
        //スピーチ機能を呼び出す
        if let divine = labelJudge.text {
            let content = AVSpeechUtterance(string: divine + "、" + strAdvice)
            content.voice = AVSpeechSynthesisVoice(language: "ja-JP")
            self.speak.speak(content)
        }
    }
}



