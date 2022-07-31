$(document).ready(function () {
    var selectedProjectId = $('#projectId').val();    
    drawChart(selectedProjectId);
})

function drawChart(id){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        data: {
            'projectId': id,
        },
        type: 'POST',
        url: '/getChartsData',
        dataType: 'json',
        success: function (response) {
            twod_plotly_chart_draw(response);
        }
    })
}