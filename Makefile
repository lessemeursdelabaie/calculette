serve:
	python3 -m http.server

pub:
	rsync -Pva index.html *.js *.css $(dest)
