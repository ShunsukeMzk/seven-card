<link href="{{url('static_file', filepath='static/bootstrap-datepicker/css/bootstrap-datepicker.min.css')}}" rel="stylesheet" type="text/css">
<script src="{{url('static_file', filepath='static/bootstrap-datepicker/js/bootstrap-datepicker.min.js')}}" type="text/javascript"></script>

<script>
$('#sandbox-container .input-group.date').datepicker({
    beforeShowYear: function (date){
                  if (date.getFullYear() == 2007) {
                    return false;
                  }
                },
    datesDisabled: ['04/06/2017', '04/21/2017'],
    toggleActive: true
});
</script>

  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_birthday.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Input Birthday</h1>
      <div class="form-group form-group-sm">

<div class="input-group date">
  <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-th"></i></span>
</div>

      </div>
    </div>
    <div class="card-link">
      <a href="javascript:document.createForm.submit();">Reflect</a>
    </div>
  </section>
