# Routing Practice

Let's play with routing.

## Quickstart

```bash
git clone <this repo>
cd routing-practice
bundle
ruby example.rb
```

## Quickstart (Docker)

```bash
git clone <this repo>
cd routing-practice
docker build -t routing-practice .
./bin/server
```

Then visit http://localhost:9292 and you should see an amazing homepage


## TODO

To run the tests run `./bin/test`
 
1. Visit the homepage. Why is the image broken? How can we fix it? Add code to the routing_example.rb to serve the image.
2. Discuss whether the solution to the above would scale if the page had several images, css and javascript files, and think how we could make it more extensible.
3. Click the link. It's broken too! What's going on? How can we fix it? Add code to the routing_example.rb to fix the link.
4. Now the form isn't working..! Let's add more code to make it work
5. Do all the tests pass? How could we refactor the code we've written?
6. Add code to support the editing, updating and deleting of fruits. What conventions could we adopt to simplify / reduce the number of URLs in our system?
7. The marketing department say that they want the URLs changed to say 'foodstuffs'. What do we need to refactor in our code?
