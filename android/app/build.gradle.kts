plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    ndkVersion = libs.versions.ndkVersion.get()
    namespace = "com.tudang.recipe"
    compileSdk = libs.versions.compileSdk.get().toInt()
    defaultConfig {
        applicationId = "com.tudang.recipe"
        minSdk = libs.versions.minSdk.get().toInt()
        targetSdk = libs.versions.targetSdk.get().toInt()
        versionCode = libs.versions.appVersionCode.get().toInt()  // Convert to integer if needed
        versionName = libs.versions.appVersionName.get()
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }

    sourceSets {
        getByName("main").java.srcDirs("src/main/kotlin")
    }

    flavorDimensions += "default"
    productFlavors {
        create("development") {
            dimension = "default"
            applicationId = "com.tudang.recipe.dev"
            resValue("string", "app_name", "[DEV] Flutter Template Riverpod")
        }

        create("production") {
            dimension = "default"
            applicationId = "com.tudang.recipe"
            resValue("string", "app_name", "Flutter Template Riverpod")
        }
    }

    buildTypes {
        getByName("release") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}