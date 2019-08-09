 function fun2(index) {

     d3.tsv(file[index].file_a,
         function (d) {
             return {
                 row: +d.r,
                 col: +d.c,
                 value: +d.color,
                 word: d.word
             };
         },
         function (error, data) {
             var colorScale = d3.scale.quantile()
                 .domain([0, 102])
                 .range(colors);

             var heatMap = svg1.append("g").attr("class", "g3")
                 .selectAll(".cellg")
                 .data(data, function (d) {
                     return d.row + ":" + d.col;
                 });

             heatMap.enter()
                 .append("rect")
                 .attr("x", function (d) {
                     return hccol.indexOf(d.col) * cellSize;
                 })
                 .attr("y", function (d) {
                     return hcrow.indexOf(d.row) * cellSize;
                 })
                 .attr("class", function (d) {
                     return "cell cell-border cr" + (d.row) + " cc" + (d.col);
                 })
                 .attr("width", cellSize)
                 .attr("height", cellSize)
                 .on("mouseover", function (d) {
                     //highlight text
                     d3.select(this).classed("cell-hover", true);
                     var count = d.word.split(',');
                     if (d.word == "없음") {
                         count.length = 0;
                     }
                     //Update the tooltip position and value
                     d3.select("#tooltip")
                         .style("left", (d3.event.pageX) + "px")
                         .style("top", (d3.event.pageY) + "px")
                         .select("#value")
                         .text(d.word + "(" + count.length + "개)");
                     //Show the tooltip
                     d3.select("#tooltip").classed("hidden", false);
                 })
                 .on("mouseout", function () {
                     d3.select(this).classed("cell-hover", false);
                     d3.selectAll(".rowLabel").classed("text-highlight", false);
                     d3.selectAll(".colLabel").classed("text-highlight", false);
                     d3.select("#tooltip").classed("hidden", true);
                 });

             heatMap.style("fill", function (d) {
                 return colorScale(d.value);
             }); //데이터 갱신

             heatMap.exit().remove(); //데이터 삭제
         });

     d3.tsv(file[index].file_b,
         function (d) {
             return {
                 row: +d.r,
                 col: +d.c,
                 value: +d.color,
                 word: d.word
             };
         },
         function (error, data) {
             var colorScale = d3.scale.quantile()
                 .domain([0, 102])
                 .range(colors);

             var heatMap = svg3.append("g").attr("class", "g3")
                 .selectAll(".cellg")
                 .data(data, function (d) {
                     return d.row + ":" + d.col;
                 })

             heatMap.enter()
                 .append("rect")
                 .attr("x", function (d) {
                     return hccol.indexOf(d.col) * cellSize;
                 })
                 .attr("y", function (d) {
                     return hcrow.indexOf(d.row) * cellSize;
                 })
                 .attr("class", function (d) {
                     return "cell cell-border cr" + (d.row) + " cc" + (d.col);
                 })
                 .attr("width", cellSize)
                 .attr("height", cellSize)
                 /* .on("click", function(d) {
                        var rowtext=d3.select(".r"+(d.row-1));
                        if(rowtext.classed("text-selected")==false){
                            rowtext.classed("text-selected",true);
                        }else{
                            rowtext.classed("text-selected",false);
                        }
                 })*/
                 .on("mouseover", function (d) {
                     //highlight text
                     d3.select(this).classed("cell-hover", true);
                     var count = d.word.split(',');
                     if (d.word == "없음") {
                         count.length = 0;
                     }
                     //Update the tooltip position and value
                     d3.select("#tooltip")
                         .style("left", (d3.event.pageX) + "px")
                         .style("top", (d3.event.pageY) + "px")
                         .select("#value")
                         .text(d.word + "(" + count.length + "개)");
                     //Show the tooltip
                     d3.select("#tooltip").classed("hidden", false);
                 })
                 .on("mouseout", function () {
                     d3.select(this).classed("cell-hover", false);
                     d3.selectAll(".rowLabel").classed("text-highlight", false);
                     d3.selectAll(".colLabel").classed("text-highlight", false);
                     d3.select("#tooltip").classed("hidden", true);
                 });

             heatMap.style("fill", function (d) {
                 return colorScale(d.value);
             });

             heatMap.exit().remove();
         });
     d3.tsv(file[index].file_c,
         function (d) {
             return {
                 row: +d.r,
                 col: +d.c,
                 value: +d.color,
                 word: d.word
             };
         },
         function (error, data) {
             var colorScale = d3.scale.quantile()
                 .domain([0, 102])
                 .range(colors);

             var heatMap = svg2.append("g").attr("class", "g3")
                 .selectAll(".cellg")
                 .data(data, function (d) {
                     return d.row + ":" + d.col;
                 })

             heatMap.enter()
                 .append("rect")
                 .attr("x", function (d) {
                     return hccol.indexOf(d.col) * cellSize;
                 })
                 .attr("y", function (d) {
                     return hcrow.indexOf(d.row) * cellSize;
                 })
                 .attr("class", function (d) {
                     return "cell cell-border cr" + (d.row) + " cc" + (d.col);
                 })
                 .attr("width", cellSize)
                 .attr("height", cellSize)
                 /* .on("click", function(d) {
                        var rowtext=d3.select(".r"+(d.row-1));
                        if(rowtext.classed("text-selected")==false){
                            rowtext.classed("text-selected",true);
                        }else{
                            rowtext.classed("text-selected",false);
                        }
                 })*/
                 .on("mouseover", function (d) {
                     //highlight text
                     d3.select(this).classed("cell-hover", true);
                     var count = d.word.split(',');
                     if (d.word == "없음") {
                         count.length = 0;
                     }
                     //Update the tooltip position and value
                     d3.select("#tooltip")
                         .style("left", (d3.event.pageX) + "px")
                         .style("top", (d3.event.pageY) + "px")
                         .select("#value")
                         .text(d.word + "(" + count.length + "개)");
                     //Show the tooltip

                     d3.select("#tooltip").classed("hidden", false);
                 })
                 .on("mouseout", function () {
                     d3.select(this).classed("cell-hover", false);
                     d3.selectAll(".rowLabel").classed("text-highlight", false);
                     d3.selectAll(".colLabel").classed("text-highlight", false);
                     d3.select("#tooltip").classed("hidden", true);
                 });

             heatMap.style("fill", function (d) {
                 return colorScale(d.value);
             });

             heatMap.exit().remove();
         });
 }