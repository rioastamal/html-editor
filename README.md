## About

A small and lighting fast in-browser HTML editor with syntax highlighting and instant preview for code you type. It is a great tool for HTML prototyping since you do not have to save the file everytime you want to make the changes. On top of that it's only single HTML file and works offline too.

You can think this app as a diet version of CodePen.io or JsFiddle but you can run it locally. It has two main windows -- left is used for code editor and the right one is used for HTML preview. For syntax highlighting it uses an awesome CodeMirror library.

HTML Editor support following features.

- Open file from local disk
- Save file to local disk
- Syntax highlighting
- Word Wrap
- Instant preview window
- Keyboard shortcuts
- Responsive design for mobile
- Works offline

Demo are available at [https://rioastamal.net/html-editor/](https://rioastamal.net/html-editor/)

![Demo HTML Editor](https://s3.amazonaws.com/rioastamal-assets/html-editor/html-editor-demo.gif)

## Run

To run the HTML editor just open file `src/index.html` using your favorite web browser and you're ready to go.

## Build

The build process will generate single HTML file of the editor. It may useful if you want to host or upload the editor to your own server. The build script only uses Bash so it should be easy to run.

```
$ bash build.sh
Build file build/index.html complete.
```

You can try to open file `build/index.html` using web browser.

## Changelog

### v1.3

* Add option to manually trigger preview

### v1.2

* Hide or show for code editor window
* Prompt a file name on SaveAs feature
* Confirm to user before closing or reloading the page
* Add meta tags to the page
* Add keyboard shortcuts

### v1.1

* Bug fixes: Undefined function name removeObjectURL() on saveAsFile() function.

### v1.0

* Initial release of HTML Editor

## Author

This application is written by Rio Astamal \<rio@rioastamal.net>

## License

This application is open source licensed under [MIT license](http://opensource.org/licenses/MIT).
