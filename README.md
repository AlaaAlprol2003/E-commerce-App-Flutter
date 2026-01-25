# E-Commerce Flutter App

A comprehensive e-commerce mobile application built with Flutter. This project demonstrates a full-fledged online shopping experience, including user authentication, product browsing by categories and brands, cart management, wishlist functionality, and more. It follows Clean Architecture principles with separation of concerns using repositories, use cases, data sources, and Bloc for state management.

## Features

- **User Authentication**: Login and registration with email and password validation.
- **Product Browsing**: View products by categories, sub-categories, and brands.
- **Cart Management**: Add/remove/update products in the cart, clear cart, and view cart summary.
- **Wishlist**: Add/remove products to/from wishlist and view favorites.
- **Product Details**: Detailed view with images carousel, size/color selection, quantity adjustment, and add to cart.
- **Categories and Brands**: Dynamic loading of categories, sub-categories, and brands.
- **Search**: Custom search functionality across products.
- **UI Components**: Custom widgets for buttons, text fields, animations (using Lottie and AnimatedTextKit), and more.
- **Error Handling**: Robust error management with custom exceptions and failure states.
- **Persistent Storage**: Token storage using SharedPreferences for authentication.
- **API Integration**: Uses Dio for HTTP requests to backend endpoints (e.g., for products, cart, wishlist).

## Architecture

The app follows a Clean Architecture pattern:
- **Domain Layer**: Entities (e.g., `CategoryEntity`, `ProductEntity`), Use Cases (e.g., `GetProductsUseCase`, `AddToCartUseCase`), Repositories (abstract interfaces).
- **Data Layer**: Remote Data Sources (API calls using Dio), Local Data Sources (SharedPreferences), Models (JSON serialization).
- **Presentation Layer**: Screens (e.g., `LoginScreen`, `ProductDetailsScreen`), Widgets (custom UI components), Cubits (Bloc state management, e.g., `ProductsCubit`, `CartCubit`).
- **Dependency Injection**: Uses `injectable` package for managing dependencies.
- **State Management**: Flutter Bloc for handling UI states (loading, success, error).
- **Routing**: Custom route management with named routes (e.g., `Routes.login`, `Routes.cartScreen`).
- **Networking**: Base URL and endpoints defined in constants (e.g., `ApiConstatnt.baseUrl`).
- **Error Handling**: Uses `dart_either` for handling successes and failures.

## Key Files and Components

Here’s a summary of the provided files:

### Authentication
- `auth_cubit.dart`: Manages login and registration states using Bloc.
- `auth_repository.dart` & `auth_repository_impl.dart`: Handles auth logic.
- `login_request.dart` & `login_response.dart`: Models for login.
- `register_request.dart` & `register_response.dart`: Models for registration.
- `auth_remote_data_source.dart` & `auth_api_remote_data_source.dart`: API calls for auth.
- `auth_local_data_source.dart` & `auth_shared_prefs_local_data_source.dart`: Token storage.
- `login_use_case.dart` & `register_use_case.dart`: Use cases for auth.
- `login_screen.dart` & `register_screen.dart`: UI screens for login/register.

### Products
- `products_cubit.dart`: Bloc for fetching products.
- `products_repository.dart`: Abstract repo for products.
- `products_remote_data_source.dart` & `products_api_remote_data_source.dart`: API data sources.
- `get_products_use_case.dart`: Use case for getting products.
- `product_screen.dart`: Screen for listing products.
- `products_by_brand_screen.dart`: Screen for products by brand.
- `products_by_brand_cubit.dart` & `products_by_brand_use_case.dart`: Bloc and use case for brand-specific products.
- `products_remote_data_source_by_brand.dart` & `products_api_remote_data_source_by_brand.dart`: Data sources for brand products.

