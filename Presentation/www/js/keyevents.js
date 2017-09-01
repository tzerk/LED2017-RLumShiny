shinyjs.init = function() {

  $(document).keydown(function(e) {
    if (e.which == 34 || e.which == 40) {
      e.preventDefault();
      Shiny.onInputChange('forward', Math.random());
      forward = !forward;
    }
    if (e.which == 33 || e.which == 38) {
      e.preventDefault();    
      Shiny.onInputChange('back', Math.random());
      back = !back;
    }
    // Keyboard only: left arrow to navigate through tabs
    if (e.which == 37) { 
      e.preventDefault();    
      Shiny.onInputChange('altclick', Math.random());
      back = !back;
    }
    if (e.which == 190 || e.which == 32) {
      e.preventDefault();
      Shiny.onInputChange('trigger', Math.random());
      // toggleFullscreen(); // see fullscreen.js
      
    }
    if (e.which == 116 || e.which == 39) {
      e.preventDefault();
      Shiny.onInputChange('click', Math.random());
      
      /* Show/Hide sidebar on keypress. Problem: browser exits fullscreen
      if (sidebar) {
        document.querySelector('body').classList.add('sidebar-collapse');
      } else {
        document.querySelector('body').classList.remove("sidebar-collapse");
      }
      
      toggleFullscreen();
      sidebar = !sidebar;
      */
    }
  });
  
}