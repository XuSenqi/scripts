var arr = [1,2,3,4,5,6,7,8,9];

console.log( arr.indexOf( 1 ) );
console.log( arr.indexOf( -1 ) );
console.log( -1 == arr.indexOf( -1 ) );

// slice
var unit = 4;
for(var i = 0; i < arr.length;){
    var slice_ids = arr.slice(i, i + 4);
    i += 4;
    console.log( slice_ids );
};

var items = [
  { name: 'Edward', value: 21 },
  { name: 'Sharpe', value: 37 },
  { name: 'And', value: 45 },
  { name: 'The', value: -12 },
  { name: 'Magnetic' },
  { name: 'Zeros', value: 37 }
];

// sort by value
items.sort(function (a, b) {
  return (a.value - b.value)
});

console.log( items );
