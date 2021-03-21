//
//  TableViewCell.swift
//  App Viagens
//
//  Created by ArjMaster on 15/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidade: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    func setupCell(viagem: Viagem){
        labelTitulo.text = viagem.titulo
        labelPreco.text = "R$ \(viagem.preco)"
        labelQuantidade.text = "\(viagem.quantidadeDeDias) dias"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem)
        
        imagemViagem.layer.cornerRadius = 10
        imagemViagem.layer.masksToBounds = true
    }
}
