# Claude Project Template — Süreç Rehberi & Kontrol Listesi

> Bu doküman, `claude-project-template` şablonunun nasıl oluşturulduğunu, ne içerdiğini ve yeni bir projede nasıl kullanılacağını açıklar.

---

## 📖 Şablon Nasıl Oluşturuldu?

### 1. Claude Skills Araştırması
- [awesome-claude-skills](https://github.com/travisvn/awesome-claude-skills) referans listesi incelendi
- [anthropics/skills](https://github.com/anthropics/skills) resmi reposu klonlandı
- [obra/superpowers](https://github.com/obra/superpowers) topluluk skill'leri klonlandı

### 2. Skill Seçimi
Projelere en uygun 6 resmi + 2 custom skill seçildi:

| Skill | Kaynak | Ne İşe Yarar |
|-------|--------|---------------|
| `frontend-design` | Anthropic | AI slop-free, üretim kalitesinde UI tasarım talimatları |
| `webapp-testing` | Anthropic | Playwright ile web uygulaması test otomasyonu |
| `mcp-builder` | Anthropic | MCP sunucu oluşturma rehberi |
| `skill-creator` | Anthropic | Yeni skill'ler oluşturmak için interaktif wizard |
| `superpowers` | obra | TDD, debugging, code review, plan yazma, subagent pattern'leri |
| `superpowers-commands` | obra | `/brainstorm`, `/write-plan`, `/execute-plan` komutları |
| `project-workflow` | Custom | Proje geliştirme akışı (Vite + React + Prisma) |
| `project-testing` | Custom | Vitest + Playwright test stratejisi ve kalıpları |

### 3. Boilerplate (FeeKa-Panel'den Türetildi)
Mevcut `FeeKa-Panel` projesinin config dosyaları analiz edildi, projeye özel referanslar temizlenerek genelleştirildi:

| Dosya | Kaynak |
|-------|--------|
| `package.json` | React 19, Vite 6, TailwindCSS 3, Vitest, Playwright, ESLint |
| `tsconfig.json` | Strict mode, `@/` alias → `src/` |
| `vite.config.ts` | React plugin, port 3000, `@/` alias |
| `vitest.config.ts` | jsdom, coverage v8, %30 threshold |
| `playwright.config.ts` | CI-aware, Chromium, auto dev server |
| `eslint.config.js` | Flat config, TS + React + Hooks |
| `tailwind.config.js` | Dark mode, responsive screens, animasyonlar |
| `postcss.config.cjs` | Tailwind + Autoprefixer |

### 4. Placeholder Sistemi
Proje adı ve açıklaması için `{{PROJECT_NAME}}` ve `{{PROJECT_DESCRIPTION}}` placeholder'ları eklendi. `setup.ps1` (Windows) ve `setup.sh` (Unix) scriptleri bunları interaktif olarak doldurur.

### 5. GitHub Template Repository
Repo GitHub'a push edilip **Settings → Template repository** olarak işaretlendi:
- 🔗 https://github.com/resulbolbulut/claude-project-template

---

## 🚀 Yeni Proje Oluşturma Checklist'i

### GitHub'dan Oluşturma
- [ ] https://github.com/resulbolbulut/claude-project-template → **"Use this template"** → **"Create a new repository"**
- [ ] Yeni repo adını ve açıklamasını gir
- [ ] Repoyu klonla: `git clone https://github.com/KULLANICI/REPO_ADI.git`

### Kurulum
- [ ] `cd REPO_ADI`
- [ ] `.\setup.ps1` çalıştır (Windows) veya `./setup.sh` (macOS/Linux)
- [ ] Proje adını gir
- [ ] Proje açıklamasını gir
- [ ] Setup dosyalarını silme sorusuna `e` de

### Bağımlılıklar
- [ ] `npm install --legacy-peer-deps` (React 19 + testing-library uyumluluğu için)
- [ ] `npx playwright install` (E2E test tarayıcılarını indir — opsiyonel)

### Doğrulama
- [ ] `npm run dev` → http://localhost:3000 açılıyor mu?
- [ ] `npm run test` → Vitest çalışıyor mu?
- [ ] `npm run lint` → ESLint çalışıyor mu?

### Özelleştirme
- [ ] `CLAUDE.md` → Projenize özel kuralları ve dizin yapısını güncelleyin
- [ ] `tailwind.config.js` → Proje renklerini ve fontlarını ekleyin
- [ ] `.claude/skills/project-workflow/SKILL.md` → Geliştirme akışınızı özelleştirin
- [ ] `.claude/skills/project-testing/SKILL.md` → Test stratejinizi özelleştirin

### Opsiyonel Eklemeler
- [ ] Yeni skill eklemek: `.claude/skills/yeni-skill/SKILL.md` oluştur
- [ ] Firebase, Prisma, Supabase vb. entegrasyon: `package.json`'a ekle
- [ ] CI/CD: `.github/workflows/` altına GitHub Actions ekle

---

## 📁 Şablon Dosya Yapısı

```
claude-project-template/
├── README.md                     ← Kullanım rehberi
├── CLAUDE.md                     ← {{PROJECT_NAME}} placeholder'lı
├── package.json                  ← React 19 + Vite 6 + TailwindCSS 3
├── tsconfig.json                 ← Strict, @/ alias
├── vite.config.ts                ← Dev server + build
├── vitest.config.ts              ← Test + coverage
├── playwright.config.ts          ← E2E test
├── eslint.config.js              ← Lint kuralları
├── tailwind.config.js            ← Styling
├── postcss.config.cjs            ← PostCSS
├── index.html                    ← HTML entry
├── .nvmrc                        ← Node 22
├── .gitignore
├── setup.ps1 / setup.sh          ← Placeholder doldurucu
├── src/
│   ├── main.tsx                  ← React entry
│   ├── App.tsx                   ← Başlangıç component
│   └── index.css                 ← Tailwind base
├── tests/
│   └── setup.ts                  ← jest-dom matchers
└── .claude/
    ├── settings.json             ← Claude Code izinleri
    └── skills/                   ← 8 skill
        ├── frontend-design/      ← Anthropic
        ├── webapp-testing/       ← Anthropic
        ├── mcp-builder/          ← Anthropic
        ├── skill-creator/        ← Anthropic
        ├── superpowers/          ← obra (14 sub-skill)
        ├── superpowers-commands/ ← obra
        ├── project-workflow/     ← Custom
        └── project-testing/      ← Custom
```

---

## 🔧 Bakım ve Güncelleme

### Skill Güncelleme
```bash
# Anthropic skill'lerini güncelle
git clone https://github.com/anthropics/skills /tmp/skills
cp -r /tmp/skills/skills/frontend-design .claude/skills/
cp -r /tmp/skills/skills/webapp-testing .claude/skills/

# Superpowers güncelle
git clone https://github.com/obra/superpowers /tmp/superpowers
cp -r /tmp/superpowers/skills .claude/skills/superpowers
cp -r /tmp/superpowers/commands .claude/skills/superpowers-commands
```

### Bağımlılık Güncelleme
```bash
npx npm-check-updates -u   # package.json'daki versiyonları güncelle
npm install --legacy-peer-deps
npm run test                # Testlerin geçtiğini doğrula
```

---

*Son güncelleme: 13 Mart 2026*
