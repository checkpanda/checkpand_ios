//
// Created by Takagi Yuki on 2018/03/29.
// Copyright (c) 2018 checkpanda. All rights reserved.
//

import Eureka
import Cosmos

open class StarRatingCell: Cell<Double>, CellType {

    lazy private var cosmosRating: CosmosView = {
        return CosmosView()
    }()

    private var starRatingRow: StarRatingRow {
        return row as! StarRatingRow
    }

    open override func setup() {
        super.setup()
        selectionStyle = .none

        cosmosRating.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(cosmosRating)
        height = {44}

        let topConstraint = NSLayoutConstraint(item: cosmosRating, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        let leadingConstraint = NSLayoutConstraint(item: cosmosRating, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1.0, constant: -10.0)


        contentView.addConstraints([topConstraint, leadingConstraint])
        cosmosRating.rating = starRatingRow.rating

        if starRatingRow.text != nil {
            cosmosRating.text = starRatingRow.text!
        }

        if starRatingRow.fillMode != nil {
            cosmosRating.settings.fillMode = starRatingRow.fillMode!
        }

        if starRatingRow.starSize != nil {
            cosmosRating.settings.starSize = starRatingRow.starSize!
        }

        if starRatingRow.starMargin != nil {
            cosmosRating.settings.starMargin = starRatingRow.starMargin!
        }

        if starRatingRow.filledColor != nil {
            cosmosRating.settings.filledColor = starRatingRow.filledColor!
        }

        if starRatingRow.emptyBorderColor != nil {
            cosmosRating.settings.emptyBorderColor = starRatingRow.emptyBorderColor!
        }

        if starRatingRow.filledBorderColor != nil {
            cosmosRating.settings.filledBorderColor = starRatingRow.filledBorderColor!
        }

        if starRatingRow.totalStars != nil {
            cosmosRating.settings.totalStars = starRatingRow.totalStars!
        }

        cosmosRating.didFinishTouchingCosmos = {[weak self] rating in
            self?.row.value = rating
            self?.starRatingRow.setRating(rating)
        }

    }

    open override func update() {
        super.update()
        cosmosRating.text = starRatingRow.text
        cosmosRating.rating = starRatingRow.rating
    }
}


final class StarRatingRow: Row<StarRatingCell>, RowType {

    var fillMode: StarFillMode? = nil
    var starSize: Double? = nil
    var starMargin: Double? = nil
    var filledColor: UIColor? = nil
    var emptyBorderColor: UIColor? = nil
    var filledBorderColor: UIColor? = nil
    var rating: Double = 0
    var text: String? = nil
    var totalStars: Int? = nil

    internal func setRating(_ rate: Double) {
        rating = rate
    }

    required init(tag: String?) {
        super.init(tag: tag)
    }
}