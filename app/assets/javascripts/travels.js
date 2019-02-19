$(document).on('turbolinks:load', function () {
  function check_to_hide_or_show_add_link() {
    var limit_of_nested_areas = 10
    if ($('#add_area .nested-fields').length - $('#add_area .nested-fields').filter(':hidden').length == limit_of_nested_areas) {
      $('a#add_area_link').hide();
    } else {
      $('a#add_area_link').show();
    }
  }

  function set_returned_at() {
    $('select[id^=travel_departed_at_][id$=i]').
      on('change', function () {
        var value = $(this).val();
        var departed_at = $(this).attr('id');
        var returned_at_id = departed_at.replace(/^travel_departed_at_(\d)i/, 'select#travel_returned_at_$1i');
        $(returned_at_id).val([value]);
      });
  }

  function set_left_at() {
    $('select[id^=travel_areas_attributes_][id*=_arrived_at_][id$=i]').
      on('change', function () {
        var value = $(this).val();
        var arrived_at_id = $(this).attr('id');
        var left_at_id = arrived_at_id.
          replace(/^travel_areas_attributes_(\d+)_arrived_at_(\d)i/, 'select#travel_areas_attributes_$1_left_at_$2i');
        $(left_at_id).val([value]);
      });
  }

  set_returned_at();
  check_to_hide_or_show_add_link();

  $('#add_area').on('cocoon:after-insert', function() {
    check_to_hide_or_show_add_link();
    set_left_at();
  });

  $('#add_area').on('cocoon:after-remove', function() {
    check_to_hide_or_show_add_link();
  });
})
