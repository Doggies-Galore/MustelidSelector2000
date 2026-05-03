# ☕ Crema — Design Language

> *A cozy, accessible, minimalist UX framework.*
> Warm like a cup of coffee. Quiet like a library. Clear like morning light.

---

## Philosophy

Crema is built on three pillars:

1. **Accessibility** — Every element is reachable by keyboard, screen-reader friendly, and contrast-safe.
2. **Minimalism** — No decoration without purpose. Typography and whitespace do the talking.
3. **Coziness** — Warm tones, soft edges, gentle motion. The UI should feel like a favorite sweater.

---

## 1. Color System

### Design Tokens

Crema uses a two-tone theming system inherited from its parent project. All colors derive from just two root values:

| Token             | Role                           | Default         |
|--------------------|--------------------------------|-----------------|
| `--crema-bg`       | Page & surface background      | `#1a0d0b`       |
| `--crema-fg`       | Text, borders, interactive     | `#d4a373`        |
| `--crema-surface`  | Elevated cards & panels        | `rgba(255,255,255,0.05)` |
| `--crema-hover`    | Hover state background         | `rgba(255,255,255,0.10)` |
| `--crema-focus`    | Focus ring glow                | `rgba(212,163,115,0.3)` |
| `--crema-muted`    | Secondary / de-emphasized text | `opacity: 0.6`  |
| `--crema-danger`   | Destructive actions            | `#ff4c4c`        |
| `--crema-success`  | Positive confirmations         | `#00ff88`        |
| `--crema-warn`     | Caution / loading states       | `#ffcc00`        |

### Radii

| Token              | Value    | Usage                          |
|--------------------|----------|--------------------------------|
| `--crema-radius-sm`| `10px`   | Small buttons, tooltips        |
| `--crema-radius-md`| `15px`   | Standard buttons, inputs       |
| `--crema-radius-lg`| `22px`   | Cards, sections                |
| `--crema-radius-xl`| `28px`   | Modals, major containers       |

### Contrast

- All text on `--crema-bg` must pass **WCAG AA** (4.5:1 ratio minimum).
- Interactive elements must pass **WCAG AA for large text** (3:1 ratio minimum).
- The default palette (Coffee: `#1a0d0b` / `#d4a373`) achieves a contrast ratio of **7.2:1**.

### Theme Presets

| Name        | Background | Foreground | Feel          |
|-------------|-----------|------------|---------------|
| Coffiest    | `#1a0d0b` | `#d4a373`  | Warm espresso |
| Cuddlebug   | `#4b2e2a` | `#fff3e0`  | Blanket fort  |
| Midnight    | `#001524` | `#ffecd1`  | Late-night    |
| IAmAnOLED   | `#000000` | `#ffffff`  | Pure contrast |
| Light Mode  | `#ffffff` | `#000000`  | Bright & clean|

---

## 2. Typography

### Font Stack

```
'Helvetica Neue', Arial, sans-serif
```

No web fonts are loaded. The system font stack keeps things fast, familiar, and cozy.

### Scale

| Element         | Size      | Weight | Notes                          |
|-----------------|-----------|--------|--------------------------------|
| Page Title (h1) | `4vw`     | Bold   | Bottom border, generous padding|
| Section Title   | `2vw`     | Bold   | Inline border-bottom           |
| Body Text       | `1.1-1.5rem` | Normal | Line-height: 1.5-1.6       |
| Button Label    | `1.2rem`  | Bold   | ALL CAPS not used              |
| Caption / Hint  | `0.85rem` | Normal | Reduced opacity (0.4-0.6)     |
| Monospace        | `'SF Mono', 'Fira Code', 'Consolas', monospace` | — | Code & data fields |

### Rules

- **No uppercase transforms.** Text stays natural and readable.
- **User-select: none** on labels/buttons only. Body text is always selectable.
- **Bold is used sparingly.** Only titles, button labels, and emphasis.

---

## 3. Spacing & Layout

### Spacing Scale

| Token   | Value    | Usage                          |
|---------|----------|--------------------------------|
| `xs`    | `5px`    | Inner gaps, icon margins       |
| `sm`    | `10px`   | Compact padding, small gaps    |
| `md`    | `15-20px`| Standard padding, grid gaps    |
| `lg`    | `30px`   | Section padding, card insets   |
| `xl`    | `40px`   | Page padding, major separations|
| `xxl`   | `60px`   | Hero card padding              |

### Page Structure

```
┌──────────────────────────────┐
│  .page-wrapper               │
│  ┌──────────────────────────┐│
│  │  .header                 ││
│  │  ┌────────┐   ┌────────┐││
│  │  │  h1    │   │ .close  │││
│  │  └────────┘   └────────┘││
│  └──────────────────────────┘│
│  ┌──────────────────────────┐│
│  │  .section                ││
│  │  .section-title          ││
│  │  (content)               ││
│  └──────────────────────────┘│
│  ┌──────────────────────────┐│
│  │  .section                ││
│  │  ...                     ││
│  └──────────────────────────┘│
└──────────────────────────────┘
```

- **Max content width:** `800px` (forms, text), `1200px` (grids)
- **Page wrapper:** Centers content, handles overflow scrolling
- **Sections stack vertically** with `30px` gaps

---

## 4. Components

### Buttons (`.crema-btn`)

```
┌─────────────────┐
│   Button Text   │  ← 2px border, 12-20px radius, bold text
└─────────────────┘
```

