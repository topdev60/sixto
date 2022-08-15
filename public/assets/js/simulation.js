$(document).ready(function () {
    var selectedProjectId = $('#projectId').val();
    drawSimulationChart(selectedProjectId);
    drawGuageAndSlider(selectedProjectId);
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
                        guage(response[key][k], title, i);
                        i++;
                    }
                }else if(key == "slider"){
                    for(let k in response[key]){
                        var title = "Slider for ";
                        if (k == 'ppValue') {
                            title = title + 'Pore Pressure';
                        }else {
                            title = title + 'Temperature Gradient';
                        }
                        sliderDraw(response[key][k], title, l);
                        l++
                    }
                }
            }
        }
    })
}
