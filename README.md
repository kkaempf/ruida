# ruida
Decoder and tooling for the RDWorks `.rd` file format

## About

[Thunderlaser](http://www.thunderlaser.com) laser cutter need a proprietary Windows
software ([RDWorks](http://rdworks.software.informer.com/8.0)) to
operate.

RDWorks generates `.rd` files to communicate with the laser cutter.

`.rd` files are (trivially) scrambled with strange encodings for
integer and floating point values.

This project provides tooling to display and decode this file format.

## License

Ruby

## Commands


### dump

Provides de-scrambled hexdump of an `.rd` file.


### decode

Provides a full decode of an `.rd` file, with commands and values
output in 'human-readable' form.


### lookuptable

Generates a lookup table (either in `--ruby` or in `--markdown`
format) the scrambled values.

### document

Generates a [github flavored](https://github.github.com/gfm) [markdown](https://daringfireball.net/projects/markdown/syntax) table,
listing all commands known to `decode`
