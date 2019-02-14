$(function() {
  $('#add_item').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
  });

  $('#add_item').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });

  check_to_hide_or_show_add_link();

  function check_to_hide_or_show_add_link() {
    if ($('#add_item .nested-fields').length == 100) {
      $('a#add_item_link').hide();
    } else {
      $('a#add_item_link').show();
    }
  }
})
