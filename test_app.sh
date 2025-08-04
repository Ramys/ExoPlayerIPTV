#!/bin/bash

# Script de teste do ExoPlayer Demo
# Autor: Assistente de IA
# Data: $(date)

echo "🧪 ExoPlayer Demo - Teste de Funcionalidades"
echo "============================================"

# Verificar se o ADB está disponível
if ! command -v adb &> /dev/null; then
    echo "❌ ADB não encontrado. Instale o Android SDK Platform Tools."
    exit 1
fi

# Verificar se há dispositivos conectados
echo "📱 Verificando dispositivos..."
if ! adb devices | grep -q "device$"; then
    echo "❌ Nenhum dispositivo Android encontrado."
    echo "   Conecte um dispositivo via USB e habilite a depuração USB."
    exit 1
fi

# Verificar se o app está instalado
echo "🔍 Verificando se o app está instalado..."
if ! adb shell pm list packages | grep -q "com.google.android.exoplayer2.demo"; then
    echo "❌ App não está instalado. Execute ./install.sh primeiro."
    exit 1
fi

echo "✅ App encontrado!"

# Testar funcionalidades básicas
echo ""
echo "🧪 Executando testes..."

# Teste 1: Abrir o app
echo "📱 Teste 1: Abrindo o app..."
adb shell am start -n com.google.android.exoplayer2.demo/.LoginActivity

# Aguardar um pouco
sleep 3

# Teste 2: Verificar se a tela de login está visível
echo "🔐 Teste 2: Verificando tela de login..."
if adb shell dumpsys window windows | grep -q "LoginActivity"; then
    echo "✅ Tela de login está visível"
else
    echo "❌ Tela de login não está visível"
fi

# Teste 3: Verificar se o app está rodando
echo "🔄 Teste 3: Verificando se o app está rodando..."
if adb shell dumpsys activity activities | grep -q "com.google.android.exoplayer2.demo"; then
    echo "✅ App está rodando corretamente"
else
    echo "❌ App não está rodando"
fi

# Teste 4: Verificar permissões
echo "🔒 Teste 4: Verificando permissões..."
adb shell dumpsys package com.google.android.exoplayer2.demo | grep -E "(permission|granted)" | head -5

echo ""
echo "🎉 Testes concluídos!"
echo ""
echo "📋 Próximos passos manuais:"
echo "   1. Abra o app no dispositivo"
echo "   2. Use as credenciais: admin/admin"
echo "   3. Teste o menu de opções (3 pontos)"
echo "   4. Teste as configurações"
echo "   5. Teste o logout"
echo ""
echo "🔧 Para reinstalar: ./install.sh"
echo "🔧 Para desinstalar: adb uninstall com.google.android.exoplayer2.demo"