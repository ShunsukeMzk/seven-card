<script>
function reflect_description() {
  var description = $('#m_description').val();
  $('#description').val(description);
  $('#preview_description').text(description);
}
</script>

  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_description.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Input Card Description</h1>
      <div class="form-group form-group-sm">
        <textarea id="m_description" name="m_description" rows="3" cols=""30 wrap="hard" class="form-control" style="resize: none;" /></textarea>
      </div>
    </div>
    <div class="card-link">
      <a href="javascript:reflect_description();">Reflect</a>
    </div>
  </section>
