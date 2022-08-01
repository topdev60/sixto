var twod_plotly_chart_draw = function(data, chartDataType){
    var position = 'divplot';
    var trace = {
        x: data.x,
        y: data.y,
        name: 'yaxis data',
        type: 'scatter'
    };
    var xtitle = '';
    if(chartDataType == 0) xtitle = 'North axis';
    if(chartDataType == 1) xtitle = 'PP axis';
    if(chartDataType == 2) xtitle = 'FG axis';
    if(chartDataType == 3) xtitle = 'TG axis';
    if(chartDataType == 4) xtitle = 'TC axis';
    

    var traceData = [trace];

    var layout = {
        title: 'Double Y Axis Example',
        yaxis: {
            title: 'TVD axis',
        },
        xaxis: {
            title: xtitle
        },
        paper_bgcolor: '#2b2e43',
        height: 700,
    };

    Plotly.newPlot(position, traceData, layout);
}
