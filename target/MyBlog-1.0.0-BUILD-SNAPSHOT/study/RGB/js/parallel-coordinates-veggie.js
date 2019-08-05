(function (d3) {

    window.parallel = function (model, colors) {
        var self = {},
            dimensions,
            dragging = {},
            highlighted = null,
            container = d3.select("#parallel");

        var line = d3.svg.line().interpolate('cardinal').tension(0.85),
            axis = d3.svg.axis().orient("left"),
            background,
            foreground;

        var myhighArray = new Array();

        var cars = model.get('data');

        self.update = function (data) {
            cars = data;
        };

        self.render = function () {

            container.select("svg").remove();

            var bounds = [$(container[0]).width(), $(container[0]).height()],
                //          m = [30, 10, 10, 10],
                m = [30, 20, 10, 10],
                w = bounds[0] - m[1] - m[3],
                h = bounds[1] - m[0] - m[2];

            var x = d3.scale.ordinal().rangePoints([0, w], 1), //그래프 줄이기
                y = {};

            var svg = container.append("svg:svg")
                .attr("width", w + m[1] + m[3])
                .attr("height", h + m[0] + m[2])
                .append("svg:g")
                .attr("transform", "translate(" + m[3] + "," + m[0] + ")");

            // Extract the list of dimensions and create a scale for each.
            x.domain(dimensions = d3.keys(cars[0]).filter(function (d) {
                if (d == "불안짜증") {
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([30, 50]).range([h, 0])); //범위지정
                }else if(d=="수업 참여 전략"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="암기 기억 전략"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="학업적 자기효능감"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="낙관성"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="주의 집중 전략"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="우울감"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="회피동기"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }else if(d=="논리 수학 지능"){
                    return d != "년도" && d != "차수" && d != "이름" && d != 'id' &&
                        (y[d] = d3.scale.linear().domain([20, 50]).range([h, 0])); //범위지정
                }
            }));

            // Add grey background lines for context.
            background = svg.append("svg:g")
                .attr("class", "background")
                .selectAll("path")
                .data(cars)
                .enter().append("svg:path")
                .attr("d", path);

            // Add blue foreground lines for focus.
            foreground = svg.append("svg:g")
                .attr("class", "foreground")
                .selectAll("path")
                .data(cars)
                .enter().append("svg:path")
                .attr("d", path)
                .attr("style", function (d) {
                    return "stroke:" + colors[d.차수] + ";";
                });

            // Add a group element for each dimension.
            var g = svg.selectAll(".dimension")
                .data(dimensions)
                .enter().append("svg:g")
                .attr("class", "dimension")
                .attr("transform", function (d) {
                    return "translate(" + x(d) + ")";
                })
                .call(d3.behavior.drag()
                    .on("dragstart", function (d) {
                        dragging[d] = this.__origin__ = x(d);
                        background.attr("visibility", "hidden");
                    })
                    .on("drag", function (d) {
                        dragging[d] = Math.min(w, Math.max(0, this.__origin__ += d3.event.dx));
                        foreground.attr("d", path);
                        dimensions.sort(function (a, b) {
                            return position(a) - position(b);
                        });
                        x.domain(dimensions);
                        g.attr("transform", function (d) {
                            return "translate(" + position(d) + ")";
                        })
                    })
                    .on("dragend", function (d) {
                        delete this.__origin__;
                        delete dragging[d];
                        transition(d3.select(this)).attr("transform", "translate(" + x(d) + ")");
                        transition(foreground)
                            .attr("d", path);
                        background
                            .attr("d", path)
                            .transition()
                            .delay(500)
                            .duration(0)
                            .attr("visibility", null);
                    }));
            //var y = d3.scale.linear().domain([0, 100]).range([100, 0]);
            // Add an axis and title.
            g.append("svg:g")
                .attr("class", "axis")
                .each(function (d) {
                    d3.select(this).call(axis.scale(y[d]));
                })
                .append("svg:text")
                .attr("text-anchor", "middle")
                .attr("y", -9)
                .attr("style", "font-size:13px")
                .text(String);

            // Add and store a brush for each axis.
            g.append("svg:g")
                .attr("class", "brush")
                .each(function (d) {
                    d3.select(this).call(y[d].brush = d3.svg.brush().y(y[d]).on("brush", brush));
                })
                .selectAll("rect")
                .attr("x", -12)
                .attr("width", 24);

            function position(d) {
                var v = dragging[d];
                return v == null ? x(d) : v;
            }

            // Returns the path for a given data point.
            function path(d) {
                return line(dimensions.map(function (p) {
                    return [position(p), y[p](d[p])];
                }));
            }

            // Handles a brush event, toggling the display of foreground lines.
            function brush() {
                foreground.style("display", function (d) {
                    return actives.every(function (p, i) {
                        return extents[i][0] <= d[p] && d[p] <= extents[i][1];
                    }) ? null : "none";
                });
            }

            function transition(g) {
                return g.transition().duration(500);
            }

            self.highlight = function (i) {
                if (typeof i == "undefined") {
                    d3.select("#parallel .foreground").style("opacity", function (d, j) {
                        return "1";
                    });
                    highlighted.remove();
                    for (var j = 0; j < myhighArray.length; j++) {
                        myhighArray[j].remove();
                    }
                } else {

                    var filtered = model.get('filtered');
                    var array = new Array();

                    if (filtered[i].차수) {
                        for (var j = 0; j < filtered.length; j++) {
                            if (filtered[i].차수 == filtered[j].차수) {
                                array.push(filtered[j]);
                            } else if (filtered[i].차수 == "Total") {
                                array.push(filtered[0]);
                                array.push(filtered[1]);
                                array.push(filtered[2]);
                            }
                        }
                    }
                    d3.select("#parallel .foreground").style("opacity", function (d, j) {
                        return "0.35";
                    });
                    if (highlighted != null) {
                        highlighted.remove();

                        for (var j = 0; j < myhighArray.length; j++) {
                            myhighArray[j].remove();
                        }
                    }


                    highlighted = svg.append("svg:g")
                        .attr("class", "highlight")
                        .selectAll("path")
                        .data([array[0]])
                        .enter().append("svg:path")
                        .attr("d", path)
                        .attr("style", function (d) {
                            return "stroke:" + colors[d.차수] + ";";
                        });

                    myhighArray.push(highlighted);
                    //          array = [array];
                    //          var year = model.get('filtered')[i].년도;
                    for (var j = 1; j < array.length; j++) {
                        var high = svg.append("svg:g")
                            .attr("class", "highlight")
                            .selectAll("path")
                            .data([array[j]])
                            .enter().append("svg:path")
                            .attr("d", path)
                            .attr("style", function (d) {
                                return "stroke:" + colors[d.차수] + ";";
                            });
                        myhighArray.push(high);
                    }

                }
            };
        };

        return self;
    };

})(d3);