.PHONY: clean superclean validate-ttl validate-jsonld compare

clean:
	rm -f *.nt graph.png

superclean:
	$(MAKE) -s -C tools/jena clean
	$(MAKE) -s -C tools/rdflib clean

tools/jena/bin/riot:
	which java || (sudo apt update && sudo apt -y install default-jre)
	$(MAKE) -s -C tools/jena

tools/rdflib/bin/rdf2dot:
	sudo apt update && sudo apt -y install python3 python3-venv
	$(MAKE) -s -C tools/rdflib

validate-ttl: description.ttl | tools/jena/bin/riot
	./tools/jena/bin/riot --validate $<
	@echo "Turtle file is valid."

validate-jsonld: description.json | tools/jena/bin/riot
	./tools/jena/bin/riot --validate $<
	@echo "JSON-LD file is valid."

from-ttl.nt: description.ttl | validate-ttl
	./tools/jena/bin/riot --output=ntriples $< | sort > $@

from-jsonld.nt: description.json | validate-jsonld
	./tools/jena/bin/riot --output=ntriples $< | sort > $@

compare: from-ttl.nt from-jsonld.nt
	which ccdiff || (sudo apt update && sudo apt -y install ccdiff)
	ccdiff -u $^

graph.png: description.ttl | validate-ttl tools/rdflib/bin/rdf2dot
	which dot || (sudo apt update && sudo apt -y install graphviz)
	./tools/rdflib/bin/rdf2dot $< | dot -Tpng > $@
