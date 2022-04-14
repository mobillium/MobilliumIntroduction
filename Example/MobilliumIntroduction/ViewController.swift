//
//  ViewController.swift
//  MobilliumIntroduction
//
//  Created by Ahmet İmirze on 16.03.2022.
//

import UIKit
import MobilliumIntroduction

class ViewController: UIViewController {
    let brandLabel: UILabel = {
        let label = UILabel()
        label.text = "MobilliumIntroduction"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 28.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let showBasicButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        button.setTitle("Show Basic Introduction", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let showAdvancedButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.backgroundColor = UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        button.setTitle("Show Advanced Introduction", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
    }
    
    @objc
    private func showBasicIntroduction(_ sender: UIButton) {
        let introductionController = IntroductionController()
        present(introductionController, animated: true)
    }
    
    @objc
    private func showAdvancedIntroduction(_ sender: UIButton) {
        let titlesAndDescriptions: [String: String] = [
            "Make Great Things": "We build products that are fast, effortless to use and aesthetically pleased. We roll up our sleeves and create things worthy of our clients’ and users’ time.",
            "Deliver Results": "There’s nothing like watching your app come alive. Each week we deliver a build of your app with release notes on what’s new, updated, fixed, or in progress.",
            "Embrace Transparency": "Each idea, code commit, or design concept is put into a shared space. You don’t just get an email that shows what we did when we’re done.",
            "Seek Mastery": "We build products that are fast, effortless to use and aesthetically pleased. We roll up our sleeves and create things worthy of our clients’ and users’ time.",
            "Take Ownership": "We take ownership of the solutions that we provide to our customers. We are not afraid to speak up and stand for what we think is true.",
            "Have Fun": "We believe businesses that encourage having fun are the ones where the best people do their best work."
        ]
        
        let contents: [IntroductionConfig.Content] = titlesAndDescriptions.compactMap {
            IntroductionConfig.Content(
                title: IntroductionConfig.Title(text: $0.key),
                description: IntroductionConfig.Description(text: $0.value),
                image: IntroductionConfig.Image(image: UIImage(named: $0.key.replacingOccurrences(of: " ", with: ""))!)
            )
        }
        
        let skipButton = IntroductionConfig.SkipButton(
            attributedTitle: NSAttributedString(
                string: "Skip",
                attributes: [
                    NSAttributedString.Key.foregroundColor: UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
                    NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue
                ])
        )
        
        let pageControl = IntroductionConfig.PageControl(
            currentPageIndicatorTintColor: UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0),
            pageIndicatorTintColor: UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 0.4)
        )
        
        let nextButton = IntroductionConfig.NextButton(
            title: "Next",
            lastTitle: "Let's Go",
            titleColor: .white,
            backgroundColor: UIColor(red: 0.0 / 255.0, green: 102.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
        )
        
        let config = IntroductionConfig(
            contents: contents,
            skipButton: skipButton,
            pageControl: pageControl,
            nextButton: nextButton
        )
        
        let introductionController = IntroductionController(config: config)
        introductionController.pageDelegate = self
        introductionController.buttonDelegate = self
        present(introductionController, animated: true)
    }
}

// MARK: - Layout
extension ViewController {
    private func addSubviews() {
        addLabel()
        addShowAdvancedButton()
        addShowDefaultButton()
    }
    
    private func addLabel() {
        view.addSubview(brandLabel)
        
        NSLayoutConstraint.activate([
            brandLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            brandLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            brandLabel.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            brandLabel.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
        ])
    }
    
    private func addShowAdvancedButton() {
        showAdvancedButton.addTarget(self, action: #selector(showAdvancedIntroduction(_:)), for: .touchUpInside)
        view.addSubview(showAdvancedButton)
        
        NSLayoutConstraint.activate([
            showAdvancedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32),
            showAdvancedButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            showAdvancedButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            showAdvancedButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    private func addShowDefaultButton() {
        showBasicButton.addTarget(self, action: #selector(showBasicIntroduction(_:)), for: .touchUpInside)
        view.addSubview(showBasicButton)
        
        NSLayoutConstraint.activate([
            showBasicButton.bottomAnchor.constraint(equalTo: showAdvancedButton.topAnchor, constant: -16),
            showBasicButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            showBasicButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            showBasicButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

// MARK: - IntroductionControllerPageDelegate
extension ViewController: IntroductionControllerPageDelegate {
    func introductionController(_ controller: IntroductionController, willDisplay index: Int) {
        // do something
    }
    
    func introductionController(_ controller: IntroductionController, didEndDisplaying index: Int) {
        // do something
    }
}

// MARK: - IntroductionControllerButtonDelegate
extension ViewController: IntroductionControllerButtonDelegate {
    func didNextButtonTappedAtEndOfContents() {
        // do something
    }
    
    func didSkipButtonTapped() {
        // do something
    }
}
