function buildTable(data) {
    var node = document.createElement("table");
    var headerRow = document.createElement("tr");
    node.appendChild(headerRow);

    var headings = Object.keys(data[0]);

    // Could have used headings.forEach
    for (var i in headings) {
        var newHeader = document.createElement("th");
        headerRow.appendChild(newHeader);

        // More elegant: use the .textContent property of the cell
        var headerText = document.createTextNode(headings[i]);
        newHeader.appendChild(headerText);
    }

    // Again, more elegant: data.forEach
    for (var i in data) {
        var row = document.createElement("tr");
        node.appendChild(row);

        // This could have reused headings
        var rowData = Object.keys(data[i]);


        // rowData.forEach would have been nicer
        for (var j in rowData) {
            var newCell = document.createElement("td");
            row.appendChild(newCell);
            var contents = data[i][rowData[j]];
            if (typeof(contents) === "number")
                newCell.style.textAlign = "right";

            // newCell.textContent would be nicer
            newCell.appendChild(document.createTextNode(contents));
        }
    }

    return node;
}
