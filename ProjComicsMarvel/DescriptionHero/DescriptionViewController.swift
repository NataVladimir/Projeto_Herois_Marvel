//
//  DescriptionViewController.swift
//  ProjComicsMarvel
//
//  Created by test on 10/03/23.
//

import UIKit

class DescriptionViewController: UIViewController {

    var descriptionView: DescriptionView?
    
    var alert: Alert?
    let hm = HerosMenager.shared
    var hrUrl: Hero!
    
    override func loadView() {
        self.descriptionView = DescriptionView()
        self.view = self.descriptionView
        self.configElementos()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionView?.delegate(delegate: self)
        self.alert = Alert(controller: self)
    }
    
    func configElementos(){
        self.descriptionView?.nameLabel.text = hrUrl.name
        self.descriptionView?.descriHeroLabel.text = hrUrl.description
        if let url = URL(string: hrUrl.thumbnail.url){
            descriptionView?.imageHero.kf.indicatorType = .activity //load da imagem
            descriptionView?.imageHero.kf.setImage(with: url)
        }else{
            self.descriptionView?.imageHero.image = nil
        }
    }

}

extension DescriptionViewController: DescriptionViewDelegate{

    func actionGoToWebView() {
        let webV = WebViewController()
        webV.heroURLP = String(hrUrl.urls.last!.url)
        print("\n----url----\n", String(hrUrl.urls.last!.url), "\n-------")
        self.navigationController?.pushViewController(webV, animated: true)
        
    }
    
    func actionSaveButton() {
        print("Deu certo delegate")
        if hm.herosS.last?.name != hrUrl.name{
            
            let salvandoNaClass = SaveHerosApi.init(name: hrUrl.name, descripion: hrUrl.description, urlImage: hrUrl.thumbnail.url, urlWebSave: hrUrl.urls.last!.url)
            hm.addHero(salvandoNaClass)
        }else{
            print("heroi adicionado")
            self.alert?.getAlert(titulo: "Heroi já está cadastrado", mensagem: "Heroi já foi salva, va para tela inicial e veja os herois salvos")
            
        }
    }
        
    func actionBackButton() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
