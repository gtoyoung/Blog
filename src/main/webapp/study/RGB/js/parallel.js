/**
 * @author BGH
 */

function drawParallel(data) {

    if (!data) {
        console.log('drawParallel : data null');
        return;
    }

    // data = JSON.parse(data);

    $('<div/>').appendTo('#d3js_view').attr({
        'id': 'legend'
    });

    $('<div/>').appendTo('#d3js_view').attr({
        'id': 'parallel'
    });

    $('<div/>').appendTo('#d3js_view').attr({
        'id': 'myGrid'
    });

    var dimensions = new Filter();
    var highlighter = new Selector();

    dimensions.set({
        data: data
    });

    var columns = _(data[0]).keys();
    var axes = _(columns).without('차수');

    var groups = ['1차', '2차', '3차'];
    var colors = {
        "1차": '#ff0000',
        "2차": '#062DD6',
        "3차": '#F6E700'
    };
    _(groups).each(
        function (group) {
            $('#legend').append(
                "<div class='item'><div class='color' style='background: " + colors[group] + "';></div><div class='key'>" + group + "</div></div>");
        });

    var pc = parallel(dimensions, colors);

    var slicky = new grid({
        model: dimensions,
        selector: highlighter,
        width: $(window).width(),
        columns: columns
    });

    var parallel_height = 360;
    $('#parallel').css({
        height: parallel_height + 'px',
        width: $('body').width() + 'px'
    });

    slicky.update();
    pc.render();

    highlighter.bind('change:selected', function () {
        var highlighted = this.get('selected');

        pc.highlight(highlighted);
    });


}

function init() {
    $('#trend2 select').change(function (e) {
        var event = e || window.event;

        event.cancelBubble = true;
        if (event.stopPropagation) {
            event.stopPropagation();
        }

        if (event.preventDefault) {
            event.preventDefault(); // FF
        } else {
            event.returnValue = false; // IE
        }

        $('#d3js_view').empty();
        var file = e.target.value;

        if (file == "") {
            return;
        }

        //file = "/VS/data/parallel/" + file + ".json";
        file = "json2/" + file + ".json";

        $.ajax({
            url: file,
            dataType: 'json',
            success: drawParallel,
            error: printErrorMessage
        });
    });
}

function printErrorMessage(request, status, error) {
    alert("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
}