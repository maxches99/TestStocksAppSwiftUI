//
//  StockView.swift
//  TestWeatherAppSwiftUI
//
//  Created by Max Chesnikov on 17.02.2021.
//

import SwiftUI
import Neumorphic
import SwiftUICharts

struct StockView: View {
	typealias StockViewActionHandler = () -> Void
	typealias StockViewActionHandlerOutputString = (String) -> Void
	
	let stock: StockResponse
	@State var finderString: String = ""
	
	let handler: StockViewActionHandler
	let handlerOutputString: StockViewActionHandlerOutputString
	
	internal init(stock: StockResponse,
				  handler: @escaping StockView.StockViewActionHandler,
				  handlerOutputString: @escaping StockViewActionHandlerOutputString) {
		self.stock = stock
		self.handler = handler
		self.handlerOutputString = handlerOutputString
	}
	
	var body: some View {
		ScrollView{
			Text("Эти ебаные акции")
				.font(.system(size: 28, weight: .bold))
				.padding(.top, 16)
			VStack {
				HStack {
					Image(systemName: "magnifyingglass").foregroundColor(Color.Neumorphic.secondary).font(Font.body.weight(.bold))
					TextField("Найди свою ублюдскую компанию", text: $finderString, onCommit: {
						self.handlerOutputString(finderString)
					})
					.foregroundColor(Color.Neumorphic.secondary)
				}
				.padding()
				.background(
					RoundedRectangle(cornerRadius: 30).fill(Color.white)
						.softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
				)
			}
			.padding()
			ZStack(alignment: .leading){
				HStack(alignment: .center, spacing: 4) {
					Text(stock.name)
						.foregroundColor(.black)
						.font(.system(size: 28, weight: .semibold))
						.padding(.leading, 16)
					Spacer()
					HStack {
						Text("\(stock.current ?? 0)")
							.foregroundColor(.gray)
							.font(.system(size: 18, weight: .light))
							.padding(.trailing, 16)
					}
					
				}
				.frame(maxHeight: 60)
				.background(
					RoundedRectangle(cornerRadius: 30).fill(Color.white)
						.softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
				)
			}.frame(maxHeight: 60)
			.padding()
			Spacer()
			VStack(alignment: .center, spacing: 16) {
				LineChartView(data: [stock.open!, stock.low!, stock.high!, stock.current!], title: "Блять", legend: "Ебаный график", form: ChartForm.extraLarge, dropShadow: false)
				BarChartView(data: .init(points: [stock.open!, stock.low!, stock.high!, stock.current!]), title: "Пиздец", legend: "Ебаные палки", style: Styles.pieChartStyleOne, form: ChartForm.extraLarge, dropShadow: false)
				PieChartView(data: [stock.open!, stock.low!, stock.high!, stock.current!], title: "Сука", legend: "Ебаный круг", form: ChartForm.extraLarge, dropShadow: false)
//					.padding(.bottom)
			}
			.padding()
			.background(
				RoundedRectangle(cornerRadius: 30).fill(Color.white)
					.softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
				
			)
			Spacer()
			HStack(alignment: .center, spacing: 4) {
				Text("Текущий пиздец:")
					.font(.system(size: 18, weight: .medium))
				Text("\(stock.high ?? 0)")
					.font(.system(size: 18, weight: .medium))
			}
			.padding()
			.frame(maxHeight: 60)
			.background(
				RoundedRectangle(cornerRadius: 30).fill(Color.white)
					.softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.Neumorphic.darkShadow, lightShadow: Color.Neumorphic.lightShadow, spread: 0.05, radius: 2)
			)
		}
		
	}
}

struct StockView_Previews: PreviewProvider {
	static var previews: some View {
		StockView(stock: StockResponse.dummyData, handler: {}, handlerOutputString: {_ in })
			.previewLayout(.sizeThatFits)
	}
}
