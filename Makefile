all:
	@echo "Available targets:\n\tpackage -- Uses docker to package the module into a .deb package." 
   
package: docker_build 
	docker run -v $(PWD):/tozny-sdk-php/target tozny/tozny-sdk-php-package find . -name "*.deb" -exec cp {} target \;

docker_build: 
	docker build --no-cache -t 'tozny/tozny-sdk-php-package' .

