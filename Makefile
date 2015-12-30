package: docker_build 
	docker run --rm -v $(PWD):/tozny-sdk-php/target tozny/sdk-php

docker_build: 
	docker build -t tozny/sdk-php .

clean:
	rm -f *.deb

