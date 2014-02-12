@annotation:tour hello_world
#1. Hello World
##Challenge
Create an [Express.js](https://npmjs.org/package/express) app that runs on localhost:3000, and outputs "Hello World!" when somebody goes to root '/home'. `process.argv[2]` will be provided by Expressworks to you, this is the port number.

###Hints
This is how we can create an Express.js app on port 3000, that responds with a string on '/':

    var express = require('express')
    var app = express()
    app.get('/', function(req, res) {
      res.end('Hello World!')
    })
    app.listen(3000)

Please use `process.argv[2]` instead of port number:

    app.listen(process.argv[2])
    
###Install
You will need to install Express and Path modules

    npm install express path

###Documentation
- [Express module](https://npmjs.org/package/express) 
- [app.post (app.VERB)](http://expressjs.com/api.html#app.VERB)
- [Express API Docs](http://expressjs.com/api.html)
- [Express Guide](http://expressjs.com/guide.html)


@annotation:tour jade
#2. Jade Templating
##Challenge
Create an Express.js app with a home page ('/home') rendered by the [jade template engine](http://jade-lang.com/), that shows current date (`toDateString`).

###Hints
Jade template file `index.jade` is provided:

    h1 Hello World
    p Today is #{date}.

Use [`app.set()`](http://expressjs.com/api.html#app.set) to specify path in a typical Express.js app considering that the folder is 'templates':

    app.set('views', path.join(__dirname, 'templates'))

However, to use our index.jade, the path to index.jade will be provided in the `process.argv[3]` value. You are welcome to use your own jade file!

To tell Express.js app what template engine to use, apply this line to Express.js configuration:

    app.set('view engine', 'jade')

Instead of Hello World's `res.end`, the [`res.render`](http://expressjs.com/api.html#app.render) function accepts filename and data:

    res.render('index', {date: new Date().toDateString()})

We use `toDateString()` to simply return the date in a human readable format sans time.

When testing with node, you only specify the templates folder and Express does the rest

    node test.js 8000 ./templates

###Install
When creating your projects from scratch, install jade dependency with `npm install jade`

###Documentation
- [Jade site](http://jade-lang.com/)
- [app.set()](http://expressjs.com/api.html#app.set)
- [res.render](http://expressjs.com/api.html#app.render)


@annotation:tour good_old_form
#3. Good Old Form
##Challenge
Write a route ('/form') that processes HTML form input `<form><input name="str"/></form>` and prints backwards the `str` value.

###Hints
Express.js has `urlencoded()` middleware (from the [Connect library](http://www.senchalabs.org/connect/)) specified using [`app.use`](http://expressjs.com/api.html#app.use)

    app.use(express.urlencoded())

Here is how we can flip the characters

    req.body.str.split('').reverse().join('')

Avoid using soon to be deprecated `bodyParser()` middleware.

You can test using node like this

    curl --data "str=Mary%20had%20a%20little%20lamb" localhost:8000/form

###Documentation
- [app.set()](http://expressjs.com/api.html#app.set)
- [app.use](http://expressjs.com/api.html#app.use)
- [Connect library](http://www.senchalabs.org/connect/)

@annotation:tour static
#4. Static
##Challenge
Apply static middleware to serve index.html file without any routes. The index.html file is provided and usable via `process.argv[3]` value of the path to it. However, you can use your own file with this content:

    <html>
      <head>
        <link rel="stylesheet" type="text/css" href="/main.css"/>
      </head>
      <body>
        <p>I am red!</p>
      </body>
    </html>

###Hints
This you someone can call [static middleware](http://www.senchalabs.org/connect/)

    app.use(express.static(path.join(__dirname, 'public')));

For this exercise ExpressWorks will pass you the path:

    app.use(express.static(process.argv[3]||path.join(__dirname, 'public')));

To test with node, assuming you have created an `index.html` file in the root folder, use

    node test.js <port_num> ./

###Documentation
- [app.use](http://expressjs.com/api.html#app.use)
- [Connect library](http://www.senchalabs.org/connect/)


@annotation:tour stylish_css
#5. Stylish CSS
##Challenge
Style your HTML from previous example with some [Stylus](https://npmjs.org/package/stylus) middleware. The path to main.styl file is provided in `process.argv[3]` or you can create your own file/folder from these

    p
      color red

The index.html file:

    <html>
      <head>
        <title>expressworks</title>
        <link rel="stylesheet" type="text/css" href="/main.css"/>
      </head>
      <body>
        <p>I am red!</p>
      </body>
    </html>


###Hints
To plug-in stylus someone can use this middleware:

    app.use(require('stylus').middleware(__dirname + '/public'));

Remember that you need also to serve static files.

###Note

For your own projects, Stylus requires to be installed like any other dependency.

###Documentation
- [Stylus](https://npmjs.org/package/stylus)


@annotation:tour param_pam_pam
#6. Param Pam Pam
##Challenge
Create an Express.js server that processes PUT '/message/:id' requests, e.g. `PUT '/message/526aa677a8ceb64569c9d4fb'`

As the response of this request return an id SHA1 hashed with a date using the [crypto](https://npmjs.org/package/crypto) library 

    require('crypto')
      .createHash('sha1')
      .update(new Date().toDateString().toString() + id)
      .digest('hex')

##Hints
To extract parameters from within the request handlers, use

    req.params.NAME

Using curl, try something like

    curl --upload-file filename http://localhost:8000/message/526aa677a8ceb64569c9d4fb

###Documentation
- [crypto](https://npmjs.org/package/crypto)


@annotation:tour whats_in_query
#7. What's in Query
##Challenge
Write a route that extracts data from query string in the GET '/search' URL route, e.g. `?results=recent&include_tabs=true`  and then transforms outputs it back to the user in JSON format.

###Hints
In Express.js to extract query string parameters, we can use

    req.query.NAME

To output json we can use, `res.send(object)`.


@annotation:tour json_me
#8. JSON Me 
##Challenge

** NOT RELEASED **

Write a server that reads a file (file name is passed in process.argv[3]), parses it to JSON and outputs the content to the user with res.json(object). Everything should match to the 'books' resource.

###Hints
For reading, there's an [`fs`](http://nodejs.org/api/fs.html#fs_file_system) module, e.g.,

    fs.readFile(filename, callback)

While the parsing can be done with JSON.parse:

    object = JSON.parse(string)

###Documentation
- [fs](http://nodejs.org/api/fs.html#fs_file_system)

