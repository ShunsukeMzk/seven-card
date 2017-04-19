<script>
function reflect_parentNo() {
  var parentNo = $('#m_parentNo').val();
  $(':text[name="parentNo"]').val(parentNo);
  $('#parentNo').text(parentNo);
}
</script>
  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_parentNo.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Select Parent Card No</h1>
      <div class="form-group form-group-sm">
        <select id="m_parentNo" class="form-control" >
          <option value="--"></option>
% for card in first_cards:
          <option value={{card.no}}>No:{{card.no}}&nbsp;{{card.name}}</option>
% end
        </select>
      </div>
    </div>
    <div class="card-link">
      <a href="javascript:reflect_parentNo();">Reflect</a>
    </div>
  </section>