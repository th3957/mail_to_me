$(document).on('turbolinks:load', function () {
  var limit_of_nested_images = 2

  function check_to_hide_or_show_add_link() {
    if ($('#add_image .nested-fields').length - $('#add_image .nested-fields').filter(':hidden').length == limit_of_nested_images) {
      $('a#add_image_link').hide();
    } else {
      $('a#add_image_link').show();
    }
  }

  check_to_hide_or_show_add_link();

  $('#add_image').on('cocoon:after-insert cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });
})
