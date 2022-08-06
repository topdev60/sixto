var statusChart = false; // 2D: false, 3D: true 
$(document).ready(function () {
    var chartDataType = 0;
    var selectedProjectId = $('#projectId').val();
    $('a#elementSidebar').on('click', function (e) {
        if(selectedProjectId == ""){
            e.preventDefault();
            alert('You need to select Project');
        }
    })
    if ($('#tabType').val()) {
        chartDataType = $('#tabType').val();
    }
    if(selectedProjectId){
        drawChart(selectedProjectId, statusChart, chartDataType);
    }

    $('#switchCharts').on('click', function () {
        $('#divplot').children().remove();
        var selectedProjectId = $('#projectId').val();
        statusChart = !statusChart;
        drawChart(selectedProjectId, statusChart, '');
        
    })
})

/**
 * 
 * @param {*selected project ID} id, statusChart 
 */
function drawChart(id, statusChart, chartDataType){
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        data: {
            'projectId': id,
            'chartDataType': chartDataType,
        },
        type: 'POST',
        url: '/getChartsData',
        dataType: 'json',
        success: function (response) {
            if(statusChart){
                threed_plotly_chart_draw(response, chartDataType);
            }else {
                twod_plotly_chart_draw(response, chartDataType);
            }
        }
    })
}

/**
 * 
 */
