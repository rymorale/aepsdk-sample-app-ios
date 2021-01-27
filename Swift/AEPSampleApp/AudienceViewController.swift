/*
 Copyright 2021 Adobe
 All Rights Reserved.
 
 NOTICE: Adobe permits you to use, modify, and distribute this file in
 accordance with the terms of the Adobe license agreement accompanying
 it.
 */

import UIKit
import SwiftUI
// step-audience-start
import AEPAudience
// step-audience-end
import AEPCore

class AudienceViewController: UIHostingController<AudienceView> {}

struct AudienceView: View {
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 12) {
            VStack {
                Text("Audience Manager API").bold()
                Button(action: {
                    // step-audience-start
                    Audience.signalWithData(data: ["":""]) { (traits, error) in
                        print("returned traits: \(String(describing: traits))")
                        if(error.localizedDescription != "") {
                            print("audience signal with data error: \(error.localizedDescription)")
                        }
                    }
                    // step-audience-end
                }){
                    Text("Signal With Data")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.caption)
                }.cornerRadius(5)
                Button(action: {
                    // step-audience-start
                    Audience.getVisitorProfile { (retrievedProfile, error) in
                        print("retrieved profile: \(String(describing: retrievedProfile))")
                        if(error.localizedDescription != "") {
                            print("audience get visitor profile error: \(error.localizedDescription)")
                        }
                    }
                    // step-audience-end
                }){
                    Text("Get Visitor Profile")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.caption)
                }.cornerRadius(5)
                Button(action: {
                    // step-audience-start
                    Audience.reset()
                    // step-audience-end
                }){
                    Text("Reset")
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .font(.caption)
                }.cornerRadius(5)
            }
        }.padding().onAppear() {
            MobileCore.track(state: "AudienceView", data:nil)
        }
    }
}
