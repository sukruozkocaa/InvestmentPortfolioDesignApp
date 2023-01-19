//
//  LastSpendingCollectionViewCell.swift
//  CustomApp
//
//  Created by Şükrü Özkoca on 6.01.2023.
//

import UIKit
import AAInfographics

class LastSpendingCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let chartViewWidth  = self.bgView.frame.size.width
        let chartViewHeight = self.bgView.frame.size.height
        
        let aaChartView = AAChartView()
        aaChartView.frame = CGRect(x: 0, y: 60, width: chartViewWidth, height: chartViewHeight)
        self.bgView.addSubview(aaChartView)
        
        let aaChartModel = AAChartModel()
            .chartType(.boxplot)
            .animationType(.easeInQuint)
            .title("TITLE")
            .subtitle("subtitle")
            .dataLabelsEnabled(false)
            .categories(["D","W","M","6M", "TY", "All"])
            .colorsTheme(["#fe117c","#ffc069","#06caf4","#7dffc0"])
            .series([AASeriesElement()
                        .data([7.0, 6.9, 9.5, 14.5, 18.2, 21.5]),
                    AASeriesElement()
                        .data([0.2, 0.8, 5.7, 11.3, 17.0, 22.0]),
                    AASeriesElement()
                        .data([0.9, 0.6, 3.5, 8.4, 13.5, 17.0]),
                    AASeriesElement()
                        .data([3.9, 4.2, 5.7, 8.5, 11.9, 15.2]),])
        aaChartView.aa_drawChartWithChartModel(aaChartModel)
        // Initialization code
    }

}
