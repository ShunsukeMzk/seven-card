<script>
function drop{{no}}(){
    document.cardForm.action = "http://localhost:8080/drop/{{no}}";
    document.cardForm.submit();
}
function list{{no}}(){
    document.cardForm.action = "http://localhost:8080/list/{{no}}";
    document.cardForm.submit();
}
function action{{no}}(){
    document.cardForm.action = "http://localhost:8080/action/scrape/{{no}}";
    document.cardForm.submit();
}
</script>

  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/' + img)}}" alt="">
    <div class="card-content">
      <h1 class="card-title">{{name}}</h1>
      <pre class="card-text">{{description}}</pre>
    </div>
    <div class="card-link">
      <label>no:{{no}}</label>
      <a href="#" onclick="drop{{no}}();return false;">Drop</a>
      <a href="#" onclick="list{{no}}();return false;">List</a>
      <a href="#" onclick="action{{no}}();return false;">Action</a>
    </div>
  </section>
