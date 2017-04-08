//
//  ViewController.swift
//  PhuongTrinhBac2
//
//  Created by Cntt03 on 4/8/17.
//  Copyright © 2017 Cntt03. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var txtC: UITextField!
    @IBOutlet weak var txtB: UITextField!
    @IBOutlet weak var txtA: UITextField!
    @IBOutlet weak var txtresult: UILabel!
    var a: Double = 0;
    var b: Double = 0;
    var c: Double = 0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnReset(_ sender: Any) {
        txtA.text="";
        txtB.text="";
        txtC.text="";
    }
    @IBAction func btnGiai(_ sender: Any) {
        if (txtA.text! == "" || txtB.text == "" || txtC.text == ""){
            //create alert
            let alert = UIAlertController(title: "Thông Báo", message: "Bạn phải nhập đầy đủ thông tin", preferredStyle: UIAlertControllerStyle.alert);
            //add an action
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
            //show alert
            self.present(alert, animated: true, completion: nil);
        }
        else{
            
            if (!isDigits(ten_digits: txtA.text!) || !isDigits(ten_digits: txtB.text!) || !isDigits(ten_digits: txtC.text!) ){
                //create alert
                let alert = UIAlertController(title: "Thông Báo", message: "Bạn phải nhập số", preferredStyle: UIAlertControllerStyle.alert);
                //add an action
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil));
                //show alert
                self.present(alert, animated: true, completion: nil);
            }
            else{
                a = Double(txtA.text!)!;
                b = Double(txtB.text!)!;
                c = Double(txtC.text!)!;
                
                if a == 0{
                    if b == 0{
                        if c == 0 {
                            txtresult.text="Phương trình vô số nghiệm";
                        }
                        else{
                            txtresult.text="Phương trình vô nghiệm"
                        }
                    }
                    else{
                        txtresult.text=String(format: "Phương trình có 1 nghiệm: x = %.1f", (-b/c))
                    }
                }
                else{
                    var delta: Double = b*b - 4*a*c;
                    if (delta  < 0){
                        txtresult.text="Phương trình vô nghiệm"
                    }
                    else if (delta == 0){
                        txtresult.text=String(format: "Phương trình có 1 nghiệm kép: x = %.1f", (-b/(2*a)))
                    }
                    else{
                        var sqrtDelta: Double = sqrt(Double(delta));
                        var x1: Double = (-b+sqrtDelta)/(2*a);
                        var x2: Double = (-b-sqrtDelta)/(2*a);
                        txtresult.text=String(format: "Phương trình có 2 nghiệm: x1 = %.1f, x2 = %.1f", x1, x2);
                        
                    }
                }
            }
        }
        
    }
    func isDigits(ten_digits: String) -> Bool{
        if (!ten_digits.isEmpty){
            let numberCharacters = NSCharacterSet.decimalDigits.inverted;
            return !ten_digits.isEmpty && ten_digits.rangeOfCharacter(from: numberCharacters ) == nil;
            
        }
        return false;
    }

}

