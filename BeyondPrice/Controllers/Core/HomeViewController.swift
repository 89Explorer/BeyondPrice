//
//  HomeViewController.swift
//  BeyondPrice
//
//  Created by 권정근 on 12/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Variables
    private let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    var dataSource: UICollectionViewDiffableDataSource<Section, App>?
    
    // MARK: - UI Components
    private let homeHeaderView: CustomHeaderView = CustomHeaderView(title: "투데이")
    
    private lazy var feedCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.createCompositionalLayout())
        collectionView.backgroundColor = .systemTeal
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        
        //self.feedCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        self.feedCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseIdentifier)
        
        self.feedCollectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        self.feedCollectionView.register(MediumTableCell.self, forCellWithReuseIdentifier: MediumTableCell.reuseIdentifier)
        self.feedCollectionView.register(SmallTableCell.self, forCellWithReuseIdentifier: SmallTableCell.reuseIdentifier)
        
        configureConstraints()
        
        createDataSource()
        reloadData()
    }
    
    // MARK: - Layouts
    private func configureConstraints() {
        view.addSubview(homeHeaderView)
        view.addSubview(feedCollectionView)
        
        homeHeaderView.translatesAutoresizingMaskIntoConstraints = false
        feedCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            homeHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            homeHeaderView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            homeHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            homeHeaderView.heightAnchor.constraint(equalToConstant: 60),
            
            feedCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            feedCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            feedCollectionView.topAnchor.constraint(equalTo: homeHeaderView.bottomAnchor, constant: 5),
            feedCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10)
            
        ])
    }
    
    // MARK: - Functions
    func configure<T: SelfConfiguringCell>(_ cellType: T.Type, with app: App, for indexPath: IndexPath) -> T {
        
        guard let cell = feedCollectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else { fatalError("Unable to dequeue \(cellType)")}
        
        cell.configure(with: app)
        return cell
        
    }
    
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, App>(collectionView: self.feedCollectionView) { collectionView, indexPath, app in
            switch self.sections[indexPath.section].type {
            case "mediumTable":
                return self.configure(MediumTableCell.self, with: app, for: indexPath)
            case "smallTable":
                return self.configure(SmallTableCell.self, with: app, for: indexPath)
            default:
                return self.configure(FeaturedCell.self, with: app, for: indexPath)
            }
        }
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            // `SectionHeader`를 dequeuing
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeader.reuseIdentifier,
                for: indexPath
            ) as? SectionHeader else {
                // 문제가 발생하면 기본 빈 뷰 반환
                return nil
            }
            
            // 스냅샷에서 섹션 데이터 가져오기
            guard let firstApp = self?.dataSource?.itemIdentifier(for: indexPath),
                  let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp) else {
                return nil
            }
            
            // 섹션 타이틀이 비어 있으면 기본 뷰 반환
            if section.title.isEmpty {
                return nil
            }
            
            // 섹션 헤더 구성
            sectionHeader.title.text = section.title
            sectionHeader.subtitle.text = section.subtitle
            return sectionHeader
        }
        
    }
    
    func reloadData() {
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        
        dataSource?.apply(snapshot)
    }
    
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = self.sections[sectionIndex]

            switch section.type {
            case "mediumTable":
                return self.createMediumTableSection(using: section)
            case "smallTable":
                return self.createSmallTableSection(using: section)
            default:
                return self.createFeaturedSection(using: section)
            }
        }

        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 20
        layout.configuration = config
        return layout
    }

    func createFeaturedSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
        return layoutSection
    }

    func createMediumTableSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33))

        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalWidth(0.55))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .groupPagingCentered

        let layoutSectionHeader = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

        return layoutSection
    }

    func createSmallTableSection(using section: Section) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)

        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(200))
        let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: layoutGroupSize, subitems: [layoutItem])

        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        let layoutSectionHeader = createSectionHeader()
        layoutSection.boundarySupplementaryItems = [layoutSectionHeader]

        return layoutSection
    }

    func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSectionHeaderSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layoutSectionHeader
    }
}


