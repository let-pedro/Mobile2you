
import UIKit

class CollectionHeader: UICollectionReusableView {
    
    static let identifier = "CollectionHeader"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    lazy var gradientContainerView: UIView = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.clear.cgColor,
            UIColor.black.cgColor
        ]
        gradientLayer.locations = [0.6,0.77]
        gradientLayer.frame = self.bounds
        gradientLayer.frame.origin.y -= bounds.height
        
        let gradientContainerView = UIView()
        gradientContainerView.layer.addSublayer(gradientLayer)
        gradientContainerView.translatesAutoresizingMaskIntoConstraints = false
        return gradientContainerView
    }()
    
    lazy var titleMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor =  #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 60, weight: .heavy)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var buttonLike: UIButton = {
        let button = UIButton()
        button.setImage(setubImgButtonLike(typeHeart: "heart"), for: .normal)
        button.tintColor = #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        button.tag = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var likeMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var countViews: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var stackViewInfoMovie: UIStackView = {
       let stackView = UIStackView(arrangedSubviews: [likeMovie,countViews])
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var stackViewContainerView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleMovie,stackViewInfoMovie])
        stackView.axis = .vertical
        stackView.spacing = 12
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview()
        setButtonLike()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    private func setubImgButtonLike(typeHeart: String) -> UIImage{
        let configImg = UIImage.SymbolConfiguration(pointSize: 25, weight: .thin)
        let image = UIImage(systemName: typeHeart, withConfiguration: configImg)!
        return image
    }
    
    var movieData: Movie? {
        didSet {
            guard let movie = movieData else { return }
            
            titleMovie.text = movie.title
            imageView.UrlImage(url: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)")
            likeMovie.text = " 🤍 \(String(Int(movie.vote_count))) Curtidas "
            countViews.text = " ○  \(String(Int(movie.popularity))) Assistidos"
        }
    }
    
    func setButtonLike(){
        self.buttonLike.addTarget(self, action: #selector(Like), for: .touchUpInside)
    }
    
    @objc func Like(){
        
        if buttonLike.tag == 0 {
            self.buttonLike.setImage(setubImgButtonLike(typeHeart: "heart.fill"), for: .normal)
            buttonLike.tag = 1
        } else {
            self.buttonLike.setImage(setubImgButtonLike(typeHeart: "heart"), for: .normal)
            buttonLike.tag = 0
        }
    }
}


extension CollectionHeader {
    
    private func addSubview(){
        addSubview(imageView)
        addSubview(gradientContainerView)
        addSubview(stackViewContainerView)
        addSubview(buttonLike)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            gradientContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            gradientContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            gradientContainerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            buttonLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            buttonLike.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -45),
            
            stackViewContainerView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            stackViewContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackViewContainerView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5),
        ])
    }
}