| State     | Background        | Text              | Border            |
|-----------|-------------------|-------------------|-------------------|
| Default   | `transparent`     | `--crema-fg`      | `2.5px solid fg`  |
| Hover     | `--crema-fg`      | `--crema-bg`      | `2.5px solid fg`  |
| Focus     | `transparent`     | `--crema-fg`      | `3.5px solid fg` + glow |
| Disabled  | `transparent`     | `--crema-fg` 30%  | `2.5px solid fg` 30%|
| Primary   | `--crema-fg`      | `--crema-bg`      | none              |
| Danger    | `--crema-danger`  | `white`           | none              |

### Cards / Sections (`.crema-card`)

- Background: `var(--crema-surface)`
- Border: `2px solid var(--crema-fg)`
- Border-radius: `20px`
- Padding: `30px`
- No box-shadow by default (flat surfaces)

### Inputs (`.crema-input`)

- Background: `rgba(255,255,255,0.05)`
- Border: `2px solid var(--crema-fg)`
- Border-radius: `15px`
- Padding: `15px 20px`
- Focus: subtle glow ring via `box-shadow: 0 0 0 3px var(--crema-focus)`

### Modals (`.crema-modal`)

- Overlay: `rgba(0,0,0,0.85)` + `backdrop-filter: blur(5px)`
- Content: Centered card with `4px` border and `30px` radius
- Enter: scale from `0.9` → `1.0` with spring bezier
- Exit: fade + scale to `0.9`

### Toggle Groups (`.crema-toggle`)

- Rounded rectangular container with `2.5px` border
- Consistent with standard button sizes and padding
- Active tab: filled with `--crema-fg`, text in `--crema-bg`
- Inactive: transparent, standard text

### Status Banners (`.crema-status`)

- Full-width, rounded pill
- Color-coded border + text: success (green), error (red), warning (yellow), info (blue)
- Semi-transparent background tint

---

## 5. Motion

### Principles

- **Purposeful:** Animation communicates state change, not decoration.
- **Gentle:** Durations are 200-750ms. Nothing is jarring.
- **Physics-based:** Use `cubic-bezier(0.4, 0.0, 0.2, 1)` (Material ease-out) as the default.

### Catalogue

| Animation    | Duration | Easing                               | Usage                    |
|-------------|----------|--------------------------------------|--------------------------|
| Page Enter  | `500ms`  | `cubic-bezier(0.4, 0.0, 0.2, 1)`    | Scale 0.9→1, opacity 0→1|
| Page Exit   | `400ms`  | `cubic-bezier(0.4, 0.0, 0.2, 1)`    | Scale 1→0.85, opacity 1→0|
| Hover       | `200ms`  | `ease`                               | Background fill, scale   |
| Focus       | `200ms`  | `ease`                               | Ring appear              |
| Modal Open  | `300ms`  | `cubic-bezier(0.34, 1.56, 0.64, 1)` | Springy scale 0.9→1     |
| Modal Close | `300ms`  | `ease`                               | Fade + scale             |
| Bg Color    | `750ms`  | `cubic-bezier(0.4, 0.0, 0.2, 1)`    | Theme transitions        |

### Reduced Motion

```css
@media (prefers-reduced-motion: reduce) {
    *, *::before, *::after {
        animation-duration: 0.01ms !important;
        transition-duration: 0.01ms !important;
    }
}
```

---

## 6. Accessibility

### Keyboard Navigation

- All interactive elements receive `tabindex="0"` and `role` attributes.
- `:focus-visible` provides a `3px` accent-colored outline with `5px` offset.
- Enter and Space activate buttons.
- Escape closes modals.
- Arrow keys navigate within toggle groups.

### Screen Readers

- All buttons and links have `aria-label` attributes.
- Live regions (`aria-live="polite"`) for dynamic content (clocks, status).
- Modals trap focus and announce title on open.
- Status changes are announced via `role="status"`.

### Color Contrast

- Default theme exceeds WCAG AA.
- Opacity-based de-emphasis never drops below `0.4` for informational text.
- Danger/success colors are supplemented with shape or text cues (never color-only).

---

## 7. Patterns

### Theme Persistence

```javascript
// Load immediately, before first paint (in <head>)
const bg = localStorage.getItem('crema-bg') || '#1a0d0b';
const fg = localStorage.getItem('crema-fg') || '#d4a373';
document.documentElement.style.setProperty('--crema-bg', bg);
document.documentElement.style.setProperty('--crema-fg', fg);
```

### Page Lifecycle

1. Theme loads in `<head>` (prevents flash)
2. Body enters with `fadeIn` animation
3. User interacts
4. On exit: `fade-out` class triggers exit animation → navigate after 400ms

### Navigation Back

```javascript
history.replaceState({ page: 'applet' }, '');
history.pushState({ page: 'applet-active' }, '');
window.addEventListener('popstate', (e) => {
    if (e.state?.page === 'applet') {
        document.body.classList.add('fade-out');
        setTimeout(() => { window.location.href = getBackUrl(); }, 400);
    }
});
```

---

## 8. File Structure

```
Crema/
├── DESIGN.md           ← This document
├── crema.css           ← Core framework stylesheet
├── crema.js            ← Theme loader + page lifecycle utilities
├── sample/
│   ├── index.html      ← Sample application
│   └── ...
```

---

*Crema v1.0 — Built with ☕ and care.*
