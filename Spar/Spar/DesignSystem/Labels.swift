//
//  Labels.swift
//  Spar
//
//  Created by Gleb Rasskazov on 04.02.2024.
//

import Foundation

struct Labels {
    struct TabItem {
        static let main = "Главная"
        static let catalog = "Каталог"
        static let cart = "Корзина"
        static let profile = "Профиль"
    }
    
    struct TabBarScreen {
        static let cart = "Cart View"
        static let catalog = "Catalog View"
        static let profile = "Catalog View"
    }
    
    struct ProductDetails {
        static let description = "Описание"
        static let characteristics = "Основные характеристики"
        static let showAllCharacteristics = "Все характеристики"
        static let hideAllCharacteristics = "Свернуть"
        static let noReviews = "У товара пока нет оценок и отзывов"
        static let beFirst = "Станьте первым! Вы можете оценить товар, нажав на кнопку ниже"
        static let reviews = "Отзывы"
        static let all = "Все"
        static let sendReview = "Оставить отзыв"
        static let countOfReviews = "отзывов"
    }
    
    struct Hint {
        static let new = "Новинка"
        static let priceHit = "Удар по ценам"
        static let superPrice = "Супер цена"
        static let cardPrice = "Цена по карте"
        static let cheaperOnline = "Онлайн дешевле"
    }
}
