//
//  ScrollView.swift
//  sopt-37th-swiftui
//
//  Created by 이나연 on 11/22/25.
//

import SwiftUI

struct ScrollPracticeView: View {
    var body: some View {
        ScrollView {
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 120, height: 120)
                
                Image(systemName: "person.fill")
                    .font(.system(size: 60))
                    .foregroundColor(.gray)
            }
            .padding(.top, 20)
            
            VStack (spacing: 16) {
                nameWithPosition
                ageAndMBTI
                Spacer()
                    .frame(height: 1000)
                hobby
            }
            .padding(.bottom, 10)
            .padding(.horizontal, 20)
            
        }
        
        directMessageButton
            .frame(height: 50)
            .padding(.horizontal, 16)
    }
    
    private var nameWithPosition: some View {
        HStack {
            Text("iOS")
                .font(.subheadline)
            Text("이명진")
                .font(.headline)
                .foregroundStyle(.blue)
            Spacer()
            Text("파트장")
                .foregroundStyle(.gray)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
    }
    
    private var ageAndMBTI: some View {
        HStack {
            Text("97년생")
                .font(.subheadline)
            Spacer()
            Text("ESTP거나 ESTJ")
                .font(.subheadline)
                .foregroundStyle(.indigo)
        }
    }
    
    private var hobby: some View {
        Text("취미는 영상편집, 러닝, 카공 등")
    }
    
    private var directMessageButton: some View {
        Button {
            
        } label: {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(.blue)
                .overlay {
                    Text("디엠 보내기")
                        .foregroundStyle(.white)
                }
        }
    }
}

#Preview {
    ScrollPracticeView()
}
