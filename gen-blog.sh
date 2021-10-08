#!/bin/sh

echo "Enter filename:"
read filename

echo "Enter full name:"
read name

genMarkdown () {
    touch ./blog/markdown/${filename}.md
    echo "# ${name}" >> ./blog/markdown/${filename}.md
    echo "## by Mia G." >> ./blog/markdown/${filename}.md
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
        <script src=\"https://cdn.jsdelivr.net/npm/marked/marked.min.js\"></script>
        <title>Blog - ${name}</title>
    </head>
    <body>
        <div id=\"content\"></div>
        <script defer>
            var xhr = new XMLHttpRequest();

            var markdown;

            xhr.onreadystatechange = function() {
                if (xhr.readyState == 4 && xhr.status == 200) {
                    markdown = xhr.responseText;
                    
                    console.log(markdown);
                    document.getElementById('content').innerHTML = marked(markdown);
                }
            }
            xhr.open('GET', '../markdown/${filename}.md');
            xhr.send();
        </script>
        <noscript>
            <p>
                Hey! I use javascipt to render the markdown that I write these posts in.
                If you want to read the post here, you'll need to enable scripting.
                I'm not doing anything funky, you can check for yourself at github.com/TheExistingOne/TheExistingOne.github.io. 
            </p>
        </noscript>
    </body>
</html>" >> ./blog/boilerplate/${filename}.html
}

append () {
    echo "Appeneded post to blog-directory.html"
}

genMarkdown
genRenderer
append
