submit_message = function() {
    $('#message_body').on('keydown', function(e) {
        if (e.keyCode == 13) {
            $('button').click();
            e.target.value = "";
        };
    });
};

$(document).on('turbolinks:load', function() {
    $('.ui.dropdown').dropdown();
    $('.comments .close').on('click', function() {
        $(this).closest('.comments').transition('fade');
    });
    submit_message();
})