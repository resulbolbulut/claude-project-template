---
name: project-workflow
description: "{{PROJECT_NAME}} projesine özel geliştirme akışı. Prisma schema değişiklikleri, Next.js route/page oluşturma kalıpları için rehber. Yeni özellik eklerken veya mevcut yapıyı değiştirirken kullanılır."
---

# {{PROJECT_NAME}} Geliştirme Akışı

## Yeni Özellik Ekleme

1. **Prisma Schema** → `prisma/schema.prisma` dosyasında model tanımla
2. **Migration** → `npx prisma migrate dev --name feature_name`
3. **API Route** → `src/app/api/` altında endpoint oluştur
4. **Page** → `src/app/(routes)/` altında sayfa oluştur
5. **Test** → `tests/` altında unit + E2E test yaz

## Dizin Konvansiyonları

```
src/
  app/
    api/          → API route'ları
    (routes)/     → Sayfa route'ları
  components/     → Yeniden kullanılabilir bileşenler
  lib/            → Yardımcı fonksiyonlar ve DB istemcisi
  types/          → TypeScript tip tanımları
prisma/
  schema.prisma   → Veritabanı şeması
  migrations/     → Migration dosyaları
```

## Kodlama Standartları

- TypeScript strict mode
- UI metinleri Türkçe
- Commit mesajları İngilizce
- Her public fonksiyona JSDoc yorum
- `@/` import alias kullanımı (`src/` kökü)
