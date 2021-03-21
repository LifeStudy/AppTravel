//
//  ConfirmacaoPagamentoViewController.swift
//  App Viagens
//
//  Created by ArjMaster on 20/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class ConfirmacaoPagamentoViewController: UIViewController {

    @IBOutlet weak var imagemPacote: UIImageView!
    @IBOutlet weak var labelTituloPacote: UILabel!
    @IBOutlet weak var labelTituloHotel: UILabel!
    @IBOutlet weak var labelDataPacote: UILabel!
    @IBOutlet weak var labelQtdPessoas: UILabel!
    @IBOutlet weak var labelDescricaoPacote: UILabel!
    @IBOutlet weak var botaoVoltarHome: UIButton!
    
    var pacoteEscolhido:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let pacote = pacoteEscolhido {
            self.imagemPacote.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloHotel.text = pacote.nomeDoHotel
            self.labelTituloPacote.text = pacote.viagem.titulo.uppercased()
            self.labelDataPacote.text = pacote.dataViagem
            self.labelDescricaoPacote.text = pacote.descricao
            
            self.imagemPacote.layer.cornerRadius = 10
            self.imagemPacote.layer.masksToBounds = true
            
            self.botaoVoltarHome.layer.cornerRadius = 8
        }
    }
    
    @IBAction func btnGoHome(_ sender: UIButton) {
        if let navigation = self.navigationController {
            navigation.popToRootViewController(animated: true)
        }
    }
}
