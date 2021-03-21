//
//  DetalhesViagemViewController.swift
//  App Viagens
//
//  Created by ArjMaster on 19/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    
    @IBOutlet weak var imagemPacote: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelQtdDias: UILabel!
    
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    @IBOutlet weak var scrollViewMain: UIScrollView!
    @IBOutlet weak var textFieldDate: UITextField!
    
    var pacoteSelecionado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(aumentarScroll(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        if let pacote = pacoteSelecionado {
            self.imagemPacote.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
            self.labelPrecoPacoteViagem.text = pacote.viagem.preco
        }
    }
    
    @objc func aumentarScroll(notification:Notification){
        self.scrollViewMain.contentSize = CGSize(width: self.scrollViewMain.frame.width, height: self.scrollViewMain.frame.height + 280)
    }
    
    @objc func displayDate(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MM yyyy"
        self.textFieldDate.text = formatter.string(from: sender.date)
    }
    
    @IBAction func textFieldDateFoco(_ sender: UITextField) {
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(displayDate(sender:)), for: .valueChanged)
    }
    
    @IBAction func btnVoltar(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popViewController(animated: true)
        }
    }
    
    @IBAction func btnFinish(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteEscolhido = pacoteSelecionado
        self.navigationController?.pushViewController(controller, animated: true)

    }
}
