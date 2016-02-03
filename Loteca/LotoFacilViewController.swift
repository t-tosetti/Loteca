//
//  LotoFacilViewController.swift
//  Loteca
//
//  Created by Thiago Tosetti Lopes on 31/01/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit
import Foundation

class LotoFacilViewController: UIViewController {

    private let totalDezenas = 15
    private let numerosValidos = Array(1...25)
    
    @IBOutlet weak var lotoDisplay: UIPickerView!
    
    @IBAction func lotoSorteio(sender: UIButton) {
        let loto = sortearLoto()
        
        for (indiceDezena, dezena) in loto.enumerate() {
            let indiceLinha = numerosValidos.indexOf(dezena)!
            lotoDisplay.selectRow(indiceLinha, inComponent: indiceDezena, animated: true)
        }

    }
    
    private func sortearLoto() -> [Int] {
        var sorteio = Set<Int>()
        
        while sorteio.count < totalDezenas {
            sorteio.insert(sortearDezena())
        }
        
        return sorteio.sort()
    }
    
    
    private func sortearDezena() -> Int {
        let tamanho = UInt32(numerosValidos.count)
        let sorteio = Int(arc4random_uniform(tamanho))
        return numerosValidos[sorteio]
    }
  
}


// MARK: - UIPickerViewDataSource

extension LotoFacilViewController: UIPickerViewDataSource {
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return totalDezenas
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numerosValidos.count
    }
    
    
    
}

// MARK: - UIPickerViewDELEGATE
extension LotoFacilViewController: UIPickerViewDelegate {
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(numerosValidos[row])
    }
    
    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        pickerLabel.textColor = UIColor.blackColor()
        pickerLabel.text = String(numerosValidos[row])
        // pickerLabel.font = UIFont(name: pickerLabel.font.fontName, size: 15)
        pickerLabel.font = UIFont(name: "Helvetica", size: 15) // In this use your custom font
        pickerLabel.textAlignment = NSTextAlignment.Center
        return pickerLabel
    }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(component, row)
    }
    

}
