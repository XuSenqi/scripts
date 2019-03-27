
var add = function( a, b ) {
    return a + b;
};

var obj = {
    value:'123',
    double:function(){
        console.log("***", this);//obj
        var that = this;
        var helper = function(){
            console.log("***",this);//global 
            that.value = add(that.value,that.value);
        }
        helper();
    }
};
obj.double();

