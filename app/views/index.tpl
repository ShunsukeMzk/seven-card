<html>
<head>

<!-- インクルード -->
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css" >

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- スタイル -->
<link rel="stylesheet" href="{{url('static_file', filepath='static/card.css')}}" type="text/css">


<title>seven-card</title>

</head>
<body>

<!-- スクリプト -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>


<h1>seventh-card</h1>
<h2>Create Card</h2>

<div class="createCards">

<!-- プレビューカード -->
% include("preview.tpl")
<!-- プレビューカード -->

<!-- クリエイトカード1 -->
% include("m_name.tpl")
% # include("m_image.tpl")
% include("m_description.tpl")
% include("m_selectImage.tpl")
% # include("m_birthday.tpl")
% include("m_parentNo.tpl")
<!-- クリエイトカード1 -->
</div>

<form name="createForm" action="http://localhost:8080/create" method="post" enctype="multipart/form-data">

  <input type="text" name="name" style="display: none;"/>
  <input type="text" name="selectImage" style="display: none;"/>
  <input type="text" name="parentNo" value="--" style="display: none;" />
  <textarea id="description" name="description" style="display: none;"></textarea>

</form>

<h2>Showcase</h2>
<form name="cardForm" action="" method="post">
<div class="showcase">
% for card in first_cards:
  % include("card.tpl", no=card.no, name=card.name, description=card.description, img=card.image)
% end
</div>
</form>


</body>

</html>
