var statusChart = false; // 2D: false, 3D: true 
$(document).ready(function () {
    var selectedProjectId = $('#projectId').val();
    if(selectedProjectId){
        drawChart(selectedProjectId, statusChart);
    }

    $('#switchCharts').on('click', function () {
        $('#divplot').children().remove();
        var selectedProjectId = $('#projectId').val();
        statusChart = !statusChart;
        drawChart(selectedProjectId, statusChart);
        
    })
})

/**
 * 
 * @param {*selected project ID} id, statusChart 
 */
function drawChart(id, statusChart){
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
            if(statusChart){
                threed_plotly_chart_draw(response);
            }else {
                twod_plotly_chart_draw(response);
            }
        }
    })
}

/**
 * 
 */
