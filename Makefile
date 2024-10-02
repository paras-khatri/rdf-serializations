.PHONY: clean superclean validate-ttl validate-jsonld compare

RIOT := tools/jena/bin/riot
RDF2DOT := tools/rdflib/bin/rdf2dot

clean:
	rm -f *.nt graph.png

superclean: clean
	$(MAKE) -s -C tools/jena clean
	$(MAKE) -s -C tools/rdflib clean

$(RIOT):
	$(MAKE) -s -C tools/jena

$(RDF2DOT):
	$(MAKE) -s -C tools/rdflib

validate-ttl: description.ttl | $(RIOT)
	./$(RIOT) --validate $<
	@echo "Turtle file is valid."

validate-jsonld: description.json | $(RIOT)
	./$(RIOT) --validate $<
	@echo "JSON-LD file is valid."

from-ttl.nt: description.ttl | validate-ttl
	./$(RIOT) --output=ntriples $< | sort > $@

from-jsonld.nt: description.json | validate-jsonld
	./$(RIOT) --output=ntriples $< | sort > $@

compare: from-ttl.nt from-jsonld.nt
	ccdiff -u $^

graph.png: description.ttl | validate-ttl $(RDF2DOT)
	./$(RDF2DOT) $< | dot -Tpng > $@
