function changeFont(size){
    var el = [document.getElementsByTagName('p'), document.getElementsByTagName('li'),
    document.getElementsByTagName('h1'), document.getElementsByTagName('h2'),
    document.getElementsByClassName('ut'), document.getElementsByTagName('strong')];
    el.forEach(elements => {
        for (var j = 0; j < elements.length; j++) {
            var style = window.getComputedStyle(elements[j], null).getPropertyValue('font-size');
            var fontSize = parseFloat(style);
            elements[j].style.fontSize = (fontSize + size) + 'px';
        }
    });
}

function increaseFontSize() {
    changeFont(2);
}

function decreaseFontSize() {
    changeFont(-2);
}
