 function threed_plotly_chart_draw(data) { 
    var c = 1;
    var tracedata = {
        x : data.x,
        y : data.y,
        z : data.z,
        name: 'Survey 3D Charts',
        type: 'scatter3d',
        mode: 'lines',
        opacity: 1,
        line: {
            width: 6,
            color: c,
            reversescale: false
        }
    };

    var trace = [tracedata];

    var layout = {
        title: 'Double Y Axis Example',
        yaxis: {
            title: 'TVD axis',
        },
        xaxis: {
            title: 'North axis',
        },
        zaxis: {
            title: 'East axis'
        },
        height: 690,
    };
    Plotly.newPlot('divplot', trace, layout);
}