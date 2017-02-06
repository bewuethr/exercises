var cat = document.querySelector("#cat");
var hat = document.querySelector("#hat");

var catAngle = 0, hatAngle = Math.PI, lastTime = null;
function animate(time) {
    if (lastTime != null) {
        catAngle += (time - lastTime) * 0.001;
        hatAngle += (time - lastTime) * 0.005;
    }
    lastTime = time;
    var catTop = Math.sin(catAngle) * 20;
    var catLeft = Math.cos(catAngle) * 200 + 300;
    cat.style.top = catTop + "px";
    cat.style.left = catLeft + "px";
    hat.style.top = (catTop + Math.sin(hatAngle) * 50) + "px";
    hat.style.left = (catLeft + Math.cos(hatAngle) * 50) + "px";
    requestAnimationFrame(animate);
}
requestAnimationFrame(animate);
