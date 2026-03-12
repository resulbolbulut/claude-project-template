# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Tech Stack

- **Framework**: React 19 + Vite 6 + TypeScript 5.8
- **Styling**: TailwindCSS 3 + PostCSS + Autoprefixer
- **Test**: Vitest (unit/integration), Playwright (E2E)
- **Lint**: ESLint 9 (flat config) + TypeScript ESLint
- **UI Dili**: Türkçe

## Dizin Yapısı

```
src/             → Kaynak kod (@/ alias)
  components/    → Yeniden kullanılabilir bileşenler
  lib/           → Yardımcı fonksiyonlar
  types/         → TypeScript tip tanımları
tests/           → Test dosyaları (*.test.ts, *.test.tsx)
  e2e/           → Playwright E2E testleri
.claude/         → Claude yapılandırması
  skills/        → Yüklü skill'ler
```

## Komutlar

```bash
npm install          # Bağımlılıkları kur
npm run dev          # Geliştirme sunucusu (localhost:3000)
npm run build        # Üretim build
npm run test         # Vitest testleri
npm run test:e2e     # Playwright E2E testleri
npm run lint         # ESLint kontrolü
```

## Skills

`.claude/skills/` altında yüklü skill'ler:

| Skill | Kaynak | Açıklama |
|-------|--------|----------|
| `frontend-design` | Anthropic | Üretim kalitesinde frontend tasarım |
| `webapp-testing` | Anthropic | Playwright ile web test |
| `mcp-builder` | Anthropic | MCP sunucu oluşturma |
| `skill-creator` | Anthropic | Yeni skill oluşturma rehberi |
| `superpowers` | obra | TDD, debugging, collaboration pattern'leri |
| `superpowers-commands` | obra | Brainstorm, plan, execute komutları |
| `project-workflow` | Custom | Proje geliştirme akışı |
| `project-testing` | Custom | Test stratejisi |
