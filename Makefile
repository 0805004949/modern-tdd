
img := modern-tdd
app := article
tag := "$$(git log -1 --format='%h')"
stage := dev 

build :
	docker build -t $(img):$(tag) -t $(img):$(stage) .
shell :
	docker run -it -v $(PWD)/app:/app --name $(app) --rm $(img):$(tag) /bin/sh
shell2 :
	docker exec -it $(app) /bin/sh