URL?=https://lessemeursdelabaie.github.io/calculette
serve:
	python3 -m http.server

venv:
	python3 -m venv venv
	venv/bin/pip install -U qrcode[pil] pytest-playwright

qr:
	venv/bin/qr $(URL) > qrcode.png

screenshot:
	venv/bin/playwright install firefox
	venv/bin/playwright screenshot \
		--browser firefox $(URL)/ \
		--full-page \
		calculette.png

pdf: qr screenshot
	wkhtmltopdf $(URL)/affichette.html affichette.pdf

push:
	git push git@github.com:lessemeursdelabaie/calculette.git main