### Cart
- `cart_cubit.dart` (assuming from context, as `product_details_cubit.dart` is empty but referenced).
- `cart_repository.dart`: Abstract repo for cart operations.
- `cart_remote_data_source.dart` & `cart_api_remote_data_source.dart`: API for cart.
- `add_to_cart_use_case.dart`, `get_cart.dart`, `update_cart_product_quality_use_case.dart`, `delete_product_from_cart.dart`, `clear_cart_use_case.dart`: Use cases for cart actions.
- `cart_screen.dart`: UI for cart view.

### Wishlist/Favorites
- `wishlist_cubit.dart`: Bloc for wishlist.
- `wishlist_repository.dart` (inferred from use cases).
- `wishlist_remote_data_source.dart` & `wishlist_api_remote_data_source.dart`: API for wishlist.
- `add_to_wishlist_use_case.dart`, `get_wishlist_use_case.dart`, `delete_product_use_case.dart`: Use cases.
- `favorite_tab.dart`: Screen for favorites.

### Categories & Brands
- `categories_cubit.dart`: Bloc for categories.
- `categories_repository.dart`: Repo for categories.
- `categories_remote_data_source.dart` & `categories_api_remote_data_source.dart`: Data sources.
- `get_categories_use_case.dart`: Use case.
- `sub_categories_cubit.dart` & `get_sub_categories_use_case.dart`: For sub-categories.
- `sub_categories_remote_data_source.dart` & `sub_categories_api_remote_data_source.dart`: Data sources.
- `brands_cubit.dart`: Bloc for brands.
- `brands_repository.dart`: Repo for brands.
- `brands_remote_data_source.dart` & `brands_api_remote_data_source.dart`: Data sources.
- `brands_use_case.dart`: Use case.
- `categories_tab.dart`: UI tab for categories.

### UI Widgets & Screens
- `main_layout.dart`: Main app layout with bottom navigation.
- `home_tap.dart`: Home tab with ads, categories, brands.
- `profile_tab.dart`: Profile tab.
- `product_details_screen.dart`: Detailed product view.
- `splash_screen.dart`: Splash screen.
- Custom Widgets: `category_item.dart`, `brand_item.dart`, `sub_category_item.dart`, `cart_item.dart` (inferred), `custom_add_widget.dart`, `custom_app_bar.dart`, `custom_bottom_nav_bar.dart`, `custom_dot_widget.dart`, `custom_elevated_button.dart`, `custom_indicator_widget.dart`, `custom_label_text_form_widget.dart` (inferred), `custom_search_section.dart`, `custom_section_widget.dart`, `custom_side_bar.dart`, `custom_text_button.dart`, `custom_text_form_field.dart` (inferred), `custom_text_widget.dart`, `label_text_widget.dart`, `lottie_animation.dart`, `ordered_quantity_widget.dart`, `product_color_widget.dart`, `size_widget.dart`.

### Entities & Models
- `category_entity.dart`, `sub_category_entity.dart` (inferred), `brand_entity.dart`, `product_entity.dart` (inferred).
- Response Models: Various JSON models like `products_response.dart`, `cart_response.dart`, `wishlist_response.dart`, etc.

### Utilities
- `product_details_provider.dart`: ChangeNotifier for product details (quantity, size, color).
- `ad_model.dart`: Model for ads.
- `user_data_shared_prefs.dart` (inferred for user data storage).

## Dependencies

- `flutter_bloc`: For state management.
- `dio`: For API requests.
- `injectable`: For dependency injection.
- `dart_either`: For handling either success or failure.
- `cached_network_image`: For image loading.
- `flutter_screenutil`: For responsive UI.
- `google_fonts`: For custom fonts.
- `animated_text_kit`: For text animations.
- `lottie`: For animations.
- `shared_preferences`: For local storage.
- `carousel_slider`: For image carousels.
- And others (e.g., `flutter/material.dart` core).

## Getting Started

### Prerequisites
- Flutter SDK (version 3.0+ recommended).
- Dart SDK.
- Backend API server (assumed to be running with endpoints like `/products`, `/cart`, etc.).

