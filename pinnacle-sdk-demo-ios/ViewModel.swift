//
//  ViewModel.swift
//  pinnacle-sdk-demo-ios
//

import Foundation
import CoreLocation
import NextNavPlus

class ViewModel: ObservableObject {
    @Published var altContext:NNAltitudeContext?
    @Published var status: String = "UNKNOWN"

    init () {
        checkPermissions()
        initPinnacleSDK()
    }
    
    func checkPermissions() {
        
    }
    
    func initPinnacleSDK() {
        print("initPinnacleSDK")
        let baseUrl = "api.nextnav.io"
        let secretKey = Env.API_KEY
        NNSDK.start(
            baseURL: baseUrl,
            secretKey: secretKey,
            location: nil,
            success: onSuccess,
            failure: onFailure
        )
    }
    
    func startMeasurement() {
        print("startMeasurement")
        NNSDK.startAltitudeCalculation(mode: NNAltitudeMode.thirtySeconds) {
            (code, context) in
                self.altContext = context
        }
    }
    
    func onSuccess(code: Int?, x: Int?) {
        status = "Success: \(code!)"
        print(status)
    }

    func onFailure(code: Int?, x: Int?) {
        status = "Failure: \(code!)"
        print(status)
    }
}
