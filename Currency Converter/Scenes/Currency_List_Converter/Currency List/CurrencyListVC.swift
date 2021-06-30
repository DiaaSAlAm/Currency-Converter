//
//  CurrencyListVC.swift
//  Currency Converter
//
//  Created by Diaa SAlAm on 6/29/21.
//

import UIKit

class CurrencyListVC: UIViewController, CurrencyListViewProtocol {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var baseCurrencyLabel: UILabel!
    
    //MARK: - Properties
    var presenter: CurrencyListPresenterProtocol!
    private let cellIdentifier = CellIdentifiers.currencyList
    private let activityView = UIActivityIndicatorView(style: .large)
    private var retryButton: UIButton = UIButton()
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func showLoadingIndicator() {
        DispatchQueue.main.async {
            self.startAnimatingActivityView()
        }
    }
    
    func hideLoadingIndicator() {
        DispatchQueue.main.async {
            self.stopAnimatingActivityView()
        }
    }
    
    func successRequest() {
        DispatchQueue.main.async { [weak self] in
            self?.baseCurrencyLabel.text = self?.presenter.baseCurrency
            self?.collectionView.reloadData()
        } 
    }
    
    func failedRequest() {
        DispatchQueue.main.async { [weak self] in
            self?.addRetryButton()
        }
    }
    
    func showMessage(message: String, messageKind: ToastMessageKind) {
        DispatchQueue.main.async {
            ToastManager.shared.showMessage(messageKind: messageKind, message: message)
        } 
    }
    
}

//MARK: Setup View
extension CurrencyListVC {
    
    fileprivate func setupUI() {
        registerCollectionView()
        presenter.viewDidLoad()
    }
    
    //MARK: - Register  CollectionView Cell
    fileprivate func registerCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
    }
    
    //MARK: - Start Animating Activity
    private func startAnimatingActivityView() {
        activityView.hidesWhenStopped = true
        activityView.center = view.center
        activityView.startAnimating()
        view.addSubview(activityView)
    }
    
    //MARK: - Stop Animating Activity
    private func stopAnimatingActivityView() { 
        activityView.stopAnimating()
    }
    
    //MARK: - Add Retry Button in failure request
    func addRetryButton(){
        retryButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        retryButton.layer.cornerRadius = 10
        retryButton.backgroundColor = .black
        retryButton.setTitleColor(.white, for: .normal)
        retryButton.setTitle("Retry", for: .normal)
        retryButton.addTarget(self, action: #selector(retryButtonAction), for: .touchUpInside)
        retryButton.center = view.center
        view.addSubview(retryButton)
    }
    
    @objc func retryButtonAction(sender: UIButton!) {
        presenter.viewDidLoad()
        retryButton.removeFromSuperview()
    }
}


//MARK: - UICollectionView Delegate
extension CurrencyListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        defer { collectionView.deselectItem(at: indexPath, animated: true) } 
        presenter.navigateToCurrencyConverter(indexPath)
    }
}

//MARK: - UICollectionView Data Source
extension CurrencyListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfRow
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier,for: indexPath) as! CurrencyListCell
        presenter.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
}

//MARK: - UICollectionView Delegate Flow Layout
extension CurrencyListVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        return CGSize(width: width , height: 80)
    }
}
