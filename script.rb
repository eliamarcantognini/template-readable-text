# #!/usr/bin/env ruby

require 'nokogiri'
require 'redcarpet'

html_options = {
    with_toc_data: true,
    prettify: true,
}
md_options = {
    tables: true,
    strikethrough: true,
    superscript: true,
    underline: true,
    highlight: true,
    quote: true,
    footnotes: true,
    autolink: true,
    no_intra_emphasis: true,
}
toc = Redcarpet::Markdown.new(Redcarpet::Render::HTML_TOC.new(nesting_level: 2))
    .render(File.read("content.md"))
content = Redcarpet::Markdown.new(
    Redcarpet::Render::HTML.new(render_options = html_options), extensions = md_options)
    .render(File.read("content.md"))

title = Nokogiri::HTML.parse(content).css('h1')[0].text

fileHtml = File.new("build/index.html", "w+")
fileHtml.write(<<~EOH
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>#{title}</title>

    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/Microsoft/vscode/extensions/markdown-language-features/media/markdown.css">
    <link rel="stylesheet"
        href="https://cdn.jsdelivr.net/gh/Microsoft/vscode/extensions/markdown-language-features/media/highlight.css">

    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link ref="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="style.css">
    <script src="script.js"></script>
</head>
<body>
    <div id="container-floating">
        <div id="floating-button" type="button" class="navbar-toggle collapsed" data-toggle="collapse"
            data-target="#floatingnav" data-placement="left">
            <i id="legend" class="fa fa-font fa-stack-1x fa-inverse fa-2x" style="top:12px" role="button"
                tabindex="0"></i>
        </div>
        <div id="floatingnav" class="collapse">
            <div class="nd1 nds" data-toggle="tooltip" data-placement="left">
                <i id="locateplace" class="fa fa-minus fa-stack-1x fa-inverse fa-2x" style="top:12px" role="button"
                    onclick="decreaseFontSize()" tabindex="0"></i>
            </div>
            <div class="nd3 nds" data-toggle="tooltip" data-placement="left">
                <i id="locateplace" class="fa fa-plus fa-stack-1x fa-inverse fa-2x" style="top:12px"
                    onclick="increaseFontSize()" role="button" tabindex="1"></i>
            </div>
        </div>
    </div>
    #{toc}
    #{content}
</body>
</html>
EOH
)
fileHtml.close