  var file2 = [{
      file_a: "json/6_4_A_b.json",
      file_b: "json/6_4_A_movie.json",
      file_c: "json/6_4_A_a.json"
            }, {
      file_a: "json/6_4_B_b.json",
      file_b: "json/6_4_B_movie.json",
      file_c: "json/6_4_B_a.json"
            }, {
      file_a: "json/6_5_b.json",
      file_b: "json/6_5_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_6_b.json",
      file_b: "json/6_6_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_7_b.json",
      file_b: "json/6_7_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_8_A_b.json",
      file_b: "json/6_8_A_movie.json",
      file_c: "json/6_8_A_a.json"
            }, {
      file_a: "json/6_8_B_b.json",
      file_b: "json/6_8_B_movie.json",
      file_c: "json/6_8_B_a.json"
            }, {
      file_a: "json/6_9_b.json",
      file_b: "json/6_9_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_10_b.json",
      file_b: "json/6_10_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_11_b.json",
      file_b: "json/6_11_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_12_A_b.json",
      file_b: "json/6_12_A_movie.json",
      file_c: "json/6_12_A_a.json"
            }, {
      file_a: "json/6_12_B_b.json",
      file_b: "json/6_12_B_movie.json",
      file_c: "json/6_12_B_a.json"
            }, {
      file_a: "json/6_13_b.json",
      file_b: "json/6_13_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_14_b.json",
      file_b: "json/6_14_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_15_b.json",
      file_b: "json/6_15_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_16_A_b.json",
      file_b: "json/6_16_A_movie.json",
      file_c: "json/6_16_A_a.json"
            }, {
      file_a: "json/6_16_B_b.json",
      file_b: "json/6_16_B_movie.json",
      file_c: "json/6_16_B_a.json"
            }, {
      file_a: "json/6_17_b.json",
      file_b: "json/6_17_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_18_b.json",
      file_b: "json/6_18_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_19_b.json",
      file_b: "json/6_19_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_20_A_b.json",
      file_b: "json/6_12_A_movie.json",
      file_c: "json/6_20_A_a.json"
            }, {
      file_a: "json/6_20_B_b.json",
      file_b: "json/6_12_B_movie.json",
      file_c: "json/6_20_B_a.json"
            }, {
      file_a: "json/6_21_b.json",
      file_b: "json/6_21_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_22_b.json",
      file_b: "json/6_22_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_23_b.json",
      file_b: "json/6_23_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_24_A_b.json",
      file_b: "json/6_24_A_movie.json",
      file_c: "json/6_24_A_a.json"
            }, {
      file_a: "json/6_24_B_b.json",
      file_b: "json/6_24_B_movie.json",
      file_c: "json/6_24_B_a.json"
            }, {
      file_a: "json/6_25_b.json",
      file_b: "json/6_25_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_26_b.json",
      file_b: "json/6_26_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_27_b.json",
      file_b: "json/6_27_a.json",
      file_c: "json/blank.json"
            }, {
      file_a: "json/6_28_A_b.json",
      file_b: "json/6_28_A_movie.json",
      file_c: "json/6_28_A_a.json"
            }, {
      file_a: "json/6_28_B_b.json",
      file_b: "json/6_28_B_movie.json",
      file_c: "json/6_28_B_a.json"
            }]


  var tagCloudA = new TagCloud('#A');

  var tagCloudB = new TagCloud('#B');

  var tagCloudC = new TagCloud('#C');

  d3.select("#tag").on("change", function () {
      if (this.value == -1) {
          window.location.reload();
      } else if (this.value == 0 || this.value == 5 || this.value == 10 || this.value == 15 || this.value == 20 || this.value == 25||this.value==30) {
          document.getElementById("taggroup1").innerHTML = "<p style='font-size: 25px'>A그룹 before</p>";
          document.getElementById("taggroup2").innerHTML = "<p style='font-size: 25px'>A그룹 movie</p>";
          document.getElementById("taggroup3").innerHTML = "<p style='font-size: 25px'>A그룹 after</p>";

      } else if (this.value == 1 || this.value == 6 || this.value == 11 || this.value == 16 || this.value == 21 || this.value == 21 || this.value == 26||this.value==31) {
          document.getElementById("taggroup1").innerHTML = "<p style='font-size: 25px'>B그룹 before</p>";
          document.getElementById("taggroup2").innerHTML = "<p style='font-size: 25px'>B그룹 movie</p>";
          document.getElementById("taggroup3").innerHTML = "<p style='font-size: 25px'>B그룹 after</p>";
      } else if (this.value == 2 || this.value == 3 || this.value == 4 || this.value == 7 || this.value == 8 || this.value == 9 || this.value == 12 || this.value == 13 || this.value == 14 || this.value == 24) {
          document.getElementById("taggroup1").innerHTML = "<p style='font-size: 25px'>A그룹 before</p>";
          document.getElementById("taggroup2").innerHTML = "<p style='font-size: 25px'>A그룹 after</p>";
          document.getElementById("taggroup3").innerHTML = "<p style='font-size: 25px'>-------</p>";
      } else if (this.value == 17 || this.value == 18 || this.value == 19 || this.value == 22 || this.value == 23 || this.value == 24 || this.value == 27 || this.value == 28 || this.value == 29) {
          document.getElementById("taggroup1").innerHTML = "<p style='font-size: 25px'>B그룹 before</p>";
          document.getElementById("taggroup2").innerHTML = "<p style='font-size: 25px'>B그룹 after</p>";
          document.getElementById("taggroup3").innerHTML = "<p style='font-size: 25px'>-------</p>";
      }

      tagCloudA.draw(file2[this.value].file_a, {
          scale: 'log',
          maxSize: 40
      });

      tagCloudB.draw(file2[this.value].file_b, {
          scale: 'log',
          maxSize: 40
      });

      tagCloudC.draw(file2[this.value].file_c, {
          scale: 'log',
          maxSize: 40
      });
  });