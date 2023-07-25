build:
	# git pull
	docker-compose build --no-cache

deploy:
	docker-compose up -d

security_scan:
	docker run --rm -v /var/run/docker.sock:/var/run/docker.sock snyk:test snyk container monitor datasseq2_testing
