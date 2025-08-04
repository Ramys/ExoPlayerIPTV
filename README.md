(cd "$(git rev-parse --show-toplevel)" && git apply --3way <<'EOF'
diff --git a/README.md b/README.md
--- a/README.md
+++ b/README.md
@@ -1,62 +1,222 @@
-# ExoPlayer #
-
-ExoPlayer is an application level media player for Android. It provides an
-alternative to Android’s MediaPlayer API for playing audio and video both
-locally and over the Internet. ExoPlayer supports features not currently
-supported by Android’s MediaPlayer API, including DASH and SmoothStreaming
-adaptive playbacks. Unlike the MediaPlayer API, ExoPlayer is easy to customize
-and extend, and can be updated through Play Store application updates.
-
-## Documentation ##
-
-* The [developer guide][] provides a wealth of information to help you get
-  started.
-* The [class reference][] documents the ExoPlayer library classes.
-* The [release notes][] document the major changes in each release.
-
-[developer guide]: https://google.github.io/ExoPlayer/guide.html
-[class reference]: https://google.github.io/ExoPlayer/doc/reference
-[release notes]: https://github.com/google/ExoPlayer/blob/dev-v2/RELEASENOTES.md
-
-## Using ExoPlayer ##
-
-The easiest way to get started using ExoPlayer is to add it as a gradle
-dependency. You need to make sure you have the jcenter repository included in
-the `build.gradle` file in the root of your project:
-
-```gradle
-repositories {
-    jcenter()
-}
-```
-
-Next, include the following in your module's `build.gradle` file:
-
-```gradle
-compile 'com.google.android.exoplayer:exoplayer:rX.X.X'
-```
-
-where `rX.X.X` is the your preferred version. For the latest version, see the
-project's [Releases][]. For more details, see the project on [Bintray][].
-
-[Releases]: https://github.com/google/ExoPlayer/releases
-[Bintray]: https://bintray.com/google/exoplayer/exoplayer/view
-
-## Developing ExoPlayer ##
-
-#### Project branches ####
-
-  * The project has `dev-vX` and `release-vX` branches, where `X` is the major
-    version number.
-  * Most development work happens on the `dev-vX` branch with the highest major
-    version number. Pull requests should normally be made to this branch.
-  * Bug fixes may be submitted to older `dev-vX` branches. When doing this, the
-    same (or an equivalent) fix should also be submitted to all subsequent
-    `dev-vX` branches.
-  * A `release-vX` branch holds the most recent stable release for major version
-    `X`.
-
-#### Using Android Studio ####
-
-To develop ExoPlayer using Android Studio, simply open the ExoPlayer project in
-the root directory of the repository.
+# ExoPlayer Demo - Android 13 Compatible
+
+Este é um projeto ExoPlayer atualizado para ser compatível com Android 13 e inclui um sistema de login funcional.
+
+## Características
+
+- ✅ Compatível com Android 13 (API 33)
+- ✅ Atualizado para AndroidX
+- ✅ Sistema de login funcional
+- ✅ Material Design
+- ✅ Gradle 8.4
+- ✅ Android Gradle Plugin 8.1.4
+- ✅ Menu de opções com configurações
+- ✅ Sistema de preferências
+- ✅ Auto-login configurável
+- ✅ Funcionalidade de logout
+- ✅ Interface moderna e intuitiva
+
+## Credenciais de Teste
+
+**Usuário:** `admin`  
+**Senha:** `admin`
+
+## Estrutura do Projeto
+
+```
+├── demo/                          # Aplicativo principal
+│   ├── src/main/
+│   │   ├── java/
+│   │   │   └── com/google/android/exoplayer2/demo/
+│   │   │       ├── LoginActivity.java      # Tela de login
+│   │   │       ├── SampleChooserActivity.java
+│   │   │       ├── PlayerActivity.java
+│   │   │       └── MediaCodecPlayer.java
+│   │   ├── res/
+│   │   │   ├── layout/
+│   │   │   │   └── activity_login.xml      # Layout da tela de login
+│   │   │   └── values/
+│   │   │       ├── strings.xml
+│   │   │       ├── colors.xml
+│   │   │       └── styles.xml
+│   │   └── AndroidManifest.xml
+│   └── build.gradle
+├── library/                       # Biblioteca ExoPlayer
+├── extensions/                    # Extensões do ExoPlayer
+│   ├── ffmpeg/
+│   ├── flac/
+│   ├── opus/
+│   ├── vp9/
+│   └── okhttp/
+└── build.gradle                  # Configuração principal
+```
+
+## Como Compilar
+
+### Pré-requisitos
+
+- Android SDK 33
+- Java 8 ou superior
+- Gradle 8.4
+
+### Compilação
+
+```bash
+# Limpar o projeto
+./gradlew clean
+
+# Compilar o APK de debug
+./gradlew :demo:assembleNoExtensionsDebug
+
+# O APK será gerado em:
+# demo/buildout/outputs/apk/noExtensions/debug/demo-noExtensions-debug.apk
+```
+
+## Como Instalar no Android 13
+
+1. **Habilitar Instalação de Fontes Desconhecidas:**
+   - Vá em Configurações > Segurança e privacidade
+   - Ative "Instalar apps desconhecidos"
+   - Ou vá em Configurações > Apps > Configurações especiais de app > Instalar apps desconhecidos
+
+2. **Instalar o APK:**
+   ```bash
+   # Via ADB (recomendado)
+   adb install demo/buildout/outputs/apk/noExtensions/debug/demo-noExtensions-debug.apk
+   
+   # Ou transfira o APK para o dispositivo e instale manualmente
+   ```
+
+3. **Executar o App:**
+   - Abra o aplicativo
+   - Use as credenciais: `admin` / `admin`
+   - Após o login, você terá acesso ao player de mídia
+
+## Funcionalidades do App
+
+### 🔐 Sistema de Login
+- Tela de login com Material Design
+- Validação de credenciais
+- Auto-login configurável
+- Persistência de estado
+
+### ⚙️ Configurações
+- Menu de opções (3 pontos)
+- Tela de configurações completa
+- Preferências de auto-login
+- Configurações do player
+- Informações do app
+
+### 🎬 Player de Mídia
+- Reprodução de vídeo e áudio
+- Suporte a múltiplos formatos
+- Controles de reprodução
+- Interface otimizada
+
+### 🔄 Logout
+- Funcionalidade de logout
+- Confirmação antes de sair
+- Retorno à tela de login
+
+## Principais Atualizações Realizadas
+
+### 1. Atualização de Dependências
+- Android Gradle Plugin: 2.2.1 → 8.1.4
+- Gradle: 2.14.1 → 8.4
+- AndroidX em vez de Support Library
+- Material Design Components
+
+### 2. Configurações Android 13
+- `targetSdkVersion`: 33
+- `compileSdkVersion`: 33
+- Permissões atualizadas para Android 13
+- `android:exported` explícito em todas as activities
+
+### 3. Sistema de Login
+- Tela de login com Material Design
+- Validação de credenciais
+- Persistência de estado de login
+- Navegação automática após login
+
+### 4. Correções de Compatibilidade
+- Namespace em todos os módulos
+- Remoção de atributos `package` obsoletos
+- Substituição de `android.support.annotation` por `androidx.annotation`
+- Configuração de flavor dimensions
+
+## Permissões
+
+O aplicativo requer as seguintes permissões:
+
+- `INTERNET` - Para reprodução de mídia online
+- `READ_EXTERNAL_STORAGE` - Para arquivos locais (Android < 13)
+- `READ_MEDIA_AUDIO` - Para áudio (Android 13+)
+- `READ_MEDIA_VIDEO` - Para vídeo (Android 13+)
+- `READ_MEDIA_IMAGES` - Para imagens (Android 13+)
+- `ACCESS_NETWORK_STATE` - Para verificação de conectividade
+- `WAKE_LOCK` - Para reprodução em background
+
+## Troubleshooting
+
+### Erro de Compilação
+Se encontrar erros de compilação:
+
+1. Verifique se o Android SDK 33 está instalado
+2. Execute `./gradlew clean` antes de compilar
+3. Verifique se o Java 8+ está sendo usado
+
+### Erro de Instalação
+Se o APK não instalar:
+
+1. Verifique se a instalação de apps desconhecidos está habilitada
+2. Tente instalar via ADB: `adb install -r demo.apk`
+3. Verifique se o dispositivo tem espaço suficiente
+
+### Problemas de Login
+Se o login não funcionar:
+
+1. Use exatamente: usuário `admin`, senha `admin`
+2. Verifique se o app tem permissões de armazenamento
+3. Limpe os dados do app se necessário
+
+## Scripts Disponíveis
+
+### 🚀 install.sh
+Script de instalação automática:
+```bash
+./install.sh
+```
+
+### 🧪 test_app.sh
+Script de teste do aplicativo:
+```bash
+./test_app.sh
+```
+
+### 🔨 Compilação Manual
+```bash
+./gradlew :demo:assembleNoExtensionsDebug
+```
+
+## Desenvolvimento
+
+Para desenvolvimento adicional:
+
+1. **Adicionar novas funcionalidades:**
+   - Modifique as activities existentes
+   - Adicione novos layouts em `demo/src/main/res/layout/`
+   - Atualize strings em `demo/src/main/res/values/strings.xml`
+
+2. **Modificar o sistema de login:**
+   - Edite `LoginActivity.java`
+   - Modifique `activity_login.xml` para mudanças visuais
+   - Atualize as credenciais em `LoginActivity.java`
+
+3. **Adicionar extensões:**
+   - As extensões estão em `extensions/`
+   - Ative-as no `build.gradle` do demo se necessário
+
+## Licença
+
+Este projeto é baseado no ExoPlayer original do Google e mantém a mesma licença Apache 2.0.
+
EOF
)