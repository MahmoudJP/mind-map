#!/usr/bin/env bash
# يبني ملفين:
#   index.html    ← نسخة كاملة للتشغيل المحلي (doctype + charset + viewport + rtl)
#   artifact.html ← نسخة بدون غلاف للنشر كـ Artifact (الغلاف بيتضاف تلقائيًا هناك)
cd "$(dirname "$0")/.."

{
  printf '<!doctype html>\n<html dir="rtl" lang="ar">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">\n<style id="fonts">\n'
  cat src/fonts.css
  printf '</style>\n</head>\n<body>\n'
  cat src/body.html
  printf '\n</body>\n</html>\n'
} > index.html

{
  printf '<style id="fonts">\n'
  cat src/fonts.css
  printf '</style>\n'
  cat src/body.html
} > artifact.html

echo "تم البناء: index.html ($(wc -c < index.html) بايت) + artifact.html ($(wc -c < artifact.html) بايت)"
