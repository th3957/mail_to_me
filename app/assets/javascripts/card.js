$(function() {
  $('#add_image').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#add_image').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#add_image .nested-fields').length == 2) {
      $('a#add_image_link').hide();
    } else {
      $('a#add_image_link').show();
    }
  }
})
