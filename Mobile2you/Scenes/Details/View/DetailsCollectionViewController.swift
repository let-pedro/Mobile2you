
import UIKit

protocol nameDetailsCollectionViewControllerDelegate {
    func getListMovie(completion: @escaping (Bool) -> Void)
    func DetailsMovie(completion: @escaping (Bool) -> Void)
    var listMovies: [Movie] { get }
    var MovieMain: Movie? { get }
    
}


class DetailsCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
        
    weak var delegate: nameDetailsCollectionViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        // List Movie
        delegate?.getListMovie(){ success in
            guard success != false else {
                print("Erro request")
                return }
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        // Details Movie
        
        delegate?.DetailsMovie(){ success in
            guard success != false else {
                print("Erro request")
                return }
        }
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setupCollectionView(){
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionInset = .init(top: 16, left: 16, bottom: 10, right: 16)
            layout.minimumLineSpacing = 8
        }
        
        collectionView.backgroundColor = .black
        collectionView.contentInsetAdjustmentBehavior = .never
        
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.identifier)
        collectionView.register(CollectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeader.identifier)
        collectionView.register(CollectionFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "cellFooter")
    }

    
    // MARK: CollectionView Header and Footer
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "cellFooter", for: indexPath)
            
            return footer
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeader.identifier, for: indexPath) as?  CollectionHeader
        header?.movieData = delegate?.MovieMain
        return header!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 580)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 200)
    }
    

    // MARK: UICollectionViewDataSource


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.listMovies.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCell.identifier, for: indexPath) as? MovieCell
        cell?.movieData = delegate?.listMovies[indexPath.row]
        return cell!
    }
    
    
    // MARK: UICollectionViewDelegateLayout
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 2 * 16, height: 120)
    }
}
