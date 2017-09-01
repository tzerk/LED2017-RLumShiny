shinyjs.init = function() {
  
  var pressed = null;
  var sidebar = true;
  
  $(document).on('keydown', function(e) {
    e.preventDefault();
    pressed = +new Date();
  });

  $(document).on('keyup', function(e) {
    var duration = +new Date() - pressed;
    pressed = null;
    
    if (e.which == 34 || e.which == 40) {
      e.preventDefault();
      Shiny.onInputChange('forward', Math.random());
    }
    if (e.which == 33 || e.which == 38) {
      e.preventDefault();
      Shiny.onInputChange('back', Math.random());
    }
    // Keyboard only: left arrow to navigate through tabs
    if (e.which == 37) { 
      e.preventDefault();    
      Shiny.onInputChange('altclick', Math.random());
    }
    if (e.which == 190 || e.which == 32) {
      e.preventDefault();
      if (duration < 80) {
        // Show/Hide sidebar on long keypress
        if (sidebar) {
          document.querySelector('body').classList.add('sidebar-collapse');
        } else {
          document.querySelector('body').classList.remove("sidebar-collapse");
        }
        
        sidebar = !sidebar;
      } else {
        Shiny.onInputChange('trigger', Math.random());
      }
      
    }
    if (e.which == 116 || e.which == 39 || e.which == 27) {
      e.preventDefault();
      //toggleFullscreen(); // see fullscreen.js
      Shiny.onInputChange('click', Math.random());
      
    }
  });
  
}