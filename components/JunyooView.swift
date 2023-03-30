import SwiftUI

struct JunyooView: View {
	
	@State var tiltAngle: Angle = .degrees(0)
	@State var tiltedAngle: Angle = .degrees(0)
	@Binding var progress: Double
	@State private var prevProgress: Double = 0
	var length: CGFloat = 400
	var personalLine: CGFloat
	var image: String
	
    var body: some View {
		HStack {
			VStack {
				if progress/3.6 >= personalLine - 5 && progress/3.6 <= personalLine + 5 {
					Image("\(image)2")
						.resizable()
					.frame(width: 100, height: 100)
					Text("⭐️⭐️⭐️⭐️⭐️")
                        .font(.caption)
				} else {
					Image("\(image)1")
						.resizable()
					.frame(width: 100, height: 100)
					Text(String(format: "%.0f", progress / 3.6))
				}
			}
			ProgressView(value: progress, total: 360)
				.progressViewStyle(WithBackgroundProgressViewStyle())
				.frame(width: length/2, height: length/2)
				.rotationEffect(.degrees(tiltAngle.degrees))
				.gesture(DragGesture()
					.onChanged{ v in
						prevProgress = progress
						var theta = (atan2(v.location.x - self.length / 4, self.length / 2 - v.location.y) - atan2(v.startLocation.x - self.length / 4, self.length / 2 - v.startLocation.y)) * 180 / .pi
						if (theta < 0) { theta = theta - theta / 360 }
						
						tiltAngle = .degrees(theta) + tiltedAngle
						progress = prevProgress + tiltAngle.degrees
						if progress > 360 {
							progress = 360
						} else if progress < 0 {
							progress = 0
						}
					}
					.onEnded { v in
						tiltedAngle = tiltAngle
					}
				)
		}
		.padding(50)
    }
}

struct WithBackgroundProgressViewStyle: ProgressViewStyle {
	func makeBody(configuration: Configuration) -> some View {
		ProgressView(configuration)
			.padding()
			.background(Color.gray.opacity(0.25))
			.tint(.green)
			.cornerRadius(5)
	}
}
