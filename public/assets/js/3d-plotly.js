 function threed_plotly_chart_draw(data) {

    var x = data.x;
    var y = data.y;
    var z = data.z;
    var c = 1;
    Plotly.newPlot('divplot_1', [{
    type: 'scatter3d',
    mode: 'lines',
    x: x,
    y: y,
    z: z,
    opacity: 1,
    line: {
        width: 6,
        color: c,
        reversescale: false
    }
    }], {
    height: 640
    });
}