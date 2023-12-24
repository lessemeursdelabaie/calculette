serve:
	python3 -m http.server

pub:
	rsync -Pva index.html *.js *.css $(dest)

qr:
	python3 -m venv venv
	venv/bin/pip install -U qrcode[pil]
	venv/bin/qr https://lessemeursdelabaie.github.io/calculette/ > calculette.png

push:
	git push git push git@github.com:lessemeursdelabaie/calculette.git main
