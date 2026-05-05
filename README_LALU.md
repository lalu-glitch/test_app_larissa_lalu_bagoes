## Cara jalanin proyek

### Prerequisites

- Flutter SDK `>=3.10.0`
- Android Studio atau VSCode
- Emulator android atau HP fisik

### Setup

# 1. Install dependencies
flutter pub get

# 2. Jalanin aplikasi
flutter run


## Architecture / Structure

Proyek ini pakai **clean architecture** yang terdiri dari tiga layer:
- data
- domain
- presentation

dimana: 
```
lib/
├── core/                  
│   ├── constants/         
│   ├── di/                
│   └── widgets/           
│
├── data/                  
│   ├── models/            
│   ├── repositories/      
│   └── services/          
│
├── domain/                
│   └── repository/        
│
└── presentation/          
    └── screens/
        └── products/
            ├── cubit/     
            ├── pages/     
            └── widgets/   
```

## State Management Approach

Pakai **BLoC/Cubit**


## Assumptions & Trade-offs

### Assumptions
1. **Belum offline support**
2. **Generic Failure type**

### Trade-offs
1. **pakai Cubit daripada Bloc** - lebih simpel 
2. **Belum pagination** 
3. **tidak caching untuk semua item produck** 
