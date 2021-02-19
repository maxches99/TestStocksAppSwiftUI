//
//  ProgressiveView.swift
//  TestWeatherAppSwiftUI
//
//  Created by Max Chesnikov on 18.02.2021.
//

import SwiftUI

struct ProgressiveView: View {
    
    typealias ErrorViewActionHandler = () -> Void
    
    let state: ResultState
    
    var body: some View {
        VStack {
            ProgressView()
            Text(state.title)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
                .padding(.horizontal, 16)
        }
    }
}

struct ProgressiveView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressiveView(state: .loading)
            .previewLayout(.sizeThatFits)
    }
}
