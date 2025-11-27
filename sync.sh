#!/bin/bash
# Синхронизация контента Al-Korn

SOURCE="/Users/alex/Documents/_OBSIDIAN/alkor/"
DEST="$HOME/Projects/quartz-alkor/content/"

echo "🔄 Синхронизация Al-Korn..."
rsync -av --delete "$SOURCE" "$DEST"

cd ~/Projects/quartz-alkor
git add .
git commit -m "Обновление $(date '+%Y-%m-%d %H:%M')"

if git push; then
    osascript -e 'display notification "Сайт обновлён!" with title "✅ Al-Korn" sound name "Бриз"'
    open "https://github.com/Al-Korn/Al-Korn.github.io/actions"
else
    osascript -e 'display notification "Ошибка git push!" with title "❌ Al-Korn" sound name "Basso"'
fi
