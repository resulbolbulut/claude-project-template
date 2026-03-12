---
name: project-testing
description: "{{PROJECT_NAME}} test stratejisi ve kalıpları. Vitest ile unit/integration test, Playwright ile E2E test yazarken kullanılır. Coverage hedefleri, test organizasyonu ve çalıştırma kurallarını içerir."
---

# {{PROJECT_NAME}} Test Stratejisi

## Unit / Integration Test (Vitest)

```bash
npm run test:unit
```

### Yapı

```
tests/
  unit/           → Saf birim testleri
  integration/    → API + DB entegrasyon testleri
```

### Kalıp

```typescript
import { describe, it, expect, beforeEach } from "vitest";

describe("FeatureName", () => {
  beforeEach(async () => {
    // Test DB'yi temizle/seed'le
  });

  it("açıklayıcı Türkçe test adı", async () => {
    // Arrange → Act → Assert
    const result = await someFunction();
    expect(result).toBeDefined();
  });
});
```

### Kurallar

- `fileParallelism: false` — testler sıralı çalışır (tek SQLite DB)
- `@/` alias ile import
- Coverage hedefi: minimum %80

## E2E Test (Playwright)

```bash
npm run test:e2e
```

### Kurallar

- Tek worker (`workers: 1`) — tek DB nedeniyle
- Her test bağımsız seed/cleanup yapar
- `data-testid` attribute'ları ile element seçimi

### Kalıp

```typescript
import { test, expect } from "@playwright/test";

test("kullanıcı sayfaya erişebilir", async ({ page }) => {
  await page.goto("/");
  await expect(page.getByTestId("main-content")).toBeVisible();
});
```

## Coverage

```bash
npm run test:unit -- --coverage
```

- Provider: `v8`
- Reporter: `text` + `html`
- HTML rapor: `coverage/` dizininde
