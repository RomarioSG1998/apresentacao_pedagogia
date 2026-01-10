#!/bin/bash

# Script de inicialização do SintaxJavaApp
# Autor: Romario Jala
# Data: 2026-01-10

echo "╔═══════════════════════════════════════════════════════╗"
echo "║          🚀 SintaxJavaApp - Iniciando Servidor         ║"
echo "╚═══════════════════════════════════════════════════════╝"
echo ""

# Cores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verifica se Python3 está instalado
if ! command -v python3 &> /dev/null; then
    echo -e "${YELLOW}⚠️  Python3 não encontrado. Instalando...${NC}"
    sudo apt-get update && sudo apt-get install -y python3
fi

# Limpa a tela
clear

echo -e "${BLUE}📂 Diretório:${NC} $(pwd)"
echo -e "${BLUE}🌐 Porta:${NC} 8000"
echo ""
echo -e "${GREEN}✅ Servidor HTTP iniciado!${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}🔗 Acesse a aplicação em:${NC}"
echo ""
echo -e "   ${BLUE}http://localhost:8000${NC}"
echo -e "   ${BLUE}http://127.0.0.1:8000${NC}"
echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}💡 Dica:${NC} Pressione Ctrl+C para parar o servidor"
echo ""

# Inicia o servidor
python3 -m http.server 8000
