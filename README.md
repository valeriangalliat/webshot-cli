# Webshot CLI [![npm version](http://img.shields.io/npm/v/webshot-cli.svg?style=flat-square)](https://www.npmjs.org/package/webshot-cli)

> Easy website screenshots in CLI.

Description
-----------

This software is a wrapper around the [Webshot library], providing a
simple command to take local or remote webpage screenshots.

[Webshot library]: https://github.com/brenden/node-webshot

```
Usage: webshot [--custom-header=<header>]... [options] [<url>] [<dest>]

Arguments:
  <url>   A webpage URL (can be a local file) [default: -].
  <dest>  Where to save the image [default: -].

Options:
  -h, --help                  Show this help.
  --version                   Show version.
  --window-size=<size>        Browser window size [default: 1024/768].
  --shot-size=<size>          The area to capture [default: window/window].
  --shot-offset=<offset>      Left, right, top and bottom offset [default: 0/0/0/0].
  --phantom-path=<path>       The location of PhantomJS [default: phantomjs].
  --custom-header=<header>    Additional header (can be set multiple times).
  --default-white-background  White background if no background is set.
  --custom-css=<css>          Custom CSS rules.
  --quality=<quality>         JPEG compression quality [default: 75].
  --stream-type=<type>        Streaming file type [default: png].
  --render-delay=<delay>      Number of milliseconds to wait [default: 0].
  --timeout=<timeout>         Kill PhantomJS after this number of milliseconds [default: 0].
  --shot-callback             Wait for `window.callPhantom('takeShot');`.
  --http-error                Cause an error if HTTP status is not 200.

See <https://github.com/brenden/node-webshot> for options details.

All options beginning with `--p:` like `--p:cookies-path` are passed
to PhantomJS. See <http://phantomjs.org/api/command-line.html>.
```

The main difference with the Webshot library is you don't have to give
an absolute `file://` URL to capture a local file with working assets.
The software will resolve it for you.

Examples
--------

Standard I/O screenshot:

```sh
webshot < example.html > example.png
webshot --quality=100 --stream-type=jpeg < example.html > example.jpeg
```

Shot an URL:

```sh
webshot example.html example.png
webshot 'https://www.npmjs.org/' npmjs.png
```

For `example.html`, the difference with the I/O version is the relative
assets will be loaded properly.

Bugs
----

* When proxying an option to PhantomJS with `--p:` prefix, if it's an
  unknown option for PhantomJS, PhantomJS will crash but no error is
  returned. I believe it's more a bug with Webshot (or maybe PhantomJS
  does nothing but don't return an error code).
