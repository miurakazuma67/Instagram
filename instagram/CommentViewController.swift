//
//  CommentViewController.swift
//  instagram
//
//  Created by 三浦　一真 on 2020/09/11.
//  Copyright © 2020 Kazuma Miura. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CommentViewController: UIViewController {
    var postData: PostData!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
    }
    
    
 
    @IBOutlet weak var commentTextField: UITextField!
    
  
    @IBAction func sendButton(_ sender: Any) {
    print("sendButtonメソッドが呼ばれた")
        // 投稿データの保存場所を定義する
        let postRef = Firestore.firestore().collection(Const.PostPath).document(postData.id)
        // HUDで投稿処理中の表示を開始
        SVProgressHUD.show()
        // FireStoreに投稿データを保存する
        let name = Auth.auth().currentUser?.displayName
        let commentString = "\(name!):\(self.commentTextField.text!)"
        let updateComments = FieldValue.arrayUnion([commentString])
        
        
        
        postRef.updateData(["comments":updateComments])
        // HUDで投稿完了を表示する
        SVProgressHUD.showSuccess(withStatus: "投稿しました")
        // 投稿処理が完了したので先頭画面に戻る
        UIApplication.shared.windows.first{ $0.isKeyWindow }?.rootViewController?.dismiss(animated: true, completion: nil)
    }
}


/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


