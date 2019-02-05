## About

This application is a simple HTML editor with syntax highlighting and instant preview capability. It has two main windows -- left is used for code editor and the right one is used for HTML preview. For syntax highlighting it uses CodeMirror library.

Demo are available at [https://rioastamal.net/html-editor/](https://rioastamal.net/html-editor/)

![Demo HTML Editor](https://s3.amazonaws.com/rioastamal-assets/html-editor/html-editor-demo.mov.gif)

## Run

To run the HTML editor just open file `src/index.html` using your favorite web browser and you're ready to go.

## Build

The build process will generate single HTML file of the editor. It may useful if you want to host or upload the editor to your own server. The build script only uses Bash so it should be easy to run.

```
$ bash build.sh
Build file build/index.html complete.
```

You can try to open file `build/index.html` using web browser.

## Author

This application is written by Rio Astamal \<rio@rioastamal.net>

## License

This application is open source licensed under [MIT license](http://opensource.org/licenses/MIT).