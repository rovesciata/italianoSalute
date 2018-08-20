//
//  ViewController.swift
//  italianoSalute
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVSpeechSynthesizerDelegate {
    @IBOutlet weak var italian: UILabel!
    @IBOutlet weak var japanese: UILabel!
    @IBOutlet weak var button: UIButton!
    
    // 50回練習(タップ)したらピザボタン発生のカウント数
    var count = 0
    
    var addBtn = UIButton()
//    let addBtn = UIButton(frame: CGRect(x: self.view.bounds.width - 70, y: self.view.bounds.height - 150, width: 55, height:55))

    @IBAction func buttonTapped(sender: UIButton) {
        let speechSynthesizer = AVSpeechSynthesizer()
        speechSynthesizer.delegate = self
        
        var speakingText = ""
        
        count += 1
        
        let rand = arc4random() % 14
        switch rand {
        case 0:
            speakingText = "Un cappuccino, per favore."
            italian.text = "Un cappuccino, per favore.\n\nウン カプチーノ、ペルファボーレ"
            japanese.text = "カプチーノを１つください。"
        case 1:
            speakingText = "Grazie."
            italian.text = "Grazie.\n\nグラッツェ"
            japanese.text = "ありがとう"
            
        case 2:
            speakingText = "Da dove vieni?"
            italian.text = "Da dove vieni?\n\nダ ドヴェ ヴィエーニ?"
            japanese.text = "出身はどちらですか？"
            
        case 3:
            speakingText = "Piacere. Mi chiamo Maria. Ho 20anni. Sono di Firenze."
            italian.text = "Piacere. Mi chiamo Maria. Ho 20anni. Sono di Firenze."
            japanese.text = "はじめまして。私の名前はマリアです。\n\n20歳で、フィレンツェ出身です。"
            
        case 4:
            speakingText = "Come stai?"
            italian.text = "Come stai?\n\nコメ スターイ?"
            japanese.text = "お元気ですか？"
            
            
        case 5:
            speakingText = "Piacere."
            italian.text = "Piacere.\n\nピアチェーレ"
            japanese.text = "はじめまして。"
            
        case 6:
            speakingText = "Prego."
            italian.text = "Prego.\n\nプレーゴ"
            japanese.text = "1.どういたしまして。2.どうぞ。"
            
        case 7:
            speakingText = "Mi chiamo Makoto"
            italian.text = "Mi chiamo Makoto.\n\nミキアーモ マコト"
            japanese.text = "私の名前はマコトです。"
            
        case 8:
            speakingText = "Prego."
            italian.text = "Prego.\n\nプレーゴ"
            japanese.text = "1.どういたしまして。2.どうぞ。"
            
        case 9:
            speakingText = "Sono giapponese."
            italian.text = "Sono giapponese.\n\nソノ ジャポネーゼ"
            japanese.text = "私は日本人です。"
            
            
        case 10:
            speakingText = "Sto bene, grazie. E tu?"
            italian.text = "Sto bene, grazie. E tu?\n\nスト　ベーネ、グラッツェ。エ　トゥ?"
            japanese.text = "私は元気です、ありがとう。あなたは？"
            
        case 11:
            speakingText = "Scusi."
            italian.text = "Scusi.\n\nスクージ"
            japanese.text = "すいません。"
            
        case 12:
            speakingText = "Come?"
            italian.text = "Come?\n\nコーメ?"
            japanese.text = "何ですか？(聞き返す時)"
            
            
        default:
            speakingText = "Buongiorno"
            italian.text = "Buongiorno.\n\nボンジョルノ"
            japanese.text = "おはようございます。"
        }
        
        let utterrance = AVSpeechUtterance(string: speakingText)
        utterrance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        utterrance.volume = 1.0
        speechSynthesizer.speak(utterrance)
        
//        giapponese.isHidden = true
        
        italian.transform = CGAffineTransform(translationX: 0, y: -300)
        UIView.animate(withDuration: 0.5) {
            self.italian.transform = CGAffineTransform.identity
        }
        // 50回練習したらピザボタンが表示
        if count >= 50 {
            addBtn.isHidden = false
        }
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        button.isHidden = false

    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.layer.cornerRadius = button.frame.height/2
        button.layer.borderColor = UIColor(red: 0.3, green: 1, blue: 0.3, alpha: 1).cgColor
        button.layer.borderWidth = 10
        button.layer.shadowOpacity = 0.5
        button.layer.shadowOffset = CGSize(width: 0, height: 5)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 画面遷移ボタン
        addBtn.frame = CGRect(x: self.view.bounds.width - 90, y: self.view.bounds.height - 120, width: 80, height:40)
        addBtn.isHidden = true
        addBtn.setTitle("ランチ♪", for: UIControlState())
        addBtn.titleLabel!.font = UIFont(name: "Helvetica", size: 15)
        addBtn.setTitleColor(.white, for: UIControlState())
        addBtn.backgroundColor = .orange
        addBtn.layer.cornerRadius = 5.0
        addBtn.addTarget(self, action: #selector(onClick(_:)), for: .touchUpInside)
        self.view.addSubview(addBtn)
//        addBtn.layer.shadowOpacity = 0.5
//        addBtn.layer.shadowOffset = CGSize(width: 0, height: 5)
        addBtn.layer.borderWidth = 1
        addBtn.layer.borderColor = UIColor.white.cgColor
    
        
    }
    
    // ピザボタンの処理
    @objc func onClick(_: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let SecondController = storyboard.instantiateViewController(withIdentifier: "Insert")
        present(SecondController, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

