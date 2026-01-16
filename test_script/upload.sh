#!/bin/bash

# 메시지 없으면 현재 시간으로 자동 입력
if [ -z "$1" ]; then
    MSG="Auto update: $(date)"
else
    MSG="$1"
fi

echo ">> 깃헙으로 발사 준비: '$MSG'"

# 3단 콤보
git add .
git commit -m "$MSG"
git push

echo ">> 업로드 완료!"