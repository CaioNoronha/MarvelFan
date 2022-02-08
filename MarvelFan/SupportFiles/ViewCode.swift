protocol ViewCode {
    func build()
    func setupConstrains()
    func configure()
}

extension ViewCode {
    
    func configureViews() {}
    
    func setup() {
        build()
        setupConstrains()
        configure()
    }
}
