document.addEventListener("turbolinks:load", function() {

    $('.invalid-feedback').show();

    $('body').on('click', 'a[rel=add_invoice_item]', function () {
        var cloned_row = $('div[rel=invoice_item]:first').clone(true);
        var new_id = Date.now();
        cloned_row.find('input').each(function(){
           $(this).val('');
           $(this).attr('id', $(this).attr('id').replace(/\d+/, new_id));
            $(this).attr('name', $(this).attr('name').replace(/\d+/, new_id));
        });
        cloned_row.find('label').each(function(){
            $(this).val('');
            $(this).attr('for', $(this).attr('for').replace(/\d+/, new_id));
        });
        cloned_row.insertAfter($('div[rel=invoice_item]:last'));
    });

    $('body').on('click', "a[rel=deleteInvoice]", function(){
        var corresponding_id_field = $(this).parents('div.row').find('input').attr('name').replace('description', 'id');
        $('input[name="' + corresponding_id_field  + '"]').each(function(){
            var cloned_input = $(this).clone(true);
            cloned_input.attr('name', cloned_input.attr('name').replace('[id]', '[_destroy]'));
            cloned_input.val(1);
            cloned_input.insertAfter($(this));
        });
        $(this).parents('div.row').remove();
    });

    $('body').on('click', "a[rel=print]", function(){
        window.print()
    });
});