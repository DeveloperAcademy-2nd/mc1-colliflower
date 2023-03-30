//
//  JunyooPromptView.swift
//  
//
//  Created by 유정현 on 2023/03/30.
//

import SwiftUI

struct JunyooPromptView: View {
	var body: some View {
		VStack {
			Text("팀원의 성향, 성격, 특징 모두 서로 다르지 않았나요?🧐\n우리는 앞으로도 다른 생각을 가진 러너들과🏃\n 계속해서 협업을 하게 될거예요.🤯\n")
				.font(.system(size: 30))
				.multilineTextAlignment(.center)
			Text("서로간의 다름을 인지하는것🧘‍♀️\n서로간의 의견을 조율하는 것🤝\n팀의 원활한 소통과 협업을 위한🫶\n 중요한 부분임을 모두 잊지말아요!🙏")
				.font(.title)
				.multilineTextAlignment(.center)
			Spacer()
				.frame(height: 150)
			HStack {
				Image("junyoo2")
					.resizable()
					.scaledToFit()
				Image("hazel2")
					.resizable()
					.scaledToFit()
				Image("elcap3")
					.resizable()
					.scaledToFit()
				Image("soda2")
					.resizable()
					.scaledToFit()
				Image("nyla2")
					.resizable()
					.scaledToFit()
			}
		}
	}
}
