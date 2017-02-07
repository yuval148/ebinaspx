function createHTML(Data) {
    var rawTemplate = document.getElementById("Template").innerHTML;
    var compiledTemplate = Handlebars.compile(rawTemplate);
    var ourGeneratedHTML = compiledTemplate(Data);

    var Container = document.getElementById("container");
    Container.innerHTML = ourGeneratedHTML;
}