//
//  ContentView.swift
//  pinnacle-sdk-demo-ios
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    @State private var isPresented: Bool = false

    var body: some View {
        List {
            Section {
                Text(vm.status)
            } header: {
                Text("Status")
            }
            if let v = vm.altContext {
                Section {
                    if let x = v.userPressure {
                        HStack {
                            Text("userPressure:")
                            Spacer()
                            Text(String(format: "%.3f [hPa]", x/100))
                        }
                    }
                    if let x = v.height {
                        HStack {
                            Text("height:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightUncertainty68 {
                        HStack {
                            Text("heightUncertainty68:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightUncertainty90 {
                        HStack {
                            Text("heightUncertainty90:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightUncertainty95 {
                        HStack {
                            Text("heightUncertainty95:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightAboveTerrain {
                        HStack {
                            Text("heightAboveTerrain:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightHatUncertainty68 {
                        HStack {
                            Text("heightHatUncertainty68:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightHatUncertainty90 {
                        HStack {
                            Text("heightHatUncertainty90:")
                            Spacer()
                            Text(String(format: "%.1f [m]", x))
                        }
                    }
                    if let x = v.heightHatUncertainty95 {
                        HStack {
                            Text("heightHatUncertainty95:")
                            Spacer()
                            Text(String(format: "%.1f [m]",  x))
                        }
                    }
                    if let x = v.floorNumber {
                        HStack {
                            Text("floorNumber:")
                            Spacer()
                            Text(String(x))
                        }
                    }
                    if let x = v.floorConfidence {
                        HStack {
                            Text("floorConfidence:")
                            Spacer()
                            Text(String(format: "%.1f", x))
                        }
                    }
                    if let x = v.address {
                        HStack {
                            Text("address:")
                            Spacer()
                            Text(x)
                        }
                    }
                    if let x = v.addressConfidence {
                        HStack {
                            Text("addressConfidence:")
                            Spacer()
                            Text(String(format: "%.1f",  x))
                        }
                    }

                    if let x = v.statusCode {
                        HStack {
                            Text("statusCode:")
                            Spacer()
                            Text(String(format: "%d",  x))
                        }
                    }
                    if let x = v.warningCode {
                        HStack {
                            Text("warningCode:")
                            Spacer()
                            Text(String(format: "%d", x))
                        }
                    }
                    if let x = v.errorCode {
                        HStack {
                            Text("errorCode:")
                            Spacer()
                            Text(String(format: "%d", x))
                        }
                    }
                    if let x = v.baroCalRequired {
                        HStack {
                            Text("baroCalRequired:")
                            Spacer()
                            Text(String(x))
                        }
                    }
                    HStack {
                        Text("timestampOfAltitude:")
                        Spacer()
                        Text(String(v.timestampOfAltitude))
                    }
                } header: {
                    Text("Result")
                }
            }
        }.fullScreenCover(isPresented: $isPresented) {
            MyViewControllerRepresentable()
        }
        HStack {
            Button("計測スタート") {
                vm.startMeasurement()
            }.padding()
             .accentColor(Color.white)
             .background(Color.blue)
            Button("キャリブレーション") {
                isPresented = true
            }.padding()
             .accentColor(Color.white)
             .background(Color.blue)
        }.padding()
    }
    
}

#Preview {
    ContentView()
}

    
import UIKit

struct MyViewControllerRepresentable: UIViewControllerRepresentable {
    typealias UIViewControllerType = UIViewController
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    }
}
