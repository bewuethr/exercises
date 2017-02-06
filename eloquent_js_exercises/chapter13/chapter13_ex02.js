function byTagName(node, tagName) {
    var elements = [];

    function findElements(node) {
        if (node.nodeType === Node.ELEMENT_NODE) {
            if (node.tagName.toLowerCase() === tagName) {
                elements.push(node);
            }
            node.childNodes.forEach(findElements);
        }
    }

    findElements(node);
    return elements;
}
