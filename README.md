# RDF serializations

## Validate your Turtle file

Edit `description.ttl` and write some triples using Turtle.

Then run:

```sh
make validate-ttl
```

## Convert your Turtle file to N-Triples

Run:

```sh
make from-ttl.nt
cat from-ttl.nt
```

## View your Turtle file as a graph

Run:

```sh
make graph.png
```

Then open `graph.png` in your image viewer of choice.

## Validate your JSON-LD file

Edit `description.json` and write some triples using JSON-LD.

Then run:

```sh
make validate-jsonld
```

## Convert your JSON-LD file to N-Triples

Run:

```sh
make from-jsonld.nt
cat from-jsonld.nt
```

## Compare the triples produced from your Turtle and JSON-LD files

Run:

```sh
make compare
```

If you don't see any red or green parts, then the triples from the two
files are the same.
