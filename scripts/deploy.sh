set -e

cd "$(dirname "$0")/.."

echo "[+] Nginx 설정 복사 중..."

sudo cp ./templates/nginx.conf.template /etc/nginx/nginx.conf
sudo cp ./conf.d/app.conf /etc/nginx/conf.d/app.conf

if [ ! -f /etc/nginx/routes/upstream.conf ]; then
  echo "[+] upstream.conf가 없어 초기 생성... (default: 3080)"
  echo "upstream kukey_backend { server localhost:3080; }" | sudo tee /etc/nginx/routes/upstream.conf > /dev/null
fi

echo "[+] 설정 테스트 중..."
sudo nginx -t

echo "[+] Nginx 재시작 중..."
sudo systemctl reload nginx

echo "[+] ✅ 배포 완료!"
