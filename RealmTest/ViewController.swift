//
//  ViewController.swift
//  RealmTest
//
//  Created by dit08 on 2019. 5. 29..
//  Copyright © 2019년 dit. All rights reserved.
//

import UIKit
import RealmSwift

class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var ageLabel: UITextField!
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(NSHomeDirectory())
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func saveValue(_ sender: Any) {
        let person = Person()
        
        person.name = nameLabel.text!
        person.age = Int(ageLabel.text!)!
        //db저장
        let realm = try! Realm()
        try! realm.write {
            realm.add(person)
        }
        
        nameLabel.text = ""
        ageLabel.text = ""
        
    
    }
    @IBAction func deleteValue(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            realm.deleteAll()
        }
        
        resultTextView.text = ""
    }
    @IBAction func getValue(_ sender: Any) {
        resultTextView.text = ""
        
        let realm = try! Realm()
        let vals = realm.objects(Person.self)
        
        if vals.count == 0 {
            return
        } else {
            for i in vals {
                resultTextView.text = resultTextView.text! + "Name: \(i.name), Age: \(i.age)\n"
            }
    }
    
}

}
