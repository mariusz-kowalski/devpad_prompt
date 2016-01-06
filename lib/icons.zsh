declare -A icons
icons[square]="■"
icons[rectangle]="▬"
icons[triangle]="▲"
icons[diamond]="◆"
icons[circle]="●"
icons[half_circle]="◐"
icons[quater_circle]="◕"
icons[clover]="☘"
icons[radioactive]="☢"
icons[pace]="☮"
icons[yinyang]="☯"
icons[sun]="☀"
icons[chees]="♜"
icons[hart]="♥"
icons[tone]="♪"
icons[plane]="✈"
icons[flag]="⚑"
icons[star]="★"
icons[dice]="⚂"
icons[phone]="☎"
# icons[sad]="☹"
icons[smile]="☺"

function icon_count {
  echo ${#icons[@]}
}

function icon_no {
  echo -n "${icons[@]:$1:1}"
}

declare -A special_icons
special_icons[hotfix]="⚡"
special_icons[clock]="◷"

# arrows
# ← ↑ → ↓ ↔ ↕ ↖ ↗ ↘ ↙ ↚ ↛ ↜ ↝ ↞ ↟ ↠ ↡ ↢ ↣ ↤ ↥ ↦ ↧ ↨ ↩ ↪ ↫ ↬ ↭ ↮ ↯
# ↰ ↱ ↲ ↳ ↴ ↵ ↶ ↷ ↸ ↹ ↺ ↻ ↼ ↽ ↾ ↿ ⇀ ⇁ ⇂ ⇃ ⇄ ⇅ ⇆ ⇇ ⇈ ⇉ ⇊ ⇋ ⇌
# ⇍ ⇎ ⇏ ⇐ ⇑ ⇒ ⇓ ⇔ ⇕ ⇖ ⇗ ⇘ ⇙ ⇚ ⇛ ⇜ ⇝ ⇞ ⇟ ⇠ ⇡ ⇢ ⇣ ⇤ ⇥
# ⇦ ⇧ ⇨ ⇩ ⇪ ⇫ ⇬ ⇭ ⇮ ⇯ ⇰ ⇱ ⇲ ⇳⇴ ⇵ ⇶ ⇷ ⇸ ⇹ ⇺ ⇻ ⇼ ⇽ ⇾ ⇿


# geometric
# ■ □ ▢ ▣ ▤ ▥ ▦ ▧ ▨ ▩ ▪ ▫ ▬ ▭ ▮ ▯ ▰ ▱ ▲ △ ▴ ▵ ▶ ▷ ▸ ▹ ► ▻ ▼ ▽ ▾ ▿ ◀ ◁
# ◂ ◃ ◄ ◅ ◆ ◇ ◈ ◉ ◊ ○ ◌ ◍ ◎ ● ◐ ◑ ◒ ◓ ◔ ◕ ◖ ◗ ◘ ◙ ◚ ◛ ◜◝◟◞    ◠ ◡
# ◢ ◣ ◤ ◥ ◦ ◧ ◨ ◩ ◪ ◫ ◬ ◭ ◮ ◯ ◰ ◱ ◲ ◳ ◴ ◵ ◶ ◷ ◸ ◹ ◺ ◻ ◼ ◽ ◾ ◿

# graphics
# ☀ ☁ ☂ ☃ ☄ ★ ☆  ☎ ☏ ☐  ☔ ☕ ☖ ☗ ☘ ☙  ☠ ☡ ☢ ☣ ☤ ☥ ☦  ☮ ☯ ☸ ☹ ☺ ☻ ☼ ☽ ☾
# ♔ ♕ ♖ ♗ ♘ ♙ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♡ ♢ ♣ ♤ ♥ ♦ ♧ ♨ ♩ ♪ ♫ ♬ ♭ ♮ ♯ ♲  ♺ ♻
#  ♿ ⚀ ⚁ ⚂ ⚃ ⚄ ⚅ ⚆ ⚇ ⚈ ⚉ ⚐ ⚑ ⚒ ⚓ ⚔ ⚕ ⚖ ⚗ ⚘ ⚙ ⚚ ⚛ ⚜ ⚠ ⚡ ✁ ✂ ✃ ✄
#  ✆ ✇ ✈ ✉ ✌ ✍ ✎ ✏ ✐ ✑ ✒

# stars
# ✿ ❁ ❂ ❄ ❧ ★ ☆ ✯ ✪

# ok, delete
# ☑ ☒ ☓ ✓ ✔ ✕ ✖ ✗ ✘

# pointers
#  ☚ ☛ ☜ ☝ ☞ ☟

# blocks
# ▀ ▁ ▂ ▃ ▄ ▅ ▆ ▇ █ ▉ ▊ ▋ ▌ ▍ ▎ ▏ ▐ ░ ▒ ▓ ▔ ▕ ▖ ▗ ▘ ▙ ▚ ▛ ▜ ▝ ▞ ▟


# ⎇◷  ↑⤴ ᛘ ߂ ᚴ ᚶ ᚠ ⍦ ⑂
