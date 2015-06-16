$.ajaxSetup({
  headers: {
    'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
  }
});

$(document).on('click', '.addThisItemButton', function(e){
  console.log('add '+$(this).data('id')+' to shopping cart');
  var product_id = $(this).data('id');
  $.ajax({
    type: 'POST',
    url: "/line_items",
    data: {
      line_item: {'product_id': product_id, 'quantity': 1}
    },
    success: function(doc){
      console.log(doc);
    }
  });

});