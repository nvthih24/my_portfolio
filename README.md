# 🌟 My Portfolio - Flutter Web

![Flutter](https://img.shields.io/badge/Flutter-3.10.0-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0.0-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/Firebase-Hosting-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)

> **"Code is poetry."** > Đây là trang Portfolio cá nhân của tôi, được xây dựng hoàn toàn bằng **Flutter Web**. Dự án không chỉ là nơi trưng bày các sản phẩm cá nhân mà còn là minh chứng cho khả năng áp dụng **Clean Architecture** và **Responsive Design** trong thực tế.

---

## 📸 Screenshots (Demo)

|                                              **Desktop View**                                               |                                              **Mobile View**                                              |
| :---------------------------------------------------------------------------------------------------------: | :-------------------------------------------------------------------------------------------------------: |
| <img src="https://via.placeholder.com/600x350.png?text=Desktop+Screenshot" width="100%" alt="Desktop View"> | <img src="https://via.placeholder.com/300x550.png?text=Mobile+Screenshot" width="100%" alt="Mobile View"> |

_(Hãy thay thế link ảnh trên bằng ảnh chụp màn hình thực tế của ông)_

---

## ✨ Tính Năng Nổi Bật (Key Features)

- **📱 Responsive Design:** Giao diện tự động thích ứng mượt mà trên mọi thiết bị (Mobile, Tablet, Desktop) nhờ `responsive_framework`.
- **🏗️ Clean Architecture:** Cấu trúc dự án rõ ràng, tách biệt giữa **Domain**, **Data** và **Presentation** layers.
- **🔥 Firebase Integration:**
  - **Firestore:** Quản lý dữ liệu Profile và danh sách Project động.
  - **Hosting:** Deploy trang web trực tiếp trên Firebase Hosting.
- **⚡ State Management:** Sử dụng **Provider** để quản lý trạng thái hiệu quả.
- **💉 Dependency Injection:** Sử dụng **GetIt** để quản lý các phụ thuộc (Service Locator).

---

## 🛠️ Công Nghệ Sử Dụng (Tech Stack)

Tôi đã lựa chọn những thư viện tốt nhất để đảm bảo hiệu năng và khả năng mở rộng:

| Category                 | Technology / Package                                      |
| :----------------------- | :-------------------------------------------------------- |
| **Core**                 | `Flutter`, `Dart`                                         |
| **Architecture**         | **Clean Architecture** (MVVM pattern)                     |
| **State Management**     | `provider`                                                |
| **Dependency Injection** | `get_it`                                                  |
| **Routing**              | `go_router` (hoặc Navigator 2.0)                          |
| **Backend**              | `cloud_firestore`, `firebase_core`                        |
| **UI/UX**                | `responsive_framework`, `flutter_animate`, `google_fonts` |
| **Assets/Icons**         | `font_awesome_flutter`                                    |

---

## 📂 Cấu Trúc Thư Mục (Folder Structure)

Dự án tuân thủ nghiêm ngặt nguyên lý **Clean Architecture**:

```bash
📁 lib/
├── 📁 core
│   ├── 📁 constants
│   │   └── 📄 app_styles.dart
│   ├── 📁 errors
│   ├── 📁 params
│   └── 📁 services
│       └── 📄 injection_container.dart
├── 📁 features
│   └── 📁 home
│       ├── 📁 data
│       │   ├── 📁 datasources
│       │   ├── 📁 models
│       │   └── 📁 repositories
│       │       └── 📄 profile_repository_impl.dart
│       ├── 📁 domain
│       │   ├── 📁 entities
│       │   │   ├── 📄 profile_entity.dart
│       │   │   └── 📄 project_entity.dart
│       │   ├── 📁 repositories
│       │   │   └── 📄 profile_repository.dart
│       │   └── 📁 usecases
│       │       └── 📄 get_profile_usecase.dart
│       └── 📁 presentation
│           ├── 📁 Bloc
│           ├── 📁 pages
│           │   └── 📄 home_page.dart
│           ├── 📁 providers
│           │   └── 📄 profile_provider.dart
│           └── 📁 widgets
│               ├── 📄 footer_section.dart
│               ├── 📄 hero_section.dart
│               ├── 📄 mobile_drawer.dart
│               ├── 📄 nav_bar.dart
│               ├── 📄 project_card.dart
│               └── 📄 projects_section.dart
├── 📄 firebase_options.dart
└── 📄 main.dart
```
