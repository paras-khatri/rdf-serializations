# RDF serializations

Clone this repository somewhere below your home directory:

```
git clone https://github.com/sils-webinfo/rdf-serializations.git
```

If you're running an Ubuntu VM using multipass, your home directory
should be mapped to `~/Home`.

## Validate your Turtle file

Create a Turtle file and save it as `description.ttl` within the
`rdf-serializations` directory.

Then run:
```
make validate-ttl
```

## Convert your Turtle file to N-Triples

Run:
```
make from-ttl.nt
cat from-ttl.nt
```

## View your Turtle file as a graph

Run:
```
make graph.png
```

Then open `graph.png` in your image viewer of choice.

## Validate your JSON-LD file

Create a JSON-LD file and save it as `description.jsonld` within the
`rdf-serializations` directory.

Then run:
```
make validate-jsonld
```

## Convert your JSON-LD file to N-Triples

Run:
```
make from-jsonld.nt
cat from-jsonld.nt
```

## Compare the triples produced from your Turtle and JSON-LD files

Run:
```
make compare
```

If you don't see any red or green parts, then the triples from the two
files are the same.

