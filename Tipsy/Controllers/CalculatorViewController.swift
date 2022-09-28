//
//  ViewController.swift
//  Tipsy
//
//  Created by Lidiane Ferreira on 24/06/2019.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //var resultsViewController = ResultsViewController()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipChosen = 0.10
    var numberOfPeople = 2
    var finalbill = 0.00
    var finalResult = "0.0"
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)               //dispensar o teclado quando o user clicar em Tip
        
        zeroPctButton.isSelected = false             //Para os botoes ficare sem fundo
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true                    //Para o botao selecionado ter um fundo
        
        let tipSelected = sender.currentTitle!
        let tipWithoutPct = String(tipSelected.dropLast())
        let tipAsNumber = Double(tipWithoutPct)!
        
        tipChosen = tipAsNumber / 100               //Tip escolhida transformada em decimal
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)    //o numero de pessoas convertido em String para poder alterar a label
        
        numberOfPeople = Int(sender.value)            //o mesmo numero de pessoas convertido em Int para ser usado nas contas

    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bill = billTextField.text!
        if bill != "" {                               //Se a bill nao for igual (!=)a string, transforme em double:
            finalbill = Double(bill)!
            let result = finalbill * (1 + tipChosen) / Double(numberOfPeople)
            
            finalResult = String(format: "%.2f", result)      //O resultado final é o resultado convertido em string para ser usado.
        }
        self.performSegue(withIdentifier: "SegueResult", sender: self)
    }
   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "SegueResult"{          //serve para conectar os dados com a outra tela
            
            let destinationVC = segue.destination as! ResultsViewController
                                                  //aqui voce vai enviar os dados para a outra tela de acordo com os dados que vc precisa la. Nesse caso aqui, na tela 2 precisa do result, tip e split. Entao na tela 1, vc precisa ter ter os mesmos dados correspondes com o resultado final.
            destinationVC.result = finalResult
            destinationVC.tip = Int(tipChosen * 100)
            destinationVC.split = numberOfPeople
        }
    }
    
}
