var sliderDraw = function (value, title, position) {
    $.extend( $.ui.slider.prototype.options, { 
        animate: 300
    });
    var pos = position == undefined ? '' : position;
    console.log(value);
    $(".flat-slider-"+pos)
        .slider({
            max: value*1.5,
            min: 0,
            range: true,
            value: [20,30],
        })
        .slider("pips", {
            first: "pip",
            last: "pip"
        });
    
    // $("#flat-slider-verstical-1")
    //     .slider({
    //         max: 25,
    //         min: 0,
    //         range: "min",
    //         value: 25,
    //         orientation: "vertical"
    //     });
    
    //     $("#flat-slider-vertical-2")
    //     .slider({
    //         max: 25,
    //         min: 0,
    //         range: "max",
    //         value: 12,
    //         orientation: "vertical"
    //     });
    
    // $("#flat-slider-vertical-3")
    //     .slider({
    //         max: 25,
    //         min: 0,
    //         range: "min",
    //         value: 0,
    //         orientation: "vertical"
    //     });
    
    //     $("#flat-slider-vertical-1, #flat-slider-vertical-2, #flat-slider-vertical-3")
    //     .slider("pips", {
    //         first: "pip",
    //         last: "pip"
    //     })
    //     .slider("float");
}