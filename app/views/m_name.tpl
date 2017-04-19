<script>
function reflect_name() {
  var name = $(':text[name="m_name"]').val();
  $(':text[name="name"]').val(name);
  $('#preview_name').text(name);
}
</script>

  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_name.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Input Card Name</h1>
      <div class="form-group form-group-sm">
        <input name="m_name" type="text" class="form-control" />
      </div>
    </div>
    <div class="card-link">
      <a href="javascript:reflect_name();">Reflect</a>
    </div>
  </section>


<!--
<section class="card">
  <div style="height: 10%; padding: 14px; font-size: 11px; color: #fff; background-color: #0bd; border-radius: 5px 5px 0 0;">
    <label>Create New Card.</label>
  </div>
  <div style="height: 80%; padding: 10px; font-size: 11px;">
    <div class="form-group form-group-sm">
      <label>Name</label>
      <input name="name" type="text" class="form-control" />
    </div>
    <div class="form-group form-group-sm">
      <label>Image</label>
      <div class="input-group">
        <input type="text" class="form-control" readonly="" />
        <label class="input-group-btn">
          <span class="btn btn-info btn-sm">
            Browse
            <input name="image" type="file" style="display:none">
          </span>
        </label>
      </div>
    </div>
    <div class="form-group form-group-sm">
      <label>Description</label>
      <textarea name="description" rows="6" cols=""30 wrap="hard" class="form-control" style="resize: none;" /></textarea>
    </div>
  </div>
  <div class="card-link">
    <a href="javascript:document.createForm.submit();">Create</a>
  </div>
</section>
-->