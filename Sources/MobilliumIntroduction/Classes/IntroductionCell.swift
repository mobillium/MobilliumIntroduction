//
//  IntroductionCell.swift
//  MobilliumIntroduction
//
//  Created by Ahmet İmirze on 12.04.2022.
//

import UIKit

// MARK: - IntroductionCell
class IntroductionCell: UICollectionViewCell {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var cellLoaded: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        draw()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with content: IntroductionConfig.Content) {
        drawContentStyle(content.style)
        
        switch content.style {
        case .styleOne, .styleThree:
            titleLabel.textAlignment = .center
            descriptionLabel.textAlignment = .center
        case .styleTwo, .styleFour:
            titleLabel.textAlignment = .left
            descriptionLabel.textAlignment = .left
        }
        
        titleLabel.text = content.title.text
        titleLabel.font = content.title.font
        titleLabel.textColor = content.title.textColor
        titleLabel.numberOfLines = content.title.numberOfLines
        titleLabel.lineBreakMode = content.title.lineBreakMode
        
        descriptionLabel.text = content.description.text
        descriptionLabel.font = content.description.font
        descriptionLabel.textColor = content.description.textColor
        descriptionLabel.numberOfLines = content.description.numberOfLines
        descriptionLabel.lineBreakMode = content.description.lineBreakMode
        
        imageView.image = content.image.image
        imageView.contentMode = content.image.contentMode
        imageView.backgroundColor = content.image.backgroundColor
        imageView.tintColor = content.image.tintColor
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.subviews.forEach { view in
            view.removeFromSuperview()
        }
    }
}

extension IntroductionCell {
    private func draw() {
        drawStackView()
    }
    
    private func drawStackView() {
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func drawContentStyle(_ style: IntroductionConfig.ContentStyle) {
        switch style {
        case .styleOne, .styleTwo:
            drawImageView()
            drawTitleLabel()
            drawDescriptionLabel()
        case .styleThree, .styleFour:
            drawTitleLabel()
            drawDescriptionLabel()
            drawImageView()
        }
        drawBlankView()
    }
    
    private func drawImageView() {
        stackView.addArrangedSubview(imageView)
    }
    
    private func drawTitleLabel() {
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func drawDescriptionLabel() {
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    private func drawBlankView() {
        stackView.addArrangedSubview(UIView())
    }
}
