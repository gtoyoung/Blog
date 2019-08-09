var w = 400;
var h = 400;

var fill = d3.scale.category20();

var radians = Math.PI / 180,
    from = Math.max(-90, Math.min(90, -60)),
    to = Math.max(-90, Math.min(90, +60));
    count = 5,
    scale = d3.scale.linear();

scale.domain([0, count - 1]).range([from, to]);

function TagCloud(id) {
    //this.radians = Math.PI / 180;
    this.id = id;
    
    var svg = d3.select(this.id).append('svg')
        .attr('width', w).attr('height', h);
}

//갱신 부분....
TagCloud.prototype.draw = function (path, setting) {
    var fontSize = d3.scale[setting.scale]().range([1, 50]).domain([0, setting.maxSize]);
    var self = this;
    
    $(this.id).empty();
    
    var svg = d3.select(this.id).append('svg')
        .attr('width', w).attr('height', h);
    
    var background = svg.append("g");
    var vis = svg.append("g")
                .attr("transform", "translate(" + [w >> 1, h >> 1] + ")");
    
//    $(this.svg[0]).empty();
    
    d3.json(path, function (error, data) {        
        var layout = d3.layout.cloud().timeInterval(10)
            .size([w, h])
            .fontSize(function (d) {
                return fontSize(+d.count);
            })
            .text(function (d) {
                return d.keyword
            })
            .rotate(function () {
                return scale(~~(Math.random() * this.count));
            })
            .font("Impact")
            .on("end", function (words){
                vis.selectAll(
                    "text").data(words).enter().append("text").style(
                    "font-size",
                    function (d) {
                        return d.size + "px";
                    }).style("font-family", "Impact").style("fill",
                    function (d, i) {
                        return fill(i);
                    }).attr("text-anchor", "middle")
                .attr("transform", function (d) {
                    return "translate(" + [d.x, d.y] + ")rotate(" + d.rotate + ")";
                }).text(function (d) {
                    return d.text;
                });
            });

        if (data.length) {
            fontSize.domain([1, 50]);
        }
        layout.stop().words(data).start();
    });
}