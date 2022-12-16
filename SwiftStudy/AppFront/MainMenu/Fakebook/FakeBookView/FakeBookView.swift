//
//  FakeBookView.swift
//  SwiftStudy
//
//  Created by Josicleison Elves on 15/12/22.
//

import UIKit

final class FakeBookView: UIView {
    private var posts: [FakeBookPost] = [FakeBookPost(
        perfilImage: .gatsu, image: nil, name: "Gatsu",
        description: "\tSe você busca muito alguma coisa, é certo que deixará outras no meio do caminho. Só me sinto vivo quando estou usando a minha espada. Humanos são fracos e morrem facilmente. Mas não importa o quão fracos somos, não importa o quanto somos torturados, não importa quanta dor sentimos, nós ainda queremos viver."),
                                         FakeBookPost(
        perfilImage: .griffith, image: nil, name: "Griffith",
        description: "\tUm amigo não deveria só seguir o sonho do outro… Um amigo deveria achar sua própria razão de viver… E se alguém destruisse seu sonho… Ele deveria se defender, mesmo que esse alguém fosse eu.")]
    private lazy var navigationCollectionView = FakeBookNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    private lazy var statusStackView: FakeBookStatusStackView = {
        let statusStackView = FakeBookStatusStackView(frame: frame)
        statusStackView.perfilImage = .gatsu
        return statusStackView
    }()
    private lazy var storiesCollectionView = FakeBookStoriesCollectionView(
        fakeBookStories: [
            FakeBookStory(image: UIImage(named: "Story_0"), name: "Lero Lero"),
            FakeBookStory(image: UIImage(named: "Story_1"), name: "Lero Lero"),
            FakeBookStory(image: UIImage(named: "Story_2"), name: "Lero Lero"),
            FakeBookStory(image: UIImage(named: "Story_3"), name: "Lero Lero")
        ]
    )
    private lazy var scroll: (view: UIScrollView, toScrollStackView: UIStackView) = {
        let scrollView = UIScrollView()
        let stackView = scrollView.toScroll()
        stackView.spacing = frame.height*0.01
        stackView.backgroundColor = .lightGray
        return (view: scrollView, toScrollStackView: stackView)
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func createPostView(_ post: FakeBookPost?) {
        let postView = FakeBookPostView(frame: frame)
        postView.post = post
        scroll.toScrollStackView.addArrangedSubview(postView)
    }
}

extension FakeBookView: Setup {
    func configure() {
        addSubview(scroll.view)
        backgroundColor = .reverseDark
        scroll.toScrollStackView.addArrangedSubviews([navigationCollectionView, statusStackView, storiesCollectionView])
        for post in posts {
            createPostView(post)
        }
    }
    func constrain() {
        scroll.view.enableAutoLayout
            .constraint(attributes: [.top, .leading, .trailing, .bottom], to: safeAreaLayoutGuide)
        navigationCollectionView.enableAutoLayout
            .shape(height: frame.height*0.075)
        statusStackView.enableAutoLayout
            .shape(height: frame.height*0.1)
        storiesCollectionView.enableAutoLayout
            .shape(height: frame.height*0.2)
    }
}
