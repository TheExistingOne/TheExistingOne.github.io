#!/bin/sh

echo "Enter filename:"
read filename

echo "Enter full name:"
read name

genMarkdown () {
    touch ./blog/markdown/${filename}.md
    echo "# ${name}" >> ./blog/markdown/${filename}.md
    echo "## by Mia Greer" >> ./blog/markdown/${filename}.md
    echo "" >> ./blog/markdown/${filename}.md

    echo "Created markdown file at ./blog/markdown/${filename}.md"
}

genRenderer () {
    echo "Created boilerplate renderer at ./blog/boilerplate/${filename}.html"
    echo "<!DOCTYPE html> 
<html lang=\"en_US\"> 
    <head>
        <meta charset=\"utf-8\">
        <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
        <title>Blog - NAME</title>
    </head>
    <body>
        <div id=\"content\"></div>
        <script src=\"https://cdn.jsdelivr.net/npm/marked/marked.min.js\"></script>
        <script>
            document.getElementById('content').innerHTML = marked('# Marked in browser. Rendered by **marked**.');
        </script>
    </body>
</html>" >> ./blog/boilerplate/${filename}.html
}

append () {
    echo "Appeneded post to blog-directory.html"
}

genMarkdown
genRenderer
append
