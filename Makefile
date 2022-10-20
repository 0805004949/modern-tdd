
img := modern-tdd
app := article
tag := "$$(git log -1 --format='%h')"
stage := dev 
python_version := 3.10

build :
	docker build -t $(img):$(tag) -t $(img):$(stage) .
shell :
	docker run -it -v $(PWD)/app:/app --name $(app) --rm $(img):$(stage) /bin/sh
shell2 :
	docker exec -it $(app) /bin/sh
local :
	pyenv use $(python_version) 
	poetry env use $(사용할수 있는 path)
