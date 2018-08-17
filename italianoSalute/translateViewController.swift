//
//  translateViewController.swift
//  italianoSalute
//

import UIKit
import AVFoundation

class translateViewController: UIViewController, AVSpeechSynthesizerDelegate, UITextViewDelegate {
    
    @IBOutlet weak var girlComment: UILabel!
    @IBOutlet weak var yakuSentence: UITextView!
    
    //SpeechSynthesizerクラス
    var talker = AVSpeechSynthesizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タップしたらキーボードが消える
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(translateViewController.tapGesture(_:)))
        self.view.addGestureRecognizer(tapRecognizer)
        
        yakuSentence.delegate = self
        

        //Delegate設定した時のみ以下を書く
        self.talker.delegate = self
        
        // 詳細記入欄
        yakuSentence.layer.cornerRadius = 10
        yakuSentence.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1).cgColor
        yakuSentence.layer.borderWidth = 3
//        yakuSentence.font = UIFont(name: "Italic", size: 20)
        
        girlComment.layer.cornerRadius = 5
        girlComment.layer.borderColor = UIColor.white.cgColor
        girlComment.layer.borderWidth = 1.0
        
        // キャンセルボタン
        let backBtn = UIButton(frame: CGRect(x: 10, y: self.view.bounds.height - 70, width: 150, height: 40))
        backBtn.setTitle("教室へ戻る", for: UIControlState())
        backBtn.setTitleColor(.white, for: UIControlState())
        backBtn.backgroundColor = .orange
        backBtn.layer.cornerRadius = 5.0
        backBtn.layer.borderColor = UIColor.white.cgColor
        backBtn.layer.borderWidth = 1.0
        backBtn.addTarget(self, action: #selector(onbackClick(_:)), for: .touchUpInside)
        view.addSubview(backBtn)
}

    //画面遷移(教室へ戻る)
    @objc func onbackClick(_: UIButton) {
        dismiss(animated: true, completion: nil)
    }
        
    
    //tapToRead(button)で読み上げ
    @IBAction func tspToRead(_ sender: UIButton) {
    
    
    
        
        var talker = AVSpeechSynthesizer()
        
        let utterance = AVSpeechUtterance(string:self.yakuSentence.text!)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT") //イタリア語を読みます
        //日本語の場合は"ja-JP"
        
        // 話す速度を設定（0.0〜1.0）
        utterance.rate = 0.5
        
        // 声の高さを設定（0.5〜2.0）
        utterance.pitchMultiplier = 1.0
        
        //読み上げ
        self.talker.speak(utterance)
        
        
    }
    
    //読み上げ開始
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didStartSpeechUtterance utterance: AVSpeechUtterance!)
    {
        print("開始")
    }
    
    //終了
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, didFinishSpeechUtterance utterance: AVSpeechUtterance!)
    {
        print("終了")
    }
    
    //読み上げ中の言葉を取得
    func speechSynthesizer(synthesizer: AVSpeechSynthesizer!, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance!)
    {
        let word = (utterance.speechString as NSString).substring(with: characterRange)
        print("Speech: \(word)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // タップしたらキーボードが消える
    @objc func tapGesture(_ sender: UITapGestureRecognizer) {
        yakuSentence.resignFirstResponder()
    }
    


}
