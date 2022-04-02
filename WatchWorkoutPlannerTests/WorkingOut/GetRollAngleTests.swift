//
//  GetRollAngleTests.swift
//  WatchWorkoutPlannerTests
//

import XCTest
@testable import WatchWorkoutPlanner_Extension

class GetRollAngleTests: XCTestCase {

    var roll: [Double]!

    override func setUpWithError() throws {
        try super.setUpWithError()
        
        roll = [1.8643666735951638, 1.8638431506040245, 1.8711294655872162, 1.8847209274500576, 1.903563356105058, 1.9265057880395509, 1.9516214459250745, 1.9764283189462843, 2.002175195537568, 2.0326137833901123, 2.0645047850109504, 2.09675915609251, 2.132775780370776, 2.17093526582509, 2.209529402156095, 2.2508620203771175, 2.298903917096278, 2.350979738071865, 2.401056561809133, 2.4490792023915486, 2.4988282992093533, 2.5474864190373245, 2.5936242503095466, 2.641650146584726, 2.691333913400108, 2.73993459723488, 2.789825203123534, 2.8434664276051613, 2.898811536164706, 2.950964630464783, 3.0035094457583527, 3.058586617514131, 3.1156808490671692, 3.1115840063525315, 3.0558994149778584, 3.0008383602127715, 2.9476229425447626, 2.8943010919370935, 2.841518522110435, 2.7909447307748163, 2.7437188644022115, 2.6957979396081373, 2.6454183521570016, 2.600906359584272, 2.563139930728791, 2.5240779672172544, 2.4808380765152624, 2.44093660374285, 2.4100630257885194, 2.3799812987980693, 2.3448478448059604, 2.3070865178135493, 2.2726269061330995, 2.2421817323125457, 2.210474949549034, 2.1756101980723823, 2.142155864990507, 2.113330204527053, 2.085231798157648, 2.0570350784595823, 2.0317220541234793, 2.0095252188464023, 1.9877677479625222, 1.9657539849752932, 1.9439644910307334, 1.9223622544390024, 1.9020775390461127, 1.8835407642220225, 1.8664450215233046, 1.8524962152526425, 1.8413786667775913, 1.8314800188952194, 1.8223842803698203, 1.8155020697034605, 1.8103218657927982, 1.8068474639017673, 1.8067562501414216, 1.8114006983580833, 1.8197458139975276, 1.8333873552170776, 1.8521474239399698, 1.8750367502687415, 1.900155911235651, 1.9290346054911462, 1.964384328139023, 2.004799248836722, 2.047875723297141, 2.094304264028003, 2.145554665406854, 2.20047704296604, 2.258928672160788, 2.3177900533634936, 2.378856173713748, 2.4488654990404455, 2.5237159939203524, 2.5983960448131906, 2.674687666716732, 2.754569592377815, 2.835577456548441, 2.9183301444766614, 3.000871358226078, 3.082336406672432, 3.1210523167755775, 3.0424124686690015, 2.9656454935726706, 2.890714397874786, 2.819145282459061, 2.7506772791469203, 2.684382148624603, 2.621205109357219, 2.5607397151278155, 2.5044475420918353, 2.4548047031492413, 2.408756427980153, 2.365161285570811, 2.320564303138322, 2.2793962412238646, 2.2421782981927714, 2.202892903803354, 2.162767692554511, 2.126632013921777, 2.0945576777424106, 2.0630943049953756, 2.0313103650370183, 2.0013019461064423, 1.9729035041598946, 1.946703342456607, 1.9217771397671353, 1.8975580841902113, 1.873789389238926, 1.8539779547060116, 1.8415848047889058, 1.8358687402153706]
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()

        roll = nil
    }

    func testGetRollAngle() throws {
        let rollAngle = getRollAngle(roll: roll)

        XCTAssertTrue(rollAngle == 147.02863440609073)
    }
    
    func testGetRollAngleEmpty() throws {
        let rollAngle = getRollAngle(roll: [])

        XCTAssertTrue(rollAngle == 0.0)
    }
}
