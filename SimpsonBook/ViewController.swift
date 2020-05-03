//
//  ViewController.swift
//  SimpsonBook
//
//  Created by mustafacan on 3.05.2020.
//  Copyright © 2020 mustafacan. All rights reserved.
//

import UIKit

class SimpsonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var simpsonList = [Simpson]();
    var selectedSimpson : Simpson?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self;
        tableView.delegate = self;
        
        let homer = Simpson(name: "Homer", description: "Homer ile eşi Marge'ın Bart, Lisa ve Maggie adında üç çocuğu vardır. Ailenin babası olarak Springfield Nükleer Santrali'nde çalışmaktadır. Homer, Amerikan işçi sınıfı stereotipidir: kaba, kilolu, beceriksiz, sakar, tembel, ağır içici ve cahil fakat kendisini ailesine adamış iyi biridir. ", image: UIImage(named : "homer")!)
        
        let bart = Simpson(name: "Bart", description: "On yaşındaki Bart, Homer ile Marge'ın çocuklarının en büyüğü ve tek oğlu, Lisa ile Maggie'nin ise ağabeyidir. Bart'ın en baskın kişilik özellikleri yaramazlığı, asiliği ve otoriteye karşı saygısızlığıdır.", image: UIImage(named : "bart")!)
        
        let lisa = Simpson(name: "Lisa", description: "Sekiz yaşında olan Lisa, Simpson ailesinin orta çocuğu ve Homer ile Marge'ın en büyük kızı, Bart'ın kız kardeşi ve Maggie'nin ablasıdır. Lisa, oldukça zeki biridir ve saksafon çalmaktadır.", image: UIImage(named : "lisa")!)
        
        let marge = Simpson(name: "Marge", description: "Marge, Simpson ailesinin iyi niyetli ve aşırı sabırlı annesidir. Kocası Homer ile birlikte üç çocuğu vardır: Bart, Lisa ve Maggie. Marge, ailesindeki ahlaki güçtür ve sık sık Simpson ailesindeki düzeni devam ettirmeye çalışarak var olan tuhaf davranışlarda ortak bir yol bulmaya çalışır. Genelde stereotip televizyon annesi olarak betimlenmekte ve sık sık 'TV anneleri' hakkında olan listelerin zirvesinde yer almaktadır.", image: UIImage(named : "marge")!)
        
        simpsonList.append(homer);
        simpsonList.append(bart);
        simpsonList.append(marge);
        simpsonList.append(lisa);
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return simpsonList.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SimpsonCell", for: indexPath) as! SimpsonTableViewCell
        
        cell.img?.image = simpsonList[indexPath.row].image;
        //let cell = UITableViewCell();
        cell.name?.text = simpsonList[indexPath.row].name;
        cell.lblDescription?.text = simpsonList[indexPath.row].description;
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedSimpson = simpsonList[indexPath.row];
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil);
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let target = segue.destination as! DetailsViewController;
            target.selectedSimpson = selectedSimpson;
        }
    }

}

