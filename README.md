🚀 Features
✔ Fetch all products from public API
✔ Extract unique categories from product list
✔ Display categories in a clean GridView
✔ Tap a category → Show filtered product list
✔ Tap a product → Navigate to Product Detail Screen
✔ Smooth architecture using Provider
✔ Reusable API client
✔ Fully responsive UI


🏗 Project Architecture (Feature-Based)
This structure separates:

Data layer → API, models

Provider layer → State management

UI/Presentation layer → Screens
🧠 State Management — Provider

ProductProvider loads the products

Extracts unique categories from the product list

Filters products based on the selected category

Notifies UI using ChangeNotifier

This ensures:

Clean separation of concerns

Easy testing

Scalable architecture
