Webshot CLI
===========

> Easy website screenshots in CLI.

Overview
--------

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

Bugs
====

* The `--custom-header` option can't be set multiple times because of a
  [docopt bug](https://github.com/docopt/docopt.coffee/pull/8).
  Currently, I've written a fallback where the last `--custom-header` is
  set. With a patched docopt version, the multiple headers are working
  properly.

* When proxying an option to PhantomJS with `--p:` prefix, if it's an
  unknown option for PhantomJS, PhantomJS will crash but no error is
  returned. I believe it's more a bug with Webshot (or maybe PhantomJS
  does nothing but don't return an error code).
