var guage = function (value, title, position) {
    var data = [
        {
          type: "indicator",
          mode: "gauge+number+delta",
          value: value,
          title: { text: title, font: { size: 20 } },
          delta: { reference: 400, increasing: { color: "RebeccaPurple" } },
          gauge: {
            axis: { range: [null, value+value*0.4], tickwidth: 1, tickcolor: "darkblue" },
            bar: { color: "darkblue" },
            bgcolor: "white",
            borderwidth: 1,
            bordercolor: "gray",
            steps: [
              { range: [0, value * 0.6], color: "cyan" },
              { range: [value * 0.6, value], color: "royalblue" }
            ],
            threshold: {
              line: { color: "red", width: 4 },
              thickness: 0.75,
              value: value
            }
          }
        }
      ];
      
    var layout = {
        width: 300,
        height: 250,
        margin: { t: 25, r: 25, l: 25, b: 25 },
        paper_bgcolor: "2b2e43",
        font: { color: "white", family: "Arial" }
      };

    position = position == undefined ? '' : position;
    var pos = 'guageDiv'+position;

    Plotly.newPlot(pos, data, layout);
}
