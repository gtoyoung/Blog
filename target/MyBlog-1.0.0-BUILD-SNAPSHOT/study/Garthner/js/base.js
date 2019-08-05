function fun2(index) {
    var margin = {
            top: 20,
            right: 60,
            bottom: 40,
            left: 50
        },
        width = 950 - margin.left - margin.right,
        height = 600 - margin.top - margin.bottom;

    var x = d3.scale.linear()
        .domain([0, 170])
        .range([0, width]);

    var y = d3.scale.linear()
        .domain([0, 100])
        .range([height, 0]);

    var y2 = d3.scale.ordinal().rangeRoundBands([height + 81, 0]);
    var newy = d3.svg.axis().scale(y2).orient("left");

    var x2 = d3.scale.ordinal().rangeRoundBands([0, width + margin.left + margin.right]);
    var newx = d3.svg.axis().scale(x2).orient("up");

    var x3 = d3.scale.ordinal().rangeRoundBands([0, width + margin.left + margin.right]);
    var newx3 = d3.svg.axis().scale(x3).orient("bottom");
    //
    x2.domain([]);

    //
    x3.domain([]);

    var tx = d3.scale.linear()
        .domain([0, 50])
        .range([0, 100]);

    var ty = d3.scale.linear()
        .domain([0, 100])
        .range([100, 0]);

    var line = d3.svg.line()
        .interpolate("basis").tension(0.62)
        .x(function (d) {
            return x(d.num);
        })
        .y(function (d) {
            return y(d.val);
        });

    d3.tsv("data/" + vendor[select] + "/" + vendor[select] + year[index] + ".tsv", function (error, data) {
        data.forEach(function (d) {

            d.num = +d.tnum;
            d.val = +d.tval;
            d.name = d.tname;
            d.pla = d.tplateau;
        });
        var svg = d3.select("#graph2").append("svg")
            .datum(data)
            .attr("width", width + margin.left + margin.right + 49)
            .attr("height", height + 200 + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");


        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height * 1.15 + ")")
            .call(newx3);
        svg.append("text")
            .attr("class", "gps2")
            .attr("x", width + margin.left + margin.right)
            .attr("y", height - 10)
            .text("As of July" + year[index])



        //x축 생성    
        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0," + height + ")")
            .call(newx);

        svg.append("text")
            .attr("class", "gps")
            .attr("x", width + margin.left + 64)
            .attr("y", height + 93)
            .text("▶")
        svg.append("text")
            .attr("transform", "translate(" + (width / 2 + margin.left) + "," + (height + margin.bottom + 60) + ")")
            .attr("class", "xtext")
            .text("Time");;

        //y축 생성
        svg.append("g")
            .attr("class", "y axis").style("font-weight", "bold")
            .call(newy);
        svg.append("text").attr("transform", "rotate(-90)")
            .attr("class", "ytext")
            .attr("y", 0 - margin.left + 10)
            .attr("x", 0 - (height) / 2)
            .attr("dy", "1em")
            .text("Expectations");

        svg.append("text").attr("transform", "rotate(-90)")
            .attr("class", "gps")
            .attr("y", 0 - margin.left + 21)
            .attr("x", 0 - (height) + 556)
            .attr("dy", "1em")
            .text("▶");


        svg.append("path")
            .attr("class", "li")
            .attr("d", line);
        //line 생성
        svg.append("path")
            .attr("class", "line")
            .attr("d", "M34.588235294117645,513L37.882352941176464,510.3C41.17647058823529,507.6,47.76470588235293,502.2,53.52941176470587,495C59.29411764705881,487.79999999999995,64.23529411764704,478.79999999999995,68.35294117647058,469.8C72.47058823529412,460.79999999999995,75.76470588235293,451.79999999999995,78.23529411764706,442.8C80.70588235294117,433.79999999999995,82.35294117647058,424.79999999999995,84,415.79999999999995C85.6470588235294,406.79999999999995,87.29411764705881,397.79999999999995,88.94117647058822,388.79999999999995C90.58823529411764,379.7999999999999,92.23529411764704,370.79999999999995,93.88235294117646,361.79999999999995C95.52941176470587,352.79999999999995,97.17647058823528,343.79999999999995,98.8235294117647,334.8C100.47058823529412,325.79999999999995,102.11764705882352,316.79999999999995,103.76470588235293,307.8C105.41176470588235,298.79999999999995,107.05882352941174,289.79999999999995,108.70588235294116,280.8C110.35294117647057,271.79999999999995,111.99999999999997,262.79999999999995,113.64705882352939,253.8C115.29411764705881,244.79999999999998,116.94117647058823,235.79999999999998,118.58823529411765,226.8C120.23529411764706,217.79999999999998,121.88235294117646,208.79999999999998,123.52941176470587,199.79999999999998C125.17647058823528,190.79999999999995,126.8235294117647,181.79999999999995,128.4705882352941,172.79999999999995C130.11764705882354,163.79999999999995,131.76470588235293,154.79999999999998,133.41176470588235,145.8C135.05882352941177,136.8,136.70588235294116,127.80000000000001,138.35294117647058,118.8C140,109.79999999999998,141.6470588235294,100.79999999999997,143.29411764705884,91.79999999999997C144.94117647058823,82.79999999999997,146.58823529411762,73.79999999999998,149.05882352941174,64.79999999999998C151.52941176470586,55.79999999999998,154.8235294117647,46.79999999999997,158.94117647058823,37.79999999999996C163.05882352941177,28.79999999999995,168,19.799999999999955,174.58823529411762,13.499999999999961C181.17647058823528,7.199999999999969,189.41176470588232,3.5999999999999845,197.6470588235294,3.5999999999999845C205.88235294117646,3.5999999999999845,214.1176470588235,7.199999999999969,220.70588235294116,11.699999999999969C227.2941176470588,16.199999999999967,232.23529411764707,21.599999999999984,235.52941176470588,26.099999999999987C238.8235294117647,30.599999999999984,240.4705882352941,34.19999999999997,242.11764705882348,38.69999999999997C243.7647058823529,43.19999999999997,245.41176470588232,48.59999999999998,247.05882352941174,53.999999999999986C248.70588235294116,59.39999999999999,250.35294117647058,64.79999999999998,252,71.09999999999998C253.6470588235294,77.39999999999998,255.2941176470588,84.59999999999997,256.94117647058823,91.79999999999995C258.5882352941176,98.99999999999996,260.235294117647,106.19999999999996,261.88235294117646,115.19999999999997C263.52941176470586,124.19999999999999,265.17647058823525,135,266.8235294117647,144.89999999999998C268.4705882352941,154.79999999999998,270.11764705882354,163.79999999999995,271.7647058823529,173.69999999999996C273.4117647058823,183.59999999999997,275.0588235294117,194.39999999999998,276.7058823529411,205.19999999999996C278.35294117647055,215.99999999999997,280,226.79999999999995,281.6470588235294,236.69999999999996C283.2941176470588,246.59999999999997,284.94117647058823,255.6,286.5882352941176,264.6C288.2352941176471,273.6,289.88235294117646,282.6,292.35294117647055,292.5C294.82352941176464,302.4,298.11764705882354,313.2,301.4117647058823,323.1C304.70588235294116,333,308,342,312.11764705882354,351.9C316.2352941176471,361.79999999999995,321.1764705882353,372.59999999999997,325.29411764705884,380.69999999999993C329.4117647058823,388.79999999999995,332.70588235294116,394.19999999999993,338.47058823529414,402.29999999999995C344.2352941176471,410.4,352.4705882352941,421.2,360.7058823529411,431.1C368.9411764705882,441,377.17647058823525,450,385.4117647058823,456.3C393.64705882352933,462.6,401.8823529411764,466.2,410.1176470588235,467.09999999999997C418.3529411764705,468,426.58823529411757,466.19999999999993,434.8235294117646,463.5C443.0588235294117,460.79999999999995,451.2941176470588,457.19999999999993,458.7058823529411,453.59999999999997C466.1176470588235,450,472.7058823529411,446.4,478.47058823529403,442.79999999999995C484.235294117647,439.2,489.17647058823525,435.6,497.4117647058823,430.2C505.6470588235294,424.79999999999995,517.1764705882354,417.59999999999997,527.8823529411766,410.4C538.5882352941177,403.19999999999993,548.4705882352941,395.9999999999999,558.3529411764706,388.7999999999999C568.2352941176471,381.5999999999999,578.1176470588235,374.4,586.3529411764706,368.09999999999997C594.5882352941176,361.79999999999995,601.1764705882352,356.4,607.7647058823529,351C614.3529411764705,345.6,620.9411764705882,340.2,628.3529411764706,333.9C635.7647058823529,327.6,644,320.4,651.4117647058823,314.1C658.8235294117646,307.8,665.4117647058823,302.4,671.1764705882354,297.9C676.9411764705882,293.4,681.8823529411764,289.79999999999995,686.8235294117646,286.2C691.7647058823529,282.59999999999997,696.7058823529411,278.99999999999994,704.1176470588235,274.49999999999994C711.5294117647059,269.99999999999994,721.4117647058823,264.59999999999997,732.9411764705883,259.2C744.470588235294,253.79999999999998,757.6470588235293,248.39999999999998,768.3529411764705,244.79999999999998C779.0588235294116,241.2,787.2941176470587,239.39999999999998,795.5294117647059,237.59999999999997C803.7647058823528,235.79999999999995,811.9999999999999,233.99999999999997,821.0588235294116,232.2C830.1176470588234,230.39999999999998,839.9999999999999,228.59999999999997,850.7058823529411,226.79999999999998C861.4117647058822,225,872.9411764705882,223.20000000000002,885.2941176470588,221.40000000000003C897.6470588235294,219.60000000000002,910.8235294117646,217.8,928.1176470588234,216.9C945.4117647058823,216,966.8235294117646,216,977.5294117647059,216L988.2352941176471,216");


        //기간 이름
        svg.append("text")
            .attr("class", "ptext")
            .attr("x", width - 850)
            .attr("y", height + 150)
            .text("Plateau will be reached in:")

        svg.append("circle")
            .attr("class", "dot2")
            .attr("cx", width - 843)
            .attr("cy", height + 180)
            .attr("r", 7)
        svg.append("text")
            .attr("class", "dotText")
            .attr("x", width - 833)
            .attr("y", height + 186)
            .text("less than 2 years")

        svg.append("circle")
            .attr("class", "dot2_5")
            .attr("cx", width - 670)
            .attr("cy", height + 180)
            .attr("r", 7)
        svg.append("text")
            .attr("class", "dotText")
            .attr("x", width - 660)
            .attr("y", height + 186)
            .text("2 to 5 years")

        svg.append("circle")
            .attr("class", "dot5_10")
            .attr("cx", width - 540)
            .attr("cy", height + 180)
            .attr("r", 7)
        svg.append("text")
            .attr("class", "dotText")
            .attr("x", width - 530)
            .attr("y", height + 186)
            .text("5 to 10 years")

        svg.append("circle")
            .attr("class", "dot10")
            .attr("cx", width - 400)
            .attr("cy", height + 180)
            .attr("r", 7)
        svg.append("text")
            .attr("class", "dotText")
            .attr("x", width - 390)
            .attr("y", height + 186)
            .text("more than 10 years")

        svg.append("circle")
            .attr("class", "dotX")
            .attr("cx", width - 210)
            .attr("cy", height + 180)
            .attr("r", 7)
        svg.append("text")
            .attr("class", "dotText")
            .attr("x", width - 200)
            .attr("y", height + 186)
            .text("obsolete before plateau")




        /*계분선 그리기*/
        svg.selectAll("Sline")
            .data(data)
            .enter().append("line")
            .attr("class", "Sline")
            .attr("x1", 143)
            .attr("x2", 143)
            .attr("y1", 0)
            .attr("y2", height);
        svg.selectAll("Sline")
            .data(data)
            .enter().append("line")
            .attr("class", "Sline")
            .attr("x1", 252)
            .attr("x2", 252)
            .attr("y1", 0)
            .attr("y2", height);
        svg.selectAll("Sline")
            .data(data)
            .enter().append("line")
            .attr("class", "Sline")
            .attr("x1", 490)
            .attr("x2", 490)
            .attr("y1", 0)
            .attr("y2", height);
        svg.selectAll("Sline")
            .data(data)
            .enter().append("line")
            .attr("class", "Sline")
            .attr("x1", 780)
            .attr("x2", 780)
            .attr("y1", 0)
            .attr("y2", height);



        /*계분선 텍스트*/
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 70)
            .attr("y", (height + margin.bottom - 20))
            .text("Innovation");
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 70)
            .attr("y", (height + margin.bottom - 5))
            .text("Trigger");

        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 197)
            .attr("y", (height + margin.bottom - 20))
            .text("Peak of");
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 197)
            .attr("y", (height + margin.bottom - 5))
            .text("Inflated");
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 197)
            .attr("y", (height + margin.bottom + 10))
            .text("Expectations");

        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 360)
            .attr("y", (height + margin.bottom - 20))
            .text("Trough of");
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 360)
            .attr("y", (height + margin.bottom - 5))
            .text("Disillusionment");

        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 630)
            .attr("y", (height + margin.bottom - 20))
            .text("Slope of Enlightenment");


        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 860)
            .attr("y", (height + margin.bottom - 20))
            .text("Plateau of");
        svg.selectAll("Ltext")
            .data(data)
            .enter().append("text")
            .attr("class", "Ltext")
            .attr("x", 860)
            .attr("y", (height + margin.bottom - 5))
            .text("Productivity");


        //점 생성
        svg.selectAll("dot")
            .data(data)
            .enter().append("circle")
            .attr("class", function (d) {
                if (d.pla == "Less_than_two_years") {
                    return "dot2";
                } else if (d.pla == "Two_to_five_years") {
                    return "dot2_5";
                } else if (d.pla == "Five_to_10_years") {
                    return "dot5_10";
                } else if (d.pla == "More_than_10_years") {
                    return "dot10";
                } else if (d.pla == "Obsolete_before_Plateau") {
                    return "dotX";
                } else if (d.pla == "") {
                    return "notdot"
                }
            })
            .attr("cx", line.x())
            .attr("cy", line.y())
            .attr("r", 6)
            .on("mouseover", function (d) {

                d3.select(this).classed("cell-hover", true);

                d3.select("#tooltip")
                    .style("left", (d3.event.pageX) + "px")
                    .style("top", (d3.event.pageY) + "px")
                    .select("#value")
                    .text(d.name)
                    //Show the tooltip
                d3.select("#tooltip").classed("hidden", false);

            }).on("mouseout", function () {
                d3.select(this).classed("cell-hover", false);
                d3.selectAll(".rowLabel").classed("text-highlight", false);
                d3.selectAll(".colLabel").classed("text-highlight", false);
                d3.select("#tooltip2").classed("hidden", true);
                d3.select("#tooltip").classed("hidden", true);
            });

        function tabulate(data, columns) {
            var table = d3.select("body").append("table")
                .attr("style", "margin-left: 50px"),
                thead = table.append("thead"),
                tbody = table.append("tbody");

            // append the header row
            thead.append("tr")
                .selectAll("th")
                .data(columns)
                .enter()
                .append("th")
                .text(function (column) {
                    return column;
                });

            // create a row for each object in the data
            var rows = tbody.selectAll("tr")
                .data(data)
                .enter()
                .append("tr");

            // create a cell in each row for each column
            var cells = rows.selectAll("td")
                .data(function (row) {
                    return columns.map(function (column) {
                        return {
                            column: column,
                            value: row[column]
                        };
                    });
                })
                .enter()
                .append("td")
                .attr("style", "font-family: Courier") // sets the font style
                .html(function (d) {
                    return d.value;
                });

            return table;
        }
        // render the table
        var peopleTable = tabulate(data, ["tname", "tplateau"]);
    });

    d3.select("svg").remove();
    d3.select("table").remove();
};