
import UIKit

class CollectionFooter: UICollectionReusableView {
    
    lazy var ButtonLike: UIButton = {
        let button = UIButton(type:  .system)
        button.setTitle("💛 Curtir", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor =  .clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonAdd: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Adicionado às Minhas Listas", for: .normal)
        button.setTitleColor(.yellow, for: .normal)
        button.backgroundColor =  .clear
        button.layer.borderWidth = 0.5
        button.layer.borderColor = #colorLiteral(red: 1, green: 0.9373728282, blue: 0.09037478598, alpha: 1)
        button.layer.cornerRadius = 7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var textFooter: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Lista enviada por @TodoMoviesApp"
        label.textColor = UIColor(red: 247, green: 217, blue: 23, alpha: 1.0)
        label.font = UIFont.systemFont(ofSize: 10)
        label.numberOfLines = 0
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
}

extension CollectionFooter {
    
    private func addSubviews(){
        addSubview(ButtonLike)
        addSubview(buttonAdd)
        addSubview(textFooter)
        
        setupLayout()
    }
    
    private func setupLayout(){
        NSLayoutConstraint.activate([
            ButtonLike.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            ButtonLike.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            ButtonLike.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            ButtonLike.heightAnchor.constraint(equalToConstant: 43),
            
            buttonAdd.topAnchor.constraint(equalTo: ButtonLike.bottomAnchor, constant: 15),
            buttonAdd.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buttonAdd.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buttonAdd.heightAnchor.constraint(equalToConstant: 43),
            
            textFooter.topAnchor.constraint(equalTo: buttonAdd.bottomAnchor, constant: 10),
            textFooter.centerXAnchor.constraint(equalTo: centerXAnchor),
            textFooter.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
}
