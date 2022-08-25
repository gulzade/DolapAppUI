//
//  ViewController.swift
//  DolapApp
//
//  Created by Gülzade Karataş on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var campaignsCollectionView: UICollectionView!
    @IBOutlet weak var productsCollectionView: UICollectionView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var campaignList = [CampaignData]()
    var productList = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchbar.tintColor = UIColor(named: "tabColor")
        
        self.navigationItem.title = "DOLAP"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: "dolapColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Roboto-Bold", size: 30)!]
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        campaignsCollectionView.delegate = self
        campaignsCollectionView.dataSource = self
        
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        
        searchBar.barTintColor = .white
        
        let campaign1 = CampaignData(image: "campaign1")
        let campaign2 = CampaignData(image: "campaign2")
        let campaign3 = CampaignData(image: "campaign3")
        let campaign4 = CampaignData(image: "campaign4")
        let campaign5 = CampaignData(image: "campaign5")
        let campaign6 = CampaignData(image: "campaign6")
        let campaign7 = CampaignData(image: "campaign7")
        let campaign8 = CampaignData(image: "campaign8")
        let campaign9 = CampaignData(image: "campaign9")
     
        
        campaignList.append(campaign1)
        campaignList.append(campaign2)
        campaignList.append(campaign3)
        campaignList.append(campaign4)
        campaignList.append(campaign5)
        campaignList.append(campaign6)
        campaignList.append(campaign7)
        campaignList.append(campaign8)
        campaignList.append(campaign9)
        
        productList.append(Product(productImage: "telefonKabı1", productName: "Apple", productPrice: "80 TL", productSize: "Tek Ebat"))
        productList.append(Product(productImage: "gomlek",  productName: "Zara", productPrice: "250 TL", productSize: "L"))
        productList.append(Product(productImage: "pudraElbise",  productName: "Mavi", productPrice: "375 TL", productSize: "XS"))
        productList.append(Product(productImage: "siyahGomlek",  productName: "Pull&Bear", productPrice: "489 TL", productSize: "S"))
        productList.append(Product(productImage: "telefonKabı2",  productName: "Apple", productPrice: "150 TL", productSize: "Tek Ebat"))
        productList.append(Product(productImage: "macbook",  productName: "Apple", productPrice: "25.900 TL", productSize: "14"))
        productList.append(Product(productImage: "kırmızıElbise",  productName: "İpekyol", productPrice: "2670 TL", productSize: "M"))
        productList.append(Product(productImage: "damatlık",  productName: "Sarar", productPrice: "12.560 TL", productSize: "L"))
        
        let tasarim = UICollectionViewFlowLayout()
        tasarim.scrollDirection = .horizontal
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
        tasarim.minimumLineSpacing = 5
        tasarim.minimumInteritemSpacing = 5
        tasarim.itemSize = CGSize(width: 80, height: 80)
        campaignsCollectionView.collectionViewLayout = tasarim
        
        let tasarim2 = UICollectionViewFlowLayout()
        tasarim2.sectionInset = UIEdgeInsets(top:10, left: 10, bottom: 10, right: 10)
        tasarim2.minimumLineSpacing = 10
        tasarim2.minimumInteritemSpacing = 10
        let genislik = UIScreen.main.bounds.width
        let hucreGenislik = ( genislik - 30) / 2
        tasarim2.itemSize = CGSize(width: hucreGenislik, height: hucreGenislik*1.7)
        productsCollectionView.collectionViewLayout = tasarim2
    }
    
}

extension ViewController: UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case campaignsCollectionView:
            return campaignList.count
        case productsCollectionView:
            return productList.count
        default:
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case campaignsCollectionView:
            let campaign = campaignList[indexPath.row]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! CampaignCollectionViewCell
            
            cell.campaignImage.layer.masksToBounds = true
            cell.campaignImage.contentMode = .scaleToFill
            cell.campaignImage.layer.cornerRadius = 40
            cell.campaignImage.layer.borderColor =  UIColor(named: "tabColor")?.cgColor
            cell.campaignImage.layer.borderWidth = 3.5
            cell.campaignImage.image = UIImage(named: campaign.image!)
            return cell
        case productsCollectionView:
            let product = productList[indexPath.row]
            let productcell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCollectionViewCell
            
            productcell.productImage.image = UIImage(named: product.productImage!)
            productcell.productName.text = product.productName
            productcell.productPrice.text = product.productPrice
            productcell.productSize.text = product.productSize
            
            
            productcell.layer.borderWidth = 0.3
            productcell.layer.borderColor = UIColor.black.cgColor
            
            return productcell
        default:
            return UICollectionViewCell()
        }
        
        
        
    }
    
    
}


