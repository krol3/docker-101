build:
	docker build -t krol/101-todo-app:1.0 .

basic:
	docker run -dp 3000:3000 docker-101

volume:
	docker run -dp 3000:3000 -v todo-db:/etc/todos docker-101

dev-mode:
	docker run -dp 3000:3000 \
    -w /app -v $PWD:/app \
    node:10-alpine \
    sh -c "yarn install && yarn run dev"

mysql:
	docker run -dp 3306:3306 \
    --network todo-app --network-alias mysql \
    -v todo-mysql-data:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=secret \
    -e MYSQL_DATABASE=todos \
    -e MYSQL_USER=user \
    -e MYSQL_PASSWORD=pass mysql:5.7

util:
	docker run --it --network todo-app nicolaka/netshoot