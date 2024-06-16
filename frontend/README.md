# Split frontend

## Work directory
```
frontend/
│
├── android/            # 包含 Android 平台相关的代码和配置
├── build/              # 编译后生成的文件
├── ios/                # 包含 iOS 平台相关的代码和配置
├── lib/                # 包含应用程序的所有Dart代码
│   ├── main.dart       # 应用程序入口文件
├── test/               # 包含测试代码
├── .gitignore          # Git 忽略文件配置
├── .metadata           # 项目元数据
├── pubspec.yaml        # 项目配置文件，包含依赖项等
└── README.md           # 项目说明文件
```

```
lib/
│
├── main.dart     # 应用程序入口文件    
├── screens/      # 包含所有页面
├── services/     # 包含所有与后端的交互
└── widgets/      # 包含所有小部件

```