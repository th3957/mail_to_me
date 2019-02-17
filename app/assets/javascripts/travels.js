$(document).on('turbolinks:load', function () {
  const limit_of_nested_areas = 10

  function check_to_hide_or_show_add_link() {
    if ($('#add_area .nested-fields').length - $('#add_area .nested-fields').filter(':hidden').length == limit_of_nested_areas) {
      $('a#add_area_link').hide();
    } else {
      $('a#add_area_link').show();
    }
  }

  check_to_hide_or_show_add_link();

  $('#add_area').on('cocoon:after-insert cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });
})
