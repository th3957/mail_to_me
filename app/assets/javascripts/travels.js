$(function() {
  $('#add_area').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#add_area').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#add_area .nested-fields').length == 10) {
      $('#add_area_link').hide();
    } else {
      $('#add_area_link').show();
    }
  }
})
