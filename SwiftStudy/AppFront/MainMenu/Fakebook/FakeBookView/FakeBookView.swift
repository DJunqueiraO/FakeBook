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
        description: "\tUm amigo não deveria só seguir o sonho do outro… Um amigo deveria achar sua própria razão de viver… E se alguém destruisse seu sonho… Ele deveria se defender, mesmo que esse alguém fosse eu."),
                                         FakeBookPost(
                                            perfilImage: .godo, image: .dragonSlayer, name: "Godo",
        description: "\tEla era muito grande para ser chamada de espada, era gigantesca, pesada e muito grosseira. Era, de fato, um maciço de ferro.")]
    private var stories: [FakeBookStory] = [
        FakeBookStory(image: UIImage(named: "Story_0"), name: "Lero Lero"),
        FakeBookStory(image: UIImage(named: "Story_1"), name: "Pin Pin Style"),
        FakeBookStory(image: UIImage(named: "Story_2"), name: "Judeau"),
        FakeBookStory(image: UIImage(named: "Story_3"), name: "Caska")
    ]
    private lazy var navigationCollectionView = FakeBookNavigationCollectionView(
        imageNames: ["house", "person.and.person", "message", "play.tv", "bell"]
    )
    private lazy var statusStackView: FakeBookStatusStackView = {
        let statusStackView = FakeBookStatusStackView(frame: frame)
        return statusStackView
    }()
    private lazy var storiesCollectionView = FakeBookStoriesCollectionView()
    private lazy var storiesStackView: UIStackView = {
        let storiesStackView = UIStackView(arrangedSubviews: [storiesCollectionView])
        storiesStackView.backgroundColor = .reverseDark
        storiesStackView.isLayoutMarginsRelativeArrangement = true
        storiesStackView.layoutMargins = UIEdgeInsets(top: frame.height*0.005,
                                                      left: frame.height*0.01,
                                                      bottom: frame.height*0.005,
                                                      right: 0)
        return storiesStackView
    }()
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
        statusStackView.perfilImage = .gatsu
        storiesCollectionView.fakeBookStories = stories
        scroll.toScrollStackView.addArrangedSubviews([navigationCollectionView, statusStackView, storiesStackView])
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
        storiesStackView.enableAutoLayout
            .shape(height: frame.height*0.2)
    }
}
