<script>
  $(document).on('change', ':file', function() {
    var input = $(this),
    numFiles = input.get(0).files ? input.get(0).files.length : 1,
    label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
    input.parent().parent().prev(':text').val(label);
  });
</script>
  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_image.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Select Card Image</h1>
      <div class="form-group form-group-sm">
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
    </div>
    <div class="card-link">
      <a href="">Reflect</a>
    </div>
  </section>