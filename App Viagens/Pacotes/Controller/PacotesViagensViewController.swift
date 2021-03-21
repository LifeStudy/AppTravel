//
//  PacotesViagensViewController.swift
//  App Viagens
//
//  Created by ArjMaster on 17/03/21.
//  Copyright © 2021 ArjMaster. All rights reserved.
//

import UIKit


class PacotesViagensViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var colecaoPacotesViagem: UICollectionView!
    @IBOutlet weak var labelContador: UILabel!
    @IBOutlet weak var pesquisarViagens: UISearchBar!
    
    
    let pacoteDados:Array<PacoteViagem> = PacoteViagemDAO().retornaTodasAsViagens()
    var pacotes:Array<PacoteViagem> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pacotes = pacoteDados
        colecaoPacotesViagem.dataSource = self
        colecaoPacotesViagem.delegate = self
        pesquisarViagens.delegate = self
        labelContador.text = self.atualizaContadorLabel()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.pacotes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celulaPacote = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaPacote", for: indexPath) as! PacoteViagemCollectionViewCell
        
        celulaPacote.setupCellCollection(pacote: pacotes[indexPath.item])
        
        return celulaPacote
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return UIDevice.current.userInterfaceIdiom == .phone ? CGSize(width: collectionView.bounds.width/2-20 , height: 160) : CGSize(width: collectionView.bounds.width/3-20 , height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pacote = pacotes[indexPath.item]
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "detalhesViagem") as! DetalhesViagemViewController
        controller.pacoteSelecionado = pacote
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        pacotes = pacoteDados
        if searchText != "" {
            let filtroListaViagem = NSPredicate(format: "viagem.titulo contains %@", searchText);
            let listaFiltrada:Array<PacoteViagem> = (pacotes as NSArray).filtered(using: filtroListaViagem) as! Array;
            
            pacotes = listaFiltrada;
        }
        
        self.labelContador.text = self.atualizaContadorLabel()
        
        colecaoPacotesViagem.reloadData()
    }
    
    func atualizaContadorLabel() -> String{
        return "\(pacotes.count) pacote(s) encontrados."
    }
}
