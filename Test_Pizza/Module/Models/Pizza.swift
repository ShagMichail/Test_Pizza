//
//  File.swift
//  Test_Pizza
//
//  Created by Михаил Шаговитов on 13.10.2022.
//

import UIKit

struct Pizza: Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var image: String
    var cost: String
}

let pizzas = [
    Pizza(name: "Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", image: "hamAndMushrooms", cost: "350"),
    Pizza(name: "Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", image: "bavarianSausages", cost: "350"),
    Pizza(name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", image: "tenderSalmon", cost: "350"),
    Pizza(name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", image: "pizzaFourCheeses", cost: "350"),
    Pizza(name: "Ветчина и грибы", description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус", image: "hamAndMushrooms", cost: "350"),
    Pizza(name: "Баварские колбаски", description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус", image: "bavarianSausages", cost: "350"),
    Pizza(name: "Нежный лосось", description: "Лосось, томаты черри, моцарелла, соус песто", image: "tenderSalmon", cost: "350"),
    Pizza(name: "Пицца четыре сыра", description: "Соус Карбонара, Сыр Моцарелла, Сыр Пармезан, Сыр Роккфорти, Сыр Чеддер (тёртый)", image: "pizzaFourCheeses", cost: "350"),
]
