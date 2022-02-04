
import UIKit

class MovieCell: UICollectionViewCell {
    
    static let identifier = "MovieCell"
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var titleMovie: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor =  #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 60)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var Year: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor =  #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // no get Category
    lazy var Category: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .clear
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    var movieData: Movie? {
        didSet {
            guard let movie = movieData else { return }
            titleMovie.text = movie.title
            imageView.UrlImage(url: "https://image.tmdb.org/t/p/w500/\(movie.poster_path)")
            Year.text = String(movie.release_date.split(separator: "-")[0])
        }
    }
    
}

extension MovieCell {
    private func addSubviews(){
        addSubview(imageView)
        addSubview(titleMovie)
        addSubview(Year)
        addSubview(Category)
        
        setupLayout()
    }
    
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.heightAnchor.constraint(equalToConstant: 110),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            
            titleMovie.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleMovie.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),
            titleMovie.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleMovie.heightAnchor.constraint(equalToConstant: 30),
            
            Year.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 6),
            Year.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 20),

            Category.topAnchor.constraint(equalTo: titleMovie.bottomAnchor, constant: 6),
            Category.leadingAnchor.constraint(equalTo: Year.trailingAnchor, constant: 10),
        ])
    }
}
