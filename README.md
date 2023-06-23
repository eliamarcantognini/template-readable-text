
# HOWTO:

## 1

Write your content in content.md using markdown syntax.

## 2

Use Markdown All In One (VSCode extension) to print .md to html.

## 3

Manipulate the generated HTML like this:

Add at the end of the head tag:  
```
  <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link ref="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="style.css">
  <script src="script.js"></script>
        
```

Add at the beginning of the body tag:  
```

    <div id="container-floating">
        <div id="floating-button" type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#floatingnav"  data-placement="left">
          <i id="legend" class="fa fa-font fa-stack-1x fa-inverse fa-2x" style="top:12px" role="button" tabindex="0"></i>
        </div>
        <div id="floatingnav" class="collapse">
            <div class="nd1 nds" data-toggle="tooltip" data-placement="left">
                <i id="locateplace" class="fa fa-minus fa-stack-1x fa-inverse fa-2x" style="top:12px" role="button" onclick="decreaseFontSize()" tabindex="0"></i>
            </div>
            <div class="nd3 nds" data-toggle="tooltip" data-placement="left">
                <i id="locateplace" class="fa fa-plus fa-stack-1x fa-inverse fa-2x" style="top:12px" onclick="increaseFontSize()" role="button" tabindex="1"></i>
            </div>
        </div>
    </div>

```

## 4

Rename content.html to index.html and activate github pages.

## 5

Enjoy your content.


# TODO:

- Automatize all steps above with Github Actions!
