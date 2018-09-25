//
//  ViewController.swift
//  PageControllerDemo
//
//  Created by Rocky Ahmed  on 26/9/18.
//  Copyright © 2018 Rocky Ahmed . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var pageControll: UIPageControl!
    @IBOutlet weak var collectionView: PagingCollectionVIew!
    
    let imageArray = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initCollectionView()
    }
}


extension ViewController {
    
    func initCollectionView() {
        collectionView.scrollInterval = 2
        collectionView.startScrolling()
        pageControll.numberOfPages = imageArray.count
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let currentPage: Int = Int(scrollView.contentOffset.x / collectionView.bounds.size.width)
        pageControll.currentPage = currentPage
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PageCollectionViewCell
        cell.imageView.image = UIImage(named: imageArray[indexPath.row])
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: self.collectionView.frame.size.width, height: self.collectionView.frame.size.height)
    }
    
}
