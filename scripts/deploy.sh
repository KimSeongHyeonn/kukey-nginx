set -e

echo "[+] 복사 중: nginx.conf"
sudo cp ./templates/nginx.conf.template /etc/nginx/nginx.conf

echo "[+] 복사 중: conf.d/*.conf"
sudo cp ./conf.d/*.conf /etc/nginx/conf.d/

echo "[+] nginx 설정 테스트"
sudo nginx -t

echo "[+] nginx 재시작"
sudo systemctl reload nginx

echo "[+] 완료!"
