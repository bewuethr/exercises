let str = "";
let size = 8;
for (let i = 0; i < size; ++i) {
    for (let j = 0; j < size; ++j) {
        str += (j + i) % 2 ? "#" : " ";
    }
    str += "\n";
}
console.log(str)
