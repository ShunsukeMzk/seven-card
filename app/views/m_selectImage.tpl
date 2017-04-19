<script>
function reflect_selectImage() {
  var selectImage = $(':text[name="m_selectImage"]').val();
  $("#preview_image").attr('src', {{url('static_file', filepath='selectImages/')}} + selectImage);
}
</script>
  <section class="card">
    <img class="card-img" src="{{url('static_file', filepath='images/m_selectImage.jpg')}}" alt="">
    <div class="card-content">
      <h1 class="card-title">Select Card Image</h1>
      <div class="form-group form-group-sm">
        <div class="input-group">
          <input type="text" class="form-control" name="m_selectImage" readonly="" />
          <label class="input-group-btn">
            <button type="button" id="sampleButton" class="btn btn-info btn-sm">
	          select
            </button>
          </label>
        </div>
      </div>
    </div>
    <div class="card-link">
      <a href="javascript:reflect_selectImage();">Reflect</a>
    </div>
  </section>




<!-- modal -->
<!-- Button trigger modal -->



<!-- モーダル・ダイアログ -->
<script>
$( function() {
  $('#sampleButton').on('click', function () {
    $('#sampleModal').modal();
  });
});
</script>
<div class="modal fade" id="sampleModal" tabindex="-1">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span>×</span></button>
        <h4 class="modal-title">Select Image</h4>
      </div>
      <div class="modal-body" style="height: 80%; overflow: scroll;">

<!-- image picker -->
<script src="{{url('static_file', filepath='static/image-picker.min.js')}}" type="text/javascript"></script>

<script>
$( function() {
  $('#select').on('click', function () {
    $(':text[name="m_selectImage"]').val($('#selectImage').val());
    $(':text[name="selectImage"]').val($('#selectImage').val());
  });
});
$(document).ready(function () {
  $("select.image-picker").imagepicker({hide_select: true});
  $("select.image-picker.show-labels").imagepicker({hide_select: false, show_label: true});

  var container = $("select.image-picker.masonry").next("ul.thumbnails");
  container.imagesLoaded(function(){
    container.masonry({
      itemSelector:   "li",
    });
  });
});
</script>
<style>
ul.thumbnails.image_picker_selector {
  overflow: auto;
  list-style-image: none;
  list-style-position: outside;
  list-style-type: none;
  padding: 0px;
  margin: 0px; }
  ul.thumbnails.image_picker_selector li {
    margin: 0px 12px 12px 0px;
    float: left; }
    ul.thumbnails.image_picker_selector li .thumbnail {

      background-color: #fff;

      padding: 6px;
      border: 1px solid #dddddd; }
      ul.thumbnails.image_picker_selector li .thumbnail img{
        max-width: 200px;
        height: 140px;
      }

    ul.thumbnails.image_picker_selector li .thumbnail.selected {
      background: #0088cc; }
</style>


<div class="picker">
  <select class="image-picker show-html" id="selectImage">
% for file in selectImages:
    <option data-img-src="{{url('static_file', filepath='selectImages/' + file)}}" value={{file}}>{{file}}</option>
% end
  </select>
</div>
<!-- image picker -->


      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">close</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="select">select</button>
      </div>
    </div>
  </div>
</div>
<!-- modal -->