var twod_plotly_chart_draw = function(data){
    var trace1 = {
        x: data.x,
        y: data.y,
        name: 'yaxis data',
        type: 'scatter'
    };

    // var trace2 = {
    //     x: data.x,
    //     y: data.y,
    //     name: 'yaxis2 data',
    //     yaxis: 'y2',
    //     type: 'scatter'
    // };

    var traceData = [trace1];

    var layout = {
        title: 'Double Y Axis Example',
        yaxis: {
            title: 'TVD axis',
        },
        xaxis: {
            title: 'North axis',
        },
        paper_bgcolor: '#2b2e43',
        // yaxis2: {
        // title: 'yaxis2 title',
        // titlefont: {color: 'rgb(148, 103, 189)'},
        // tickfont: {color: 'rgb(148, 103, 189)'},
        // overlaying: 'y',
        // side: 'right'
        // }
    };

    Plotly.newPlot('divplot', traceData, layout);
}
