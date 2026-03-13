# Yeni Proje Oluşturma — Adım Adım

## Adım 1: GitHub'dan Repo Oluştur

1. https://github.com/resulbolbulut/claude-project-template adresine git
2. Yeşil **"Use this template"** butonuna tıkla
3. **"Create a new repository"** seç
4. Repo adını gir (ör. `my-new-project`)
5. Açıklama ekle
6. Public/Private seç → **"Create repository"**

## Adım 2: Klonla

```powershell
git clone https://github.com/resulbolbulut/my-new-project.git
cd my-new-project
```

## Adım 3: Setup Script'ini Çalıştır

```powershell
.\setup.ps1
```

Script sana şunları soracak:
- **Proje adı** → `CLAUDE.md`, `package.json`, `index.html`, `App.tsx` ve skill dosyalarındaki `{{PROJECT_NAME}}` yerine yazılır
- **Proje açıklaması** → `{{PROJECT_DESCRIPTION}}` yerine yazılır
- **Setup dosyalarını silmek ister misiniz?** → `e` de (artık gerek yok)

> macOS/Linux kullanıyorsan: `chmod +x setup.sh && ./setup.sh`

## Adım 4: Bağımlılıkları Kur

```powershell
npm install --legacy-peer-deps
```

> `--legacy-peer-deps` → React 19 ile testing-library uyumluluğu için gerekli.

## Adım 5: Çalıştığını Doğrula

```powershell
npm run dev       # http://localhost:3000 açılmalı
npm run test      # Vitest testleri geçmeli
npm run lint      # ESLint hata vermemeli
```

## Adım 6: Projeye Özel Ayarları Yap

| Dosya | Ne Yapılmalı |
|-------|--------------|
| `CLAUDE.md` | Projenin kurallarını, dizin yapısını ve komutlarını güncelle |
| `tailwind.config.js` | Proje renklerini ve fontlarını ekle |
| `.claude/skills/project-workflow/SKILL.md` | Geliştirme akışını özelleştir |
| `.claude/skills/project-testing/SKILL.md` | Test stratejisini özelleştir |

## Adım 7: İlk Commit

```powershell
git add -A
git commit -m "Initial setup from claude-project-template"
git push
```

---

**Hazırsın! 🚀** Claude skill'leri, config dosyaları ve test altyapısı hazır.
