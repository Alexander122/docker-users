build-user1:
	docker build -f Dockerfile-user1 -t oleksandrzakharchuk/user1 .
build-user2:
	docker build -f Dockerfile-user2 -t oleksandrzakharchuk/user2 .
push-user1:
	docker push oleksandrzakharchuk/user1
push-user2:
	docker push oleksandrzakharchuk/user2
run-user1:
	docker run -d -p 81:80 oleksandrzakharchuk/user1
run-user2:
	docker run -d -p 82:80 oleksandrzakharchuk/user2
stop:
	sudo docker stop $(docker ps -aq)
remove:
	sudo docker rm $(docker ps -aq)
into-user1:
	docker run -it oleksandrzakharchuk/user1 bash
into-user2:
	docker run -it oleksandrzakharchuk/user2 bash
build-both:
	$(MAKE) build-user1
	$(MAKE) build-user2
run-both:
	$(MAKE) run-user1
	$(MAKE) run-user2
push-both:
	$(MAKE) push-user1
	$(MAKE) push-user2
remove-all-images:
	sudo docker rmi --force $(docker images -q)
test:
	curl http://localhost:81/index.html
	curl http://localhost:82/index.html
