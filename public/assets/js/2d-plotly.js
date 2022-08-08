var twod_plotly_chart_draw = function(data, title){
    console.log(title);
    var position = 'divplot';
    var trace = {
        x: data.x,
        y: data.y,
        name: 'yaxis data',
        type: 'scatter'
    };
    var xtitle = title.xtitle;
    var ytitle = title.ytitle;
    var traceData = [trace];

    var layout = {
        title: ytitle,
        yaxis: {
            title: ytitle,
        },
        xaxis: {
            title: xtitle
        },
        paper_bgcolor: '#2b2e43',
        height: 700,
    };

    Plotly.newPlot(position, traceData, layout);
}
