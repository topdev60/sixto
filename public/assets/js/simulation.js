$(document).ready(function () {
    var selectedProjectId = $('#projectId').val();
    drawSimulationChart(selectedProjectId);
    drawGuageAndSlider(selectedProjectId);
    /*
    $('.btn-input-number').on('click', function () {
        var gauge_id        = $(this).parent().siblings('.gauge').attr('id');
        var dataTypeKey     = $(this).parent().siblings('.gauge').data('type');
        var dataValueKey    = $(this).parent().siblings('.gauge').data('value');
        var value           = $(this).siblings('.value').val();
        var tvd             = $(this).siblings('.tvd').val();
        var dataPlot        = sessionStorage.getItem(dataTypeKey);
        var dataValue       = sessionStorage.getItem(dataValueKey);

        dataPlot            = JSON.parse(dataPlot);
        dataPlot.x.push(tvd);
        dataPlot.y.push(value);
        sessionStorage.setItem(dataTypeKey, JSON.stringify(dataPlot));
        sessionStorage.setItem(dataValueKey, Number(dataValue)+Number(value));

        dataPlotResult      = dataPlot;
        dataValueResult     = Number(dataValue)+Number(value);
        var div_i = gauge_id.split('guageDiv')[1];
        console.log('div_i', div_i);

        twod_plotly_chart_draw(dataPlot, dataPlot.title, div_i);
        var title = "Guage for " + dataValueKey;
        guage(dataValueResult, title, div_i);
    })
    */

    $('.input-value').on('change', function(){
        var gauge_id        = $(this).parent().siblings('.gauge').attr('id');
        var div_i           = gauge_id.split('guageDiv')[1];
        var dataValueKey    = $(this).parent().siblings('.gauge').data('value');
        var title           = "Guage for " + dataValueKey;
        var dataValueResult = $(this).val();
        guage(dataValueResult, title, div_i);
    })
});



var drawSimulationChart = function (selectedProjectId) {

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        data: {
            'project_id': selectedProjectId,
        },
        type: 'POST',
        url: '/getDataSimulation',
        dataType: 'json',
        success: function (response) {
            let i = 0;
            for(let x in response){
                sessionStorage.setItem(x, JSON.stringify(response[x]));
                twod_plotly_chart_draw(response[x], response[x].title, i);
                i++;
            }
        }
    })
}

var drawGuageAndSlider = function (selectedProjectId) {
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
    $.ajax({
        data: {
            'project_id': selectedProjectId,
        },
        type: 'POST',
        url: '/getDataSimulationGuageAndSlider',
        dataType: 'json',   
        success: function (response) {
            console.log(response);
            var i = 0;
            var l = 0;
            for(let key in response){
                if (key == "guage") {
                    for(let k in response[key]){
                        var title = "Guage for " + k;
                        sessionStorage.setItem(k, response[key][k]);
                        guage(response[key][k], title, i);
                        i++;
                    }
                }
                // else if(key == "slider"){
                //     for(let k in response[key]){
                //         var title = "Slider for ";
                //         if (k == 'ppValue') {
                //             title = title + 'Pore Pressure';
                //         }else {
                //             title = title + 'Temperature Gradient';
                //         }
                //         sliderDraw(response[key][k], title, l);
                //         l++
                //     }
                // }
            }
        }
    })
}
