#!/bin/sh

set -e
domain=$1
domain=${domain:?}

cat <<-!
<!doctype html>
<head>
<link rel="stylesheet" href="gleaner.css" type="text/css" media="all">
</head>
<body>
  <div id="header"></div>
  <iframe id="content" src="http://$domain"></iframe>

  <div id="gleanings" class="helper">
   <h2>Gleanings</h2>
   <form method="POST">
     <input type="submit" name="submit" class="submit" value="save" />
     <textarea></textarea>
   </form>
  </div>

  <div id="navigation" class="helper">
  <h2>Navigation</h2>
  <ol class="xoxo presentation">
!

sed -e 's/<td/\
<td/g' |
    grep '<a ' |
    sed -e 's/^.*>http/http/' -e 's/<.*$//' -e '/^ *$/d' -e "s/$domain:80\//$domain\//" |
    sed -e 's:^\(.*\)$:<li><a href="\1">item</a></li>:'

cat <<-!
  </ol>
</div>
<script src="js/jquery.js"></script>
<script src="js/draggable.min.js"></script>
<script src="gleaner.js"></script>
</body>
</html>
!
