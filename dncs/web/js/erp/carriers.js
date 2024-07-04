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
        "info": "Registros del _START_ al _END_ de un total de _TOTAL_ registros",
        "infoEmpty": "No se encontraron registros para mostrar",
        "infoFiltered": "(filtrado de un total de _MAX_ registros)",
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

    "bStateSave": true, // save datatable state(pagination, sort, etc) in cookie.

    "lengthMenu": [
        [6, 15, 20, -1],
        [6, 15, 20, "All"] // change per page values here
    ],
    // set the initial value
    "pageLength": 6,
    "columnDefs": [{// set default column settings
            'orderable': false,
            'targets': [0]
        }, {
            "searchable": false,
            "targets": [0]
        }],
    "order": [
        [1, "asc"]
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

$('#confirm-delete').on('show.bs.modal', function (e) {
    $(this).find('.btn-ok').attr('href', $(e.relatedTarget).data('href'));
});