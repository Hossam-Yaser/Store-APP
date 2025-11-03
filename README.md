# 🛍️ Store App

A modern and responsive **Flutter Shopping App** that allows users to browse products, view details, and manage their shopping cart with ease.  
Built using **Flutter**, **Dart**, and **Provider state management**, it offers a smooth and visually appealing e-commerce experience.

---

## 🎥 Demo

<img src="demo/ShopAPP.gif"  width="640" height="480" alt="Store App Demo" />

---

## 🚀 Features

- 🛒 **Add, remove, and update** products in your cart  
- 💵 **View total price** dynamically as you add or remove items  
- 🔍 **Search products** by name or category  
- 🌐 **Fetch products from API** with error handling and loading states  
- 📱 **Fully responsive UI** optimized for both Android and iOS  
- ⚡ **Smooth performance** even with large product lists  
- 🧭 **Clean navigation flow** with named routes  

---

## 🧠 Technologies Used

| Category | Technology |
|-----------|-------------|
| Framework | Flutter |
| Language | Dart |
| State Management | Provider / ChangeNotifier |
| API | FakeStoreAPI or custom backend |
| UI | Material 3 Widgets |
| IDE | Android Studio / VS Code |

---

## 🏗️ Project Structure

```
│   constants.dart
│   main.dart
│
├───helper
│       api.dart
│       locallistofproducts.dart
│
├───models
│       product_model.dart
│
├───screens
│       catregory_screen.dart
│       home_screen.dart
│       productdetails_screen.dart
│
├───services
│   ├───get
│   │       allcategories_services.dart
│   │       allproducts_service.dart
│   │       category_products_services.dart
│   │
│   ├───post
│   │       add_product_service.dart
│   │
│   └───put
│           update_product_service.dart
│
└───widgets
    │   categorylistwidget.dart
    │   productcard_widget.dart
    │   products_list_view.dart
    │   showproducts_widget.dart
    │
    ├───addproduct
    │       addproduct.dart
    │       custom_text_field.dart
    │
    ├───cart
    │       cartproductlistview_widget.dart
    │       cartproduct_card_widget.dart
    │       cart_widget.dart
    │       emptycart_widget.dart
    │
    └───favourite
            emptyfavourite.dart
            favouritebody.dart
```

---

## ⚙️ How to Run

1. **Clone this repository:**
   ```bash
   git clone https://github.com/Hossam-Yaser/Store-APP.git
   ```

2. **Navigate to the project directory:**
   ```bash
   cd Store-APP
   ```

3. **Get dependencies:**
   ```bash
   flutter pub get
   ```

4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 💡 Future Improvements

- 🔐 User authentication (login & register)  
- 🧾 Order history and checkout process  
- 🌐 Multi-language support  
- 💳 Payment integration (Stripe / PayPal)  
- ☁️ Backend integration with Firebase  
- 🧠 Dark mode and user preferences  
- 🖼️ Product image caching for better performance  

---

## 🤝 Contributing

Contributions are welcome!  
Feel free to fork this repository and submit a pull request with your improvements.

---

## 👨‍💻 About the Developer

**Hossam Yasser Abdelhady**  
📱 Cross-platform Mobile App Developer | Flutter | Dart  
💼 Passionate about creating modern, efficient, and user-friendly mobile applications.  

* 💼 [LinkedIn](https://www.linkedin.com/in/hossam-yasser-abdelhady/)
* 🐙 [GitHub](https://github.com/Hossam-Yaser)
* ✉️ Email: [hossamabdelhady000@gmail.com](hossamabdelhady000@gmail.com)



### ⭐ If you found this project helpful, don’t forget to star the repo!
