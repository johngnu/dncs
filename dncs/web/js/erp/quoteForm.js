var FormWizard = function () {

    var handleDatePickers = function () {

        if (jQuery().datepicker) {
            $('.date-picker').datepicker({
                rtl: App.isRTL(),
                orientation: "buttom",
                startDate: "-30d",
                autoclose: true,
                defaultDate: new Date()
            });
            //$('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
        }

        /* Workaround to restrict daterange past date select: http://stackoverflow.com/questions/11933173/how-to-restrict-the-selectable-date-ranges-in-bootstrap-datepicker */

        // Workaround to fix datepicker position on window scroll
        $(document).scroll(function () {
            $('#form_modal2 .date-picker').datepicker('place'); //#modal is the id of the modal
        });
    };


    return {
        //main function to initiate the module
        init: function () {
            handleDatePickers();

            if (!jQuery().bootstrapWizard) {
                return;
            }

            function format(state) {
                if (!state.id)
                    return state.text; // optgroup
                return "<img class='flag' src='/metronic/theme/assets/global/img/flags/" + state.id.toLowerCase() + ".png'/>&nbsp;&nbsp;" + state.text;
            }

            $("#product_list").select2({
                placeholder: "Selecione producto",
                allowClear: true,
                formatResult: format,
                width: 'auto',
                formatSelection: format,
                escapeMarkup: function (m) {
                    return m;
                }
            });

            $("#client_list").select2({
                placeholder: "Seleccione cliente",
                allowClear: true,
                formatResult: format,
                width: 'auto',
                formatSelection: format,
                escapeMarkup: function (m) {
                    return m;
                }
            });
            // Bind an event
            $('#client_list').on('select2:select', function (e) {
                var data = e.params.data;
                window.location = '?cid=' + data.id;
            });

            var form = $('#submit_form');
            var error = $('.alert-danger', form);
            var success = $('.alert-success', form);

            form.validate({
                doNotHideMessage: true, //this option enables to show the error/success messages on tab switch.
                errorElement: 'span', //default input error message container
                errorClass: 'help-block help-block-error', // default input error message class
                focusInvalid: false, // do not focus the last invalid input
                rules: {
                    //cliente
                    nombre: {
                        minlength: 1,
                        required: true
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    telefono: {
                        required: true
                    },
                    //emision
                    emision: {
                        required: true
                    },
                    validez: {
                        digits: true,
                        required: true
                    },
                    //entrega
                    plazo_entrega: {
                        required: true
                    },
                    lugar_entrega: {
                        required: true
                    }
                },

                messages: {// custom messages for radio buttons and checkboxes

                },

                invalidHandler: function (event, validator) { //display error alert on form submit   
                    success.hide();
                    error.show();
                    App.scrollTo(error, -200);
                },

                highlight: function (element) { // hightlight error inputs
                    $(element).closest('.form-group').removeClass('has-success').addClass('has-error'); // set error class to the control group
                },

                unhighlight: function (element) { // revert the change done by hightlight
                    $(element).closest('.form-group').removeClass('has-error'); // set error class to the control group
                },

                success: function (label) {
                    if (label.attr("for") === "gender" || label.attr("for") === "extras[]") { // for checkboxes and radio buttons, no need to show OK icon
                        label.closest('.form-group').removeClass('has-error').addClass('has-success');
                        label.remove(); // remove error label here
                    } else { // display success icon for other inputs
                        label.addClass('valid') // mark the current input as valid and display OK icon
                                .closest('.form-group').removeClass('has-error').addClass('has-success'); // set success class to the control group
                    }
                },

                submitHandler: function (form) {
                    success.show();
                    error.hide();
                    form[0].submit();
                    //add here some ajax code to submit your form or just call form.submit() if you want to submit the form without ajax
                }

            });

            var displayConfirm = function () {
                $('#tab4 .form-control-static', form).each(function () {
                    var input = $('[name="' + $(this).attr("data-display") + '"]', form);
                    if (input.is(":radio")) {
                        input = $('[name="' + $(this).attr("data-display") + '"]:checked', form);
                    }
                    if (input.is(":text") || input.is("textarea")) {
                        $(this).html(input.val());
                    } else if (input.is("select")) {
                        $(this).html(input.find('option:selected').text());
                    } else if (input.is(":radio") && input.is(":checked")) {
                        $(this).html(input.attr("data-title"));
                    } else if ($(this).attr("data-display") === 'extras[]') {
                        var extras = [];
                        $('[name="extras[]"]:checked', form).each(function () {
                            extras.push($(this).attr('data-title'));
                        });
                        $(this).html(extras.join("<br>"));
                    }
                });
            };

            var handleTitle = function (tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                // set wizard title
                $('.step-title', $('#form_wizard_1')).text('Step ' + (index + 1) + ' of ' + total);
                // set done steps
                jQuery('li', $('#form_wizard_1')).removeClass("done");
                var li_list = navigation.find('li');
                for (var i = 0; i < index; i++) {
                    jQuery(li_list[i]).addClass("done");
                }

                if (current === 1) {
                    $('#form_wizard_1').find('.button-previous').hide();
                } else {
                    $('#form_wizard_1').find('.button-previous').show();
                }

                if (current >= total) {
                    $('#form_wizard_1').find('.button-next').hide();
                    $('#form_wizard_1').find('.button-submit').show();
                    displayConfirm();
                } else {
                    $('#form_wizard_1').find('.button-next').show();
                    $('#form_wizard_1').find('.button-submit').hide();
                }
                App.scrollTo($('.page-title'));
            };

            // default form wizard
            $('#form_wizard_1').bootstrapWizard({
                'nextSelector': '.button-next',
                'previousSelector': '.button-previous',
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;

                    success.hide();
                    error.hide();
                    if (form.valid() === false) {
                        return false;
                    }

                    handleTitle(tab, navigation, clickedIndex);
                },
                onNext: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    if (form.valid() === false) {
                        return false;
                    }

                    handleTitle(tab, navigation, index);
                },
                onPrevious: function (tab, navigation, index) {
                    success.hide();
                    error.hide();

                    handleTitle(tab, navigation, index);
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#form_wizard_1').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            $('#form_wizard_1').find('.button-previous').hide();
            $('#form_wizard_1 .button-submit').click(function () {
                //alert('Finished! Hope you like it :)');
                //return true;
            }).hide();

            //apply validation on select2 dropdown value change, this only needed for chosen dropdown integration.
            $('#product_list', form).change(function () {
                form.validate().element($(this)); //revalidate the chosen dropdown value and show error or success message for the input
            });
        }

    };

}();

jQuery(document).ready(function () {
    FormWizard.init();
});

var table = $('#sample_3');
// begin: third table
table.dataTable({
    // Internationalisation. For more info refer to http://datatables.net/manual/i18n
    "language": {
        "aria": {
            "sortAscending": ": Activar para ordenar la columna de manera ascendente",
            "sortDescending": ": Activar para ordenar la columna de manera descendente"
        },
        "emptyTable": "Ningún dato disponible en esta tabla",
        "info": "_START_ al _END_ de _TOTAL_",
        "infoEmpty": "No se encontraron registros para mostrar",
        "infoFiltered": "",
        "lengthMenu": "Mostrar _MENU_",
        "search": "Buscar:",
        "zeroRecords": "No se encontraron resultados",
        "paginate": {
            "previous": "Anterior",
            "next": "Siguiente",
            "last": "Último",
            "first": "Primero",
            "page": "Página",
            "pageOf": "de"
        }
    },
    // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
    // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
    // So when dropdowns used the scrollable div should be removed. 
    //"dom": "<'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",

    "bStateSave": false, // save datatable state(pagination, sort, etc) in cookie.

    "lengthMenu": [
        [6, 15, 20, -1],
        [6, 15, 20, "All"] // change per page values here
    ],
    // set the initial value
    "pageLength": 6,
//    "columnDefs": [{// set default column settings
//            'orderable': false,
//            'targets': [0]
//        }, {
//            "searchable": false,
//            "targets": [0]
//        }],
    "order": [
        [0, "asc"]
    ] // set first column as a default sort by asc
});

var tableWrapper = jQuery('#sample_3_wrapper');

table.find('.group-checkable').change(function () {
    var set = jQuery(this).attr("data-set");
    var checked = jQuery(this).is(":checked");
    jQuery(set).each(function () {
        if (checked) {
            $(this).prop("checked", true);
        } else {
            $(this).prop("checked", false);
        }
    });
});