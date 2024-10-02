# RDF serializations

Comparing the Turtle, N-Triples, and JSON-LD serializations of RDF.

## Validate your Turtle file

Edit `description.ttl`, then run:

```sh
make validate-ttl
```

## Convert your Turtle file to N-Triples

Run:

```sh
make from-ttl.nt
```

## View your Turtle file as a graph

Run:

```sh
make graph.png
```

## Validate your JSON-LD file

Edit `description.json`, then run:

```sh
make validate-jsonld
```

## Convert your JSON-LD file to N-Triples

Run:

```sh
make from-jsonld.nt
```

## Compare the triples produced from your Turtle and JSON-LD files

Run:

```sh
make compare
```

If you don't see any red or green parts, then the triples from the two
files are the same.
