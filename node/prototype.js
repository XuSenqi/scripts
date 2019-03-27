var ele = {
    host_ids: [12,34,56],
    attached: 2
};

console.log(ele)

 var query = {};
for( var key in ele ) {
    console.log( "key:", key );
    //if( ele.hasOwnProperty( key ) && ele[key].length > 0 ) {
    if( ele[key].length > 0 ) {
        console.log( ele[key] )
        query[key] = { $in: ele[key] };
    }
    else {
        query[key] = ele[key];
    };
};

console.log( "query:", query )

function Gadget(name,color){
    this.name = name;
    this.color = color;
    this.whatAreYou = function(){
        return 'I am a' + this.color + '' + this.name;
    }
}

console.log( "Object:", Object );        

var myGa = new Gadget("pxu", "red")
console.log( myGa );        // { name: 'pxu', color: 'red', whatAreYou: [Function] }
Gadget.prototype.price = 100;
console.log( myGa );        // { name: 'pxu', color: 'red', whatAreYou: [Function] }
console.log( myGa.price );  // 100, 即添加新的属性price到原型链中，该属性会立即对所有基于该原型链创建的对象可见
