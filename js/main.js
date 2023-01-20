let Module = {
    canvas: (function() {
        let canvas = document.getElementById('canvas');
        canvas.addEventListener(
            "webglcontextlost",
            function(e) {
            alert('WebGL context lost. You will need to reload the page.');
            e.preventDefault();
            },
            false
        );
        return canvas;
    })(),
    onRuntimeInitialized:  function() {
        console.log('initialized');
        setTimeout(() => {
            window.dispatchEvent(new Event('resize'));
        }, 0);
    },
};

// Use the export name to instantiate the app
var app = vtkApp(Module);