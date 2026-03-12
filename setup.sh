#!/usr/bin/env bash
# Claude Project Template Setup
# Bu script placeholder'ları proje bilgilerinizle değiştirir.

set -e

echo ""
echo "=== Claude Project Template Setup ==="
echo ""

# Proje adı
if [ -z "$1" ]; then
    read -rp "Proje adı: " PROJECT_NAME
else
    PROJECT_NAME="$1"
fi

if [ -z "$PROJECT_NAME" ]; then
    echo "Hata: Proje adı boş olamaz."
    exit 1
fi

# Proje açıklaması
if [ -z "$2" ]; then
    read -rp "Proje açıklaması: " PROJECT_DESCRIPTION
else
    PROJECT_DESCRIPTION="$2"
fi

if [ -z "$PROJECT_DESCRIPTION" ]; then
    PROJECT_DESCRIPTION="$PROJECT_NAME projesi."
fi

echo ""
echo "Proje: $PROJECT_NAME"
echo "Açıklama: $PROJECT_DESCRIPTION"
echo ""

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Dosyalarda placeholder değiştir
FILES=(
    "CLAUDE.md"
    "package.json"
    "index.html"
    "src/App.tsx"
    ".claude/skills/project-workflow/SKILL.md"
    ".claude/skills/project-testing/SKILL.md"
)

for file in "${FILES[@]}"; do
    filepath="$SCRIPT_DIR/$file"
    if [ -f "$filepath" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$filepath"
            sed -i '' "s/{{PROJECT_DESCRIPTION}}/$PROJECT_DESCRIPTION/g" "$filepath"
        else
            sed -i "s/{{PROJECT_NAME}}/$PROJECT_NAME/g" "$filepath"
            sed -i "s/{{PROJECT_DESCRIPTION}}/$PROJECT_DESCRIPTION/g" "$filepath"
        fi
        echo "  Güncellendi: $file"
    fi
done

echo ""
echo "Setup tamamlandı!"
echo ""

# Setup dosyalarını silme teklifi
read -rp "Setup dosyalarını silmek ister misiniz? (e/h): " CLEANUP
if [ "$CLEANUP" = "e" ]; then
    rm -f "$SCRIPT_DIR/setup.ps1"
    rm -f "$SCRIPT_DIR/setup.sh"
    echo "Setup dosyaları silindi."
fi

echo ""
echo "Projeniz hazır! 'claude' veya 'npm run dev' ile başlayabilirsiniz."
echo ""
