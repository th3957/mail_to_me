$(document).on('turbolinks:load', function () {
  const limit_of_nested_items = 100

  function check_to_hide_or_show_add_link() {
    if ($('#add_item .nested-fields').length - $('#add_item .nested-fields').filter(':hidden').length == limit_of_nested_items) {
      $('a#add_item_link').hide();
    } else {
      $('a#add_item_link').show();
    }
  }

  check_to_hide_or_show_add_link();

  $('#add_item').on('cocoon:after-insert cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });
})
