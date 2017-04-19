<html>
<head>

<!-- インクルード -->
<link rel="stylesheet" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/flick/jquery-ui.css" >

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- スタイル -->
<link rel="stylesheet" href="{{url('static_file', filepath='static/card.css')}}" type="text/css">


<title>seventh-card</title>

</head>
<body>

<!-- スクリプト -->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<h1>seventh-card</h1>
<h2>Card List</h2>

<div class="">
% include("card.tpl", no=parent_card.no, name=parent_card.name, description=parent_card.description, img=parent_card.image)
</div>

<form name="cardForm" action="" method="post">
<div class="showcase">
% for i, child_card in enumerate(child_cards):
  % include("card.tpl", no=child_card.no, name=child_card.name, description=child_card.description, img=child_card.image)
% end
</div>
</form>


</body>
</html>