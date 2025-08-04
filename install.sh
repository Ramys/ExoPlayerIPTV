#!/bin/bash

# Script de instalação do ExoPlayer Demo para Android 13
# Autor: Assistente de IA
# Data: $(date)

echo "🚀 ExoPlayer Demo - Instalador para Android 13"
echo "=============================================="

# Verificar se o ADB está disponível
if ! command -v adb &> /dev/null; then
    echo "❌ ADB não encontrado. Por favor, instale o Android SDK Platform Tools."
    echo "   Você pode baixar em: https://developer.android.com/studio/releases/platform-tools"
    exit 1
fi

# Verificar se há dispositivos conectados
echo "📱 Verificando dispositivos Android conectados..."
adb devices

# Verificar se há pelo menos um dispositivo
if ! adb devices | grep -q "device$"; then
    echo "❌ Nenhum dispositivo Android encontrado."
    echo "   Por favor, conecte um dispositivo via USB e habilite a depuração USB."
    echo "   Vá em Configurações > Sobre o telefone > Toque 7 vezes no 'Número da versão'"
    echo "   Depois vá em Configurações > Opções do desenvolvedor > Ative 'Depuração USB'"
    exit 1
fi

# Compilar o projeto
echo "🔨 Compilando o projeto..."
if ./gradlew :demo:assembleNoExtensionsDebug; then
    echo "✅ Compilação concluída com sucesso!"
else
    echo "❌ Erro na compilação. Verifique os logs acima."
    exit 1
fi

# Verificar se o APK foi gerado
APK_PATH="demo/buildout/outputs/apk/noExtensions/debug/demo-noExtensions-debug.apk"
if [ ! -f "$APK_PATH" ]; then
    echo "❌ APK não encontrado em: $APK_PATH"
    exit 1
fi

echo "📦 APK gerado: $APK_PATH"

# Instalar o APK
echo "📲 Instalando o APK no dispositivo..."
if adb install -r "$APK_PATH"; then
    echo "✅ Instalação concluída com sucesso!"
    echo ""
    echo "🎉 ExoPlayer Demo instalado com sucesso!"
    echo ""
    echo "📋 Próximos passos:"
    echo "   1. Abra o aplicativo 'ExoPlayer' no seu dispositivo"
    echo "   2. Use as credenciais de teste:"
    echo "      👤 Usuário: admin"
    echo "      🔑 Senha: admin"
    echo "   3. Após o login, você terá acesso ao player de mídia"
    echo ""
    echo "🔧 Para desinstalar: adb uninstall com.google.android.exoplayer2.demo"
    echo "🔧 Para reinstalar: execute este script novamente"
else
    echo "❌ Erro na instalação. Verifique se:"
    echo "   - O dispositivo está conectado"
    echo "   - A depuração USB está ativada"
    echo "   - A instalação de apps desconhecidos está permitida"
    exit 1
fi