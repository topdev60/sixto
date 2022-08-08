var statusChart = false; // 2D: false, 3D: true 
$(document).ready(function () {
    var chartDataType = 0;
    var selectedProjectId = $('#projectId').val();
    $('a#elementSidebar').on('click', function (e) {
        if(selectedProjectId == ""){
            e.preventDefault();
            alert('You need to select Project');
        }
    });

    // Chart For formation Tab
    if ($('#tabType').val()) {
        chartDataType = $('#tabType').val();
    }

    if(selectedProjectId){
        CommondrawChart(selectedProjectId, statusChart, chartDataType);
    }

    $('#switchCharts').on('click', function () {
        $('#divplot').children().remove();
        var selectedProjectId = $('#projectId').val();
        statusChart = !statusChart;
        CommondrawChart(selectedProjectId, statusChart, '');
    });

    $('#selectFluids').on('click', function () {
        $('#selectFluidsForm').submit();
    });

    $('#selectSample').on('change', function () {

        $('.sample').each(function (id, ele) {
            $(ele).css('display', 'none');
        });

        var selectedSampleID = $(this).val();
        $('#sample'+selectedSampleID).show();
        FluidDrawChart(selectedSampleID);
    });
})

/**
 * 
 * @param {*selected project ID} id, statusChart 
 */
function CommondrawChart(id, statusChart, chartDataType){
    var title = {xtitle: '', ytitle: ''};
    title.ytitle = 'Double Y Axis Example';
    
    if(chartDataType == 0) title.xtitle = 'North axis';     //
    if(chartDataType == 1) title.xtitle = 'PP axis';        //For formation SubTab types -- Porepressure
    if(chartDataType == 2) title.xtitle = 'FG axis';        //For formation SubTab types -- Fracture Pressure
    if(chartDataType == 3) title.xtitle = 'TG axis';        //For formation SubTab types -- Formation Temperature
    if(chartDataType == 4) title.xtitle = 'TC axis';        //For formation SubTab types -- Lithology Table

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
                threed_plotly_chart_draw(response, title);
            }else {
                twod_plotly_chart_draw(response, title);
            }
        }
    })
}

function FluidDrawChart(sampleId) {
    
    var title = {xtitle: '', ytitle: ''};
    title.ytitle = 'Fann Reading';
    title.xtitle = 'Speed(rpm)';

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        data: {
            'sampleId': sampleId,
        },
        type: 'POST',
        url: '/getChartsSampleData',
        dataType: 'json',
        success: function (response) {
            if(statusChart){
                threed_plotly_chart_draw(response, title);
            }else {
                twod_plotly_chart_draw(response, title);
            }
        }
    })
}