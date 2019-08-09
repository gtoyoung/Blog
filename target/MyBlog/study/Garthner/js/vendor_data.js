var vendor = ["google", "apple", "microsoft", "ibm", "samsung","lg","huawei"];
var year =["2014","2013","2012","2011","2010"];
var select = null;


d3.select("#vendor").on("change", function () {
        select = this.value;
});
d3.select("#year").on("change", function () {
        fun2(this.value);
});
//d3.select("#year").on("change",function(){
//    fun2(this.value);
//})