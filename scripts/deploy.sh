set -e

cd "$(dirname "$0")/.."

echo "[+] Nginx 설정 복사 중..."

sudo cp ./templates/nginx.conf.template /etc/nginx/nginx.conf
sudo cp ./conf.d/app.conf /etc/nginx/conf.d/app.conf
sudo cp ./routes/upstream.conf /etc/nginx/routes/upstream.conf

echo "[+] 설정 테스트 중..."
sudo nginx -t

echo "[+] Nginx 재시작 중..."
sudo systemctl reload nginx

echo "[+] ✅ 배포 완료!"
