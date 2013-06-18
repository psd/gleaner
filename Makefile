HOSTNAME=www.theia.org.uk
HOSTNAME=www.homesandcommunities.co.uk

index.html:	index.sh cache/$(HOSTNAME)
	index.sh $(HOSTNAME) < cache/$(HOSTNAME) > index.html

cache/$(HOSTNAME):
	@mkdir -p cache
	curl -s "http://wayback.archive.org/web/*/$(HOSTNAME)*" > $@ || rm -f $@

clean::;	rm -rf index.html cache

clobber::;	rm -f index.html
