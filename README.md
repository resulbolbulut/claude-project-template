# Claude Project Template

Claude ile entegre çalışmaya hazır proje şablonu. Skill'ler, yapılandırma ve geliştirme akışı önceden kurulu.

## 🚀 Kullanım

### GitHub'dan (Önerilen)

1. Bu repoda **"Use this template"** → **"Create a new repository"** butonuna tıklayın
2. Yeni repo adını ve açıklamasını girin
3. Repoyu klonlayın:
   ```bash
   git clone https://github.com/KULLANICI/REPO_ADI.git
   cd REPO_ADI
   ```
4. Setup script'ini çalıştırın:

   **Windows (PowerShell):**
   ```powershell
   .\setup.ps1
   ```

   **macOS / Linux:**
   ```bash
   chmod +x setup.sh && ./setup.sh
   ```

5. Script proje adı ve açıklamasını soracak, placeholder'ları otomatik dolduracak.

### Manuel (degit ile)

```bash
npx degit KULLANICI/claude-project-template my-project
cd my-project
./setup.sh   # veya .\setup.ps1
```

## 📁 İçerik

```
├── README.md                     ← Bu dosya
├── CLAUDE.md                     ← Proje yapılandırması (Claude okur)
├── package.json                  ← Bağımlılıklar (React, Vite, Vitest, Playwright, Tailwind)
├── tsconfig.json                 ← TypeScript ayarları
├── vite.config.ts                ← Vite dev server + build
├── vitest.config.ts              ← Test yapılandırması
├── playwright.config.ts          ← E2E test yapılandırması
├── eslint.config.js              ← Lint kuralları
├── tailwind.config.js            ← TailwindCSS
├── postcss.config.cjs            ← PostCSS
├── index.html                    ← HTML giriş noktası
├── .nvmrc                        ← Node.js versiyon sabitleme
├── .gitignore
├── setup.ps1 / setup.sh          ← Placeholder doldurma script'leri
├── src/
│   ├── main.tsx                  ← React giriş noktası
│   ├── App.tsx                   ← Başlangıç component
│   └── index.css                 ← Tailwind base CSS
├── tests/
│   └── setup.ts                  ← Vitest setup
└── .claude/
    ├── settings.json
    └── skills/                   ← 8 skill
```

## 🎯 Skill Yönetimi

### Yeni Skill Ekleme

`.claude/skills/` altına yeni bir dizin oluşturun:

```
.claude/skills/my-skill/
└── SKILL.md
```

`SKILL.md` formatı:

```yaml
---
name: my-skill
description: Skill'in ne yaptığının kısa açıklaması
---

# Talimatlar buraya yazılır
```

### Skill Güncelleme

Resmi skill'ler için kaynak repodan tekrar kopyalayın:
- Anthropic: https://github.com/anthropics/skills
- Superpowers: https://github.com/obra/superpowers

### Skill Silme

İstemediğiniz skill dizinini silin ve `CLAUDE.md`'deki tablodan çıkarın.

## 📝 Özelleştirme

- **`CLAUDE.md`**: Tech stack, dizin yapısı ve kuralları projenize göre düzenleyin
- **`project-workflow/SKILL.md`**: Geliştirme akışınıza göre özelleştirin
- **`project-testing/SKILL.md`**: Test stratejinize göre özelleştirin
- **`.claude/settings.json`**: İzinleri projenize göre ayarlayın

## 📄 Lisans

MIT
