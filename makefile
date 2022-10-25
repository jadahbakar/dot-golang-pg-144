up:	compose-up
down: compose-down
hapus: docker-hapus
backup: backup-db
restore: restore-db


#  ____  __   ___ __ _ ____ ____      ___ __  _  _ ____  __  ____ ____ 
# (    \/  \ / __|  / |  __|  _ \___ / __)  \( \/ |  _ \/  \/ ___|  __)
#  ) D (  O | (__ )  ( ) _) )   (___| (_(  O ) \/ \) __(  O )___ \) _) 
# (____/\__/ \___|__\_|____|__\_)    \___)__/\_)(_(__)  \__/(____(____)

compose-up: 
	@echo "-> Running $@";
	@docker network create -d bridge dot-golang-network
	@docker-compose up -d;
	@docker ps -a;
	@docker logs -f dot-golang-pg-144

compose-down:
	@echo "-> Running $@";
	@docker-compose stop;
	@docker ps -a;

docker-hapus:
	@echo "-> Running $@";
	@docker ps
	@docker stop dot-golang-pg-144
	@docker ps 
	docker rm dot-golang-pg-144
	@docker ps
	@docker rmi dot-golang-pg-144
	@rm -rf pgdata
	# @docker rmi postgres:latest
	@docker system prune

backup-db:
	@echo "-> Running $@";
	./script_backup

restore-db:
	@echo "-> Running $@";
	./script_restore

#   ___ __ ____
#  / __|  |_  _)
# ( (_ \)(  )(
#  \___(__)(__)
git-push:
# make git m="testing make for git"
	@git add .
	@git commit -m "$m"
	@git push -u origin $(GIT_BRANCH_NAME)
