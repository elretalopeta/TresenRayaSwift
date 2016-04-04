//
//  ViewController.swift
//  tresenraya
//
//  Created by usu27 on 8/3/16.
//  Copyright © 2016 usu27. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tiradas = 0
    
    @IBOutlet weak var tablero: UIImageView!
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBAction func playAgain(sender: AnyObject) {
        
        tiradas = 0
        play.alpha = 0
        resultado.alpha = 0
        tablero.hidden=false
        play.alpha = 0
        for(var i=0; i<9 ; i++){
            tr[i] = 0
            allButtons[i].setImage(nil, forState: .Normal)
            allButtons[i].hidden = false
        }
    }
    
    var allButtons: [UIButton] = [UIButton]()
    
    @IBOutlet weak var resultado: UILabel!
    var tr: [Int] = [0,0,0,0,0,0,0,0,0]
    var ganador = String()

    @IBAction func buttons_action(sender: AnyObject) {
        tiradas++;
        
        if((tiradas % 2) == 0 && tiradas <= 9 && tr[sender.tag-1] != 1){
         
            sender.setImage(UIImage (named: "cruz.png"), forState: .Normal)
            tr[sender.tag-1] = 1
            
            if( (tr[0]==tr[1] && tr[0]==tr[2] && tr[0] != 0) ||
                (tr[3]==tr[4] && tr[3]==tr[5] && tr[3] != 0) ||
                (tr[6]==tr[7] && tr[6]==tr[8] && tr[6] != 0) ||
               
                (tr[0]==tr[3] && tr[0]==tr[6] && tr[0] != 0) ||
                (tr[1]==tr[4] && tr[1]==tr[7] && tr[1] != 0) ||
                (tr[2]==tr[5] && tr[2]==tr[8] && tr[2] != 0) ||
                
                (tr[0]==tr[4] && tr[0]==tr[8] && tr[0] != 0) ||
                (tr[2]==tr[4] && tr[2]==tr[6] && tr[2] != 0)){
                    
                ganador = "Ha ganador cruz"
                fin(ganador)
            }
            
        }else if ((tiradas % 1) == 0 && tiradas <= 9 && tr[sender.tag-1] != 2){
            sender.setImage(UIImage (named: "circulo.png"), forState: .Normal)
            tr[sender.tag-1] = 2
            
            if( (tr[0]==tr[1] && tr[0]==tr[2] && tr[0] != 0) ||
                (tr[3]==tr[4] && tr[3]==tr[5] && tr[3] != 0) ||
                (tr[6]==tr[7] && tr[6]==tr[8] && tr[6] != 0) ||
                
                (tr[0]==tr[3] && tr[0]==tr[6] && tr[0] != 0) ||
                (tr[1]==tr[4] && tr[1]==tr[7] && tr[1] != 0) ||
                (tr[2]==tr[5] && tr[2]==tr[8] && tr[2] != 0) ||
                
                (tr[0]==tr[4] && tr[0]==tr[8] && tr[0] != 0) ||
                (tr[2]==tr[4] && tr[2]==tr[6] && tr[2] != 0)){
                    
                ganador = "Ha ganado circulo"
                fin(ganador)
                    
            }
        }else{
            tiradas--
        }
        if(tiradas == 9){
            ganador = "Empate"
            fin(ganador)
        }
    }
    
    func fin(ganador: String ){
        tablero.hidden = true
        UIView.animateWithDuration(0.5) { () -> Void in
            self.resultado.alpha = 1
            self.play.alpha = 1
        }
    //resultado.center = CGPointMake(resultado.center.x - 100, resultado.center.y - 10)
        for(var i=0; i<9 ; i++){
          allButtons[i].hidden=true
        }
        resultado.text = ganador
        play.hidden=false
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.allButtons = [self.b1, self.b2, self.b3, self.b4, self.b5, self.b6, self.b7, self.b8, self.b9]
        play.alpha = 0
        resultado.alpha = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

