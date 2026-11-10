#import "@preview/catppuccin:1.1.0": flavors

#let latte = (
  flavors.latte.colors
    .pairs()
    .map(((name, color)) => (name, color.rgb))
    .to-dict()
)

// Màu chủ đạo — đổi 1 chỗ này là đổi toàn bộ theme
#let brand = latte.blue

// ── Bảng màu ứng dụng ─────────────────────────────────────
#let colors = (
  // Nền
  bg: latte.base,
  bg-code: brand.lighten(80%),
  bg-code-header: latte.crust,

  // Text
  text-primary:   latte.text,
  text-secondary: latte.subtext0,
  text-accent:    brand.darken(40%),

  // Viền & hình vẽ
  stroke-default:      latte.text,
  stroke-light:        latte.overlay0,
  stroke-lighter:      latte.surface0,
  stroke-accent:       brand,
  stroke-accent-light: brand.lighten(20%),

  // Màu chính
  primary:        brand,
  primary-dark:   brand.darken(20%),
  primary-darker: brand.darken(40%),

  // Overlay (nền mờ dùng cho box, highlight) — dùng alpha thật
  // thay vì lighten(), để blend đúng với nền bên dưới (kể cả bg khác trắng)
  primary-overlay-90: brand.transparentize(90%),
  primary-overlay-80: brand.transparentize(80%),
  primary-overlay-60: brand.transparentize(60%),
  primary-overlay-40: brand.transparentize(40%),
  primary-overlay:    brand,
)

// ── Bảng màu accent phụ ────────────────────────────────────
// Dùng cho semantic color (đúng/sai/cảnh báo) hoặc phân biệt
// giữa các loại box (task, exercise-box, info-box, arg-box...)
#let accents = latte
